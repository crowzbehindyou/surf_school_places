import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_school/features/bloc/places_list_bloc.dart';
import 'package:surf_school/repositories/abstract_places_repository.dart';
import 'package:surf_school/widgets/place_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlacesListBloc _placesListBloc = PlacesListBloc(
    GetIt.I<AbstractPlacesRepository>(),
  );
  @override
  void initState() {
    _placesListBloc.add(LoadPlacesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Surf Places'), centerTitle: true),
      body: BlocBuilder<PlacesListBloc, PlacesListState>(
        bloc: _placesListBloc,
        builder: (context, state) {
          if (state is PlacesListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.placesList.length,
              itemBuilder: (context, index) {
                final place = state.placesList[index];
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
            );
          }
          if (state is PlacesListLoadingFailed) {
            return Center(
              child: Text(state.exception?.toString() ?? 'Exception'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
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
