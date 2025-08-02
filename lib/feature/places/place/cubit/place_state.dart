part of 'place_cubit.dart';

@immutable
sealed class PlaceState {}

final class PlaceInitial extends PlaceState {}

final class PlaceLoading extends PlaceState {}

final class PlaceLoaded extends PlaceState {
  PlaceLoaded({required this.place});

  final Place place;
}

final class PlaceError extends PlaceState {
  PlaceError({required this.error});

  final String error;
}
