import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_with_api/model/pokemon.dart';

class PokeService {
  static const _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokes = [];
    try {
      final Response response = await Dio().get(_url);
      final decodedResponse = jsonDecode(response.data)['pokemon'];
      pokes = (decodedResponse as List)
          .map((e) => PokemonModel.fromJson(e))
          .toList();
      return pokes;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        debugPrint(e.response!.statusCode.toString());
      } else {
        debugPrint(e.message);
        debugPrint(e.response?.statusMessage);
      }
      return pokes;
    }
  }
}
