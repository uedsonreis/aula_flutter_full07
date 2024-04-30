import 'dart:convert';

import 'package:aula_flutter_full07/models/planet.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as api;

class _PlanetService {
  
  final String _url = 'https://planets-info-by-newbapi.p.rapidapi.com/api/v1/planets/';

  final Map<String, String> headers = <String, String>{
    'X-RapidAPI-Key': dotenv.env['API_KEY']!,
  };

  Future<List<Planet>> getList() async {
    final response = await api.get(Uri.parse(_url), headers: headers);
    List<dynamic> list = List.from(jsonDecode(response.body));
    List<Planet> planets = list.map((e) => Planet.fromJson(e)).toList();

    planets.sort((a, b) => a.id.compareTo(b.id));
    return planets;
  }

  Future<Planet> getById(int id) async {
    final response = await api.get(Uri.parse('$_url$id'), headers: headers);
    return Planet.fromJson(jsonDecode(response.body));
  }

}

final planetService = _PlanetService();