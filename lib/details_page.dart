import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:work_with_api/contants/ui_size_helper.dart';

import 'contants/constants.dart';
import 'model/pokemon.dart';

class DetailsPage extends StatelessWidget {
  PokemonModel model;

  DetailsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UISizeHelper.getColorFromPokeType(model.type![0]),
      body: SafeArea(
        child: Stack(
          children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.chevron_left,
                        size: 28,
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          model.name ?? "",
                          style: Constants.pokemonNameTextStyle(),
                        ),
                        Text(
                          "№${model.id}",
                          style: Constants.pokemonNameTextStyle(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Chip(
                      label: Text(
                        model.type!.join(","),
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color:
                            UISizeHelper.getColorFromPokeType(model.type![0])),
                      ),
                      elevation: 10,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        elevation: 20,

                        shadowColor: Colors.red,
                        child: SizedBox(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _pokemonInformationWidget("Name", model.name),
                              _pokemonInformationWidget("Height", model.height),
                              _pokemonInformationWidget("Weight", model.weight),
                              _pokemonInformationWidget("Spawn Time", model.spawnTime),
                              _pokemonInformationWidget("Weakness", model.weaknesses),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
                top: 200,
                left: 120,
                child: CachedNetworkImage(imageUrl: model.img!,fadeInDuration: Duration(seconds: 2)))
          ] ,
        ),
      ),
    );
  }

  Widget _pokemonInformationWidget(String label, dynamic value) {
    return Padding(
     padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          if (value is List && value.isNotEmpty)
            Text(
              value.join(','),
            )
          else if (value == null)
            const Text("Not Availble")
          else
            Text(value)
        ],
      ),
    );
  }
}
