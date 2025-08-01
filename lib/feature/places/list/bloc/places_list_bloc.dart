import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:places_api/api_client.dart';

part 'places_list_event.dart';
part 'places_list_state.dart';

class PlacesListBloc extends Bloc<PlacesListEvent, PlacesListState> {
  PlacesListBloc() : super(PlacesListInitial()) {
    on<GetPlacesListEvent>(_onGetPlaces);
  }

  final PlacesService _service = GetIt.I.get<DioClient>().placesService;

  Future<void> _onGetPlaces(
    GetPlacesListEvent event,
    Emitter<PlacesListState> emit,
  ) async {
    emit(PlacesListLoading());
    try {
      final places = await _service.getPlaces();
      emit(PlacesListLoaded(places: places));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(PlacesListError(error: 'Не удалось загрузить места'));
    }
  }
}
