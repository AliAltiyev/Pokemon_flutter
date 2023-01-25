import 'package:flutter/material.dart';
import '../data/poke_service.dart';
import '../model/pokemon.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> pokeList;

  @override
  void initState() {
    super.initState();
    pokeList = PokeService.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokeList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return Material(
                  child: SizedBox(
                    height: 100,
                    width: 200,
                    child: Column(
                      children: [Text(data.avgSpawns.toString())],
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.hasData.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
