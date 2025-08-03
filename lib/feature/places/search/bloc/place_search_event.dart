part of 'place_search_bloc.dart';

@immutable
sealed class PlaceSearchEvent {}

class GetSearchResultEvent extends PlaceSearchEvent {
  GetSearchResultEvent({
    required this.searchQuery,
    this.offset,
    this.filters = const [],
  });

  final String searchQuery;
  final int? offset;
  final List<String> filters;
}
