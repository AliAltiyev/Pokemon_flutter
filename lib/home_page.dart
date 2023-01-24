import 'package:flutter/material.dart';
import 'package:work_with_api/data/poke_service.dart';

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
    // TODO: implement initState
    super.initState();
    pokeList = PokeService.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
            return  Text(snapshot.hasData.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
