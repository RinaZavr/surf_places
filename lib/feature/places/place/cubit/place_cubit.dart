import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:places_api/api_client.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit() : super(PlaceInitial());

  Future<void> getPlace(int placeId) async {
    try {
      emit(PlaceLoading());
      final place = await GetIt.I
          .get<DioClient>()
          .placesService
          .getPlaceDetails(placeId: placeId);
      emit(PlaceLoaded(place: place));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(PlaceError(error: 'Не удалось загрузить место'));
    }
  }
}
