part of 'place_search_bloc.dart';

@immutable
sealed class PlaceSearchEvent {}

class GetSearchResultEvent extends PlaceSearchEvent {
  GetSearchResultEvent({required this.searchQuery, this.offset});

  final String searchQuery;
  final int? offset;
}
