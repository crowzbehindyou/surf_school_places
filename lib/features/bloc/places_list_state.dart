part of 'places_list_bloc.dart';

abstract class PlacesListState extends Equatable {}

class PlacesListInitial extends PlacesListState {
  @override
  List<Object?> get props => [];
}

class PlacesListLoading extends PlacesListState {
  @override
  List<Object?> get props => [];
}

class PlacesListLoaded extends PlacesListState {
  PlacesListLoaded({required this.placesList});

  final List<Place> placesList;

  @override
  List<Object?> get props => [placesList];
}

class PlacesListLoadingFailed extends PlacesListState {
  PlacesListLoadingFailed({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
