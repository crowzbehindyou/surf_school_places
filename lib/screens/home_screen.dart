import 'package:flutter/material.dart';
import 'package:surf_school/models/place.dart';
import 'package:surf_school/widgets/place_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.places, super.key});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Surf Places'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return PlaceCardWidget(
            place: place,
            onCardTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Тап по карточке')));
            },
            onLikeTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Тап по лайку')));
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: 16,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: 'Места'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Настройки'),
        ],
        onTap: (_) {},
      ),
    );
  }
}


