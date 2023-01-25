import 'package:flutter/material.dart';
import 'package:work_with_api/data/poke_service.dart';
import 'package:work_with_api/widgets/appbar.dart';
import 'package:work_with_api/widgets/pokemon_list.dart';

import 'model/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PokemonModel>> pokeList;

  @override
  void initState() {
    super.initState();
    pokeList = PokeService.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ApplicationAppBar(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
