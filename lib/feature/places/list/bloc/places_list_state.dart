part of 'places_list_bloc.dart';

@immutable
sealed class PlacesListState {}

final class PlacesListInitial extends PlacesListState {}

final class PlacesListLoading extends PlacesListState {}

final class PlacesListLoaded extends PlacesListState {
  PlacesListLoaded({required this.places});

  final List<Place> places;
}

final class PlacesListError extends PlacesListState {
  PlacesListError({required this.error});

  final String error;
}
