import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_school/repositories/models/place.dart';
import 'package:surf_school/repositories/places_repository.dart';
import 'package:surf_school/widgets/place_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Place>? _placesList;
  @override
  void initState() {
    _loadPlacesList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Surf Places'), centerTitle: true),
      body: _placesList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _placesList!.length,
              itemBuilder: (context, index) {
                final place = _placesList![index];
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

  Future<void> _loadPlacesList() async {
    _placesList = await GetIt.I<PlacesRepository>().getPlacesList();
    setState(() {});
  }
}
