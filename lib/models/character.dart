import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg_characters/models/skill.dart';
import 'package:rpg_characters/models/stats.dart';
import 'package:rpg_characters/models/vocation.dart';

class Character with Stats {
  // Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // Fields
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;
  final Set<Skill> skills = {};
  // Vocation field
  final Vocation vocation;

  // Functions
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // Getters

  bool get getIsFav => _isFav;

  // Character to firebase (map)
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "isFav": _isFav,
      "vocation": vocation.toString(),
      "skills": skills.map((skill) {
        skill.id;
      }).toList(),
      "stats": getStatsAsMap,
      "points": getPoints,
    };
  }

  // Character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // Get data from snapshot
    final data = snapshot.data()!;
    // Make Character instance
    final character = Character(
      name: data["name"] as String,
      slogan: data["slogan"] as String,
      vocation: Vocation.values.firstWhere(
        (vocation) => vocation.toString() == data["vocation"],
      ),
      id: snapshot.id,
    );

    // Update skills
    for (String id in data["skills"]) {
      Skill skill = allSkills.firstWhere((skill) => skill.id == id);
      character.updateSkill(skill);
    }
    // Set isFav
    if (data["isFav"] == true) {
      character.toggleIsFav();
    }
    // Set points and points
    character.serStats(points: data["points"], stats: data["stats"]);

    return character;
  }
}

List<Character> characters = [
  Character(
    id: '1',
    name: 'Klara',
    vocation: Vocation.wizard,
    slogan: 'Kapumf!',
  ),
  Character(
    id: '2',
    name: 'Jonny',
    vocation: Vocation.junkie,
    slogan: 'Light me up...',
  ),
  Character(
    id: '3',
    name: 'Crimson',
    vocation: Vocation.raider,
    slogan: 'Fire in the hole!',
  ),
  Character(
    id: '4',
    name: 'Shaun',
    vocation: Vocation.ninja,
    slogan: 'Alright then gang.',
  ),
];
