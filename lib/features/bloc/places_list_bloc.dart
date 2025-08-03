import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_school/repositories/abstract_places_repository.dart';
import 'package:surf_school/repositories/models/place.dart';

part 'places_list_event.dart';
part 'places_list_state.dart';

class PlacesListBloc extends Bloc<PlacesListEvent, PlacesListState> {
  PlacesListBloc(this.placesRepository) : super(PlacesListInitial()) {
    on<LoadPlacesList>((event, emit) async {
      try {
        final placesList = await placesRepository.getPlacesList();
        emit(PlacesListLoaded(placesList: placesList));
      } on Object catch (e) {
        emit(PlacesListLoadingFailed(exception: e));
      }
    });
  }

  final AbstractPlacesRepository placesRepository;
}
