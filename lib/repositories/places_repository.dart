import 'package:dio/dio.dart';
import 'package:surf_school/repositories/abstract_places_repository.dart';
import 'package:surf_school/repositories/models/place.dart';

class PlacesRepository implements AbstractPlacesRepository{

  PlacesRepository({required this.dio});
  final Dio dio;

  
  @override
  Future<List<Place>> getPlacesList() async {
  final response = await dio.get('http://109.73.206.134:8888/api/places');

  final data = response.data as List<dynamic>;

  final placesList = data.map((e) {
    final mapOfPlaces = e as Map<String, dynamic>;

    final urls = mapOfPlaces['urls'] as List<dynamic>? ?? [];
    final firstImage = urls.isNotEmpty ? urls.first.toString() : 'http://109.73.206.134:8888/uploads/olyrusqgwzatsijsoq31kqra1tucr0tu.jpg';

    return Place(
      name: mapOfPlaces['name'] as String,
      description: mapOfPlaces['description'] as String,
      type: mapOfPlaces['type'] as String,
      images: firstImage,
    );
  }).toList();

  return placesList;
}
}
