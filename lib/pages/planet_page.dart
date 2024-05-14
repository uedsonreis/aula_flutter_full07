import 'package:aula_flutter_full07/models/planet.dart';
import 'package:aula_flutter_full07/pages/moons_page.dart';
import 'package:flutter/material.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Moons'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoonsPage(planet: planet)
                  ),
                );
            },
          ),
        ],
      ),
      body: _buildBody(planet)
    );
  }

  Widget _buildBody(Planet planet) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            planet.image,
            fit: BoxFit.fitWidth,
          ),
          _buildItem(planet.description),
          const Divider(color: Colors.grey),
          _buildItem('Mass: ${planet.mass}'),
          const Divider(color: Colors.grey),
          _buildItem('Volume: ${planet.volume}'),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(text, textAlign: TextAlign.justify),
    );
  }

}