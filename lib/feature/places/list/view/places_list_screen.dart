import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/notifiers/search_notifier.dart';
import 'package:surf_places/feature/places/list/bloc/places_list_bloc.dart';
import 'package:surf_places/feature/places/list/view/widgets/places_list_body.dart';
import 'package:surf_places/feature/places/list/view/widgets/search_widget.dart';
import 'package:surf_places/feature/places/search/view/widgets/places_search_body.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({super.key});

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  late PlacesListBloc _bloc;
  late SearchNotifier _searchNotifier;
  bool isSearchNow = false;

  @override
  void initState() {
    _searchNotifier = SearchNotifier();
    _bloc = PlacesListBloc()..add(GetPlacesListEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _searchNotifier,
      child: BlocProvider.value(
        value: _bloc,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: Text(
              'Список интересных мест',
              style: context.textExt.subtitle,
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchWidget(
                  isSearchNow: (value) {
                    if (isSearchNow == value) return;
                    setState(() {
                      isSearchNow = value;
                      if (!isSearchNow) {
                        _searchNotifier.changeQuery(query: null);
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          body: isSearchNow ? PlacesSearchBody() : PlacesListBody(),
        ),
      ),
    );
  }
}
