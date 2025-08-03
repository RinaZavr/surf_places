import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/config/repositories/search_history_repository.dart';

class SearchHistoryWidget extends StatefulWidget {
  const SearchHistoryWidget({super.key});

  @override
  State<SearchHistoryWidget> createState() => _SearchHistoryWidgetState();
}

class _SearchHistoryWidgetState extends State<SearchHistoryWidget> {
  List<String> history = [];

  @override
  void initState() {
    final rep = GetIt.I.get<SearchHistoryRepository>();
    history = rep.history.isEmpty ? rep.getHistory() : rep.history;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          history.isEmpty ? 'Вы пока ничего не искали' : 'ВЫ ИСКАЛИ',
          style: context.textExt.superSmall.copyWith(
            color: context.colorExt.trinityColor,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: history.length,
          separatorBuilder: (context, index) {
            return Divider(color: context.colorExt.trinityColor);
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: InkWell(
                onTap: () {
                  context.search.changeQuery(query: history[index]);
                },
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Text(
                        history[index],
                        style: context.textExt.text.copyWith(
                          color: context.colorExt.infoColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      child: CustomSvgIcon(
                        icon: AppIcons.delete,
                        color: context.colorExt.infoColor,
                      ),
                      onTap: () {
                        setState(() {
                          history.removeAt(index);
                          GetIt.I<SearchHistoryRepository>().updateHistory(
                            query: history[index],
                            isDelete: true,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        if (history.isNotEmpty)
          InkWell(
            onTap: () {
              setState(() {
                history.clear();
                GetIt.I<SearchHistoryRepository>().deleteHistory();
              });
            },
            child: Text(
              'Очистить историю',
              style: context.textExt.text.copyWith(
                color: context.colorExt.accentColor,
              ),
            ),
          ),
      ],
    );
  }
}
