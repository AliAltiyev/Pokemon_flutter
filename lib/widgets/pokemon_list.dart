import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_with_api/widgets/poke_list_item.dart';

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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data![index];
              return PokeListItem(pokemonModel: item);
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.hasData.toString());
        } else {
          return const CircularProgressIndicator(strokeWidth: 10,color: Colors.deepPurple,);
        }
      },
    );
  }
}
