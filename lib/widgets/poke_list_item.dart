import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_with_api/contants/ui_size_helper.dart';

import '../contants/constants.dart';
import '../model/pokemon.dart';

class PokeListItem extends StatelessWidget {
  PokemonModel pokemonModel;

  PokeListItem({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
      elevation: 5,
      color: UISizeHelper.getColorFromPokeType(pokemonModel.type![0]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemonModel.name!,
              style: Constants.pokemonNameTextStyle(),
            ),
            Chip(
              label: Text(pokemonModel.type![0]),
              side: const BorderSide(color: Colors.white),
              shadowColor: Colors.deepPurpleAccent,
              avatar: const Icon(Icons.chevron_right_outlined),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: pokemonModel.name!.length > 10 ? 20 : 36,
                    backgroundColor: Colors.white,
                    child: CachedNetworkImage(
                      height: UISizeHelper.calculatePokeImageSize(),
                      width: UISizeHelper.calculatePokeImageSize(),
                      imageUrl: pokemonModel.img!,
                      placeholder: (context, string) =>
                          const CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
