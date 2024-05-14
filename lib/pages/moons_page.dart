import 'package:aula_flutter_full07/models/planet.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

import 'package:aula_flutter_full07/services/moon_service.dart';

class MoonsPage extends StatefulWidget {
  const MoonsPage({super.key, required this.planet});

  final Planet planet;

  @override
  State<MoonsPage> createState() => _MoonsPageState();
}

class _MoonsPageState extends State<MoonsPage> {
  final TextEditingController _inputCtrl = TextEditingController();

  void addMoon() {
    String moon = _inputCtrl.text;
    if (moon.isEmpty) return;

    moonService.add(widget.planet.id, moon);

    setState(() {
      _inputCtrl.text = '';
    });
  }

  void remove(String moon) {
    setState(() {
      moonService.remove(widget.planet.id, moon);
    });
  }

  List<String> getMoons() {
    return moonService.getList(widget.planet.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Moons of ${widget.planet.name}')),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: addMoon,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: _inputCtrl,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Type the moon's name"
              ),
            ),
          ),
          _buildList(getMoons())
        ],
      ),
    );
  }

ListView _buildList(List<String> moons) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: moons.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.17,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    onPressed: (context) {
                      remove(moons[i]);
                    },
                  ),
                ],
              ),
              child: ListTile(
                title: Text(moons[i]),
              ),
            ),
            const Divider(color: Colors.grey)
          ],
        );
      }
    );
  }

}