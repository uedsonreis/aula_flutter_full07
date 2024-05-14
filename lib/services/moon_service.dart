import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class _MoonService {

  String _getKey(int planetId) {
    return '@PlanetFlutter/moons_of_planet_$planetId';
  }

  List<String> getList(int planetId) {
    String? json = localStorage.getItem(_getKey(planetId));
    if (json == null) return [];
    return List.from(jsonDecode(json));
  }

  void add(int planetId, String moon) {
    List<String> moons = getList(planetId);
    moons.add(moon);
    localStorage.setItem(_getKey(planetId), jsonEncode(moons));
  }

  void remove(int planetId, String moon) {
    List<String> moons = getList(planetId);
    moons.remove(moon);
    localStorage.setItem(_getKey(planetId), jsonEncode(moons));
  }
}

final moonService = _MoonService();