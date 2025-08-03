import 'package:surf_school/repositories/models/place.dart';

abstract class AbstractPlacesRepository {
  Future<List<Place>> getPlacesList();
}
