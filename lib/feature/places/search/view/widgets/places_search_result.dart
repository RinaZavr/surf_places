import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_image_widget.dart';
import 'package:surf_places/common/widgets/empty_data_screen.dart';
import 'package:surf_places/config/router/routes.dart';
import 'package:surf_places/feature/places/search/bloc/place_search_bloc.dart';

class PlacesSearchResult extends StatefulWidget {
  const PlacesSearchResult({
    required this.searchQuery,
    super.key,
    this.filters = const [],
  });

  final String searchQuery;
  final List<String> filters;

  @override
  State<PlacesSearchResult> createState() => _PlacesSearchResultState();
}

class _PlacesSearchResultState extends State<PlacesSearchResult> {
  late PlaceSearchBloc _bloc;

  @override
  void initState() {
    _bloc = PlaceSearchBloc()
      ..add(GetSearchResultEvent(searchQuery: widget.searchQuery));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PlacesSearchResult oldWidget) {
    if (widget.searchQuery != oldWidget.searchQuery ||
        widget.filters != oldWidget.filters) {
      _bloc.add(
        GetSearchResultEvent(
          searchQuery: widget.searchQuery,
          offset: 0,
          filters: widget.filters,
        ),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<PlaceSearchBloc, PlaceSearchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator();
          }
          if (state.places.isNotEmpty) {
            return NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.metrics.extentAfter == 0) {
                  _bloc.add(
                    GetSearchResultEvent(searchQuery: widget.searchQuery),
                  );
                  return true;
                }
                return false;
              },
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: state.places.length,
                separatorBuilder: (context, index) =>
                    Divider(indent: MediaQuery.of(context).size.width * 0.15),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      PlaceRoute(
                        id: state.places[index].place.id,
                      ).push(context);
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        state.places[index].place.name,
                        style: context.textExt.text,
                      ),
                    ),
                    subtitle: Text(
                      state.places[index].place.type,
                      style: context.textExt.small.copyWith(
                        color: context.colorExt.infoColor,
                      ),
                    ),
                    leading: AspectRatio(
                      aspectRatio: 1,
                      child: CustomImageWidget(
                        path: state.places[index].place.urls.firstOrNull,
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return EmptyDataScreen(
            icon: AppIcons.search,
            text: 'Ничего не найдено',
            subtitle: 'Попробуйте изменить параметры поиска',
          );
        },
      ),
    );
  }
}
