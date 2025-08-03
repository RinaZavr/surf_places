import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:places_api/api_client.dart';
import 'package:surf_places/config/repositories/search_history_repository.dart';

part 'place_search_event.dart';
part 'place_search_state.dart';

class PlaceSearchBloc extends Bloc<PlaceSearchEvent, PlaceSearchState> {
  PlaceSearchBloc() : super(PlaceSearchState()) {
    on<GetSearchResultEvent>(_onSearchPlaces);
  }

  int _currentOffset = 0;

  Future<void> _onSearchPlaces(
    GetSearchResultEvent event,
    Emitter<PlaceSearchState> emit,
  ) async {
    try {
      if (event.offset != null) {
        _currentOffset = event.offset!;
      }

      if (_currentOffset == 0) {
        emit(state.copyWith(places: [], isLoading: true));
      }
      final nextPageAll = await GetIt.I
          .get<DioClient>()
          .placesService
          .searchPlace(query: event.searchQuery, offset: _currentOffset);
      final nextPage = nextPageAll.places;
      if (nextPage.isNotEmpty) {
        final currentPlaces = state.places;
        if (event.filters.isNotEmpty) {
          nextPage.removeWhere(
            (place) => !event.filters
                .where((filter) => filter.contains(place.place.type))
                .isNotEmpty,
          );
        }
        final newPlaces = <PlaceResult>[...currentPlaces, ...nextPage];

        emit(state.copyWith(places: newPlaces, error: '', isLoading: false));

        _currentOffset = newPlaces.length;
        if (event.filters.isEmpty) {
          await GetIt.I.get<SearchHistoryRepository>().updateHistory(
            query: event.searchQuery,
          );
        }
      }

      if (state.places.isEmpty) {
        emit(state.copyWith(error: 'Ничего не найдено', isLoading: false));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(error: 'Не удалось загрузить места', isLoading: false),
      );
    }
  }
}
