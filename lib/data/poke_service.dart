import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:work_with_api/model/pokemon.dart';

class PokeService {
  static const _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokes = [];
    final response = await Dio().get(_url);
    final decodedResponse = jsonDecode(response.data);
    pokes = decodedResponse;
    return pokes;
  }
}
