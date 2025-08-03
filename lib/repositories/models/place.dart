import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String name;
  final String description;
  final String type;
  final String images;

  const Place({required this.name, required this.description, required this.type, required this.images});

  @override
  List<Object?> get props => [name, description, type, images];
}
