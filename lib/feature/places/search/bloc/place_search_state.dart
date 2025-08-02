part of 'place_search_bloc.dart';

class PlaceSearchState {
  const PlaceSearchState({
    this.places = const [],
    this.error = '',
    this.isLoading = false,
  });

  final List<PlaceResult> places;
  final String error;
  final bool isLoading;

  PlaceSearchState copyWith({
    List<PlaceResult>? places,
    String? error,
    bool? isLoading,
  }) => PlaceSearchState(
    places: places ?? this.places,
    error: error ?? this.error,
    isLoading: isLoading ?? this.isLoading,
  );
}
