import 'package:dio/dio.dart';
import 'package:places_api/src/models/place_model.dart';
import 'package:places_api/src/models/place_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'places_service.g.dart';

@RestApi()
abstract class PlacesService {
  factory PlacesService(Dio dio, {String baseUrl}) = _PlacesService;

  @GET('/api/places')
  Future<List<Place>> getPlaces({@Query('page') int page = 1});

  @GET('/api/places{place_id}')
  Future<Place> getPlaceDetails({@Path('place_id') required int placeId});

  @GET('/api/places/search')
  Future<PlaceResponse> searchPlace({
    @Query('q') required String query,
    @Query('limit') int limit = 20,
    @Query('offset') int offset = 0,
  });
}
