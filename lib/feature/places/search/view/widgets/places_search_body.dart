import 'dart:async';

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
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (!mounted) return;

    final currentQuery = context.watch<SearchNotifier>().query;
    if (currentQuery == null || currentQuery.length < 3) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        searchQuery = currentQuery;
      });
    });

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
