import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_places/common/notifiers/search_notifier.dart';
import 'package:surf_places/feature/places/search/view/widgets/places_search_result.dart';
import 'package:surf_places/feature/places/search/view/widgets/search_history_widget.dart';

class PlacesSearchBody extends StatefulWidget {
  const PlacesSearchBody({super.key});

  @override
  State<PlacesSearchBody> createState() => _PlacesSearchBodyState();
}

class _PlacesSearchBodyState extends State<PlacesSearchBody> {
  String? searchQuery;

  @override
  void didChangeDependencies() {
    searchQuery = context.watch<SearchNotifier>().query;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: searchQuery == null || searchQuery!.isEmpty
          ? SearchHistoryWidget()
          : PlacesSearchResult(searchQuery: searchQuery!),
    );
  }
}
