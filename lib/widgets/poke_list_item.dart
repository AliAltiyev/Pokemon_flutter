import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/pokemon.dart';

class PokeListItem extends StatelessWidget {
  PokemonModel pokemonModel;

  PokeListItem({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
      elevation: 5,
      color: Colors.green,
      child: Column(
        children: [
          Text(pokemonModel.name!),
          Chip(label: Text(pokemonModel.type![0]))
        ],
      ),
    );
  }
}
