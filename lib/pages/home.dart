import 'package:aula_flutter_full07/models/planet.dart';
import 'package:aula_flutter_full07/services/planet_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String formatOrder(int id) {
    String order = '${id}th';

    if (id == 1) order = '${id}st';
    if (id == 2) order = '${id}nd';
    if (id == 3) order = '${id}rd';

    return '$order planet from the Sun';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solar System Planets'),),
      body: FutureBuilder(
        future: planetService.getList(),
        builder: (context, AsyncSnapshot<List<Planet>> snapshot) {
          List<Planet> planets = snapshot.data ?? [];
          return _buildList(planets);
        }
      ),
    );
  }

  ListView _buildList(List<Planet> planets) {
    return ListView.builder(
      itemCount: planets.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            ListTile(
              title: Text(planets[i].name),
              subtitle: Text(
                formatOrder(planets[i].id),
                textAlign: TextAlign.right,
              ),
            ),
            const Divider(color: Colors.grey)
          ],
        );
      }
    );
  }
}