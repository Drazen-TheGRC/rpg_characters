import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg_characters/models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection("characters")
      .withConverter(
        fromFirestore: Character.fromFirestore,
        toFirestore: (Character character, _) {
          return character.toFirestore();
        },
      );

  // Add a new character

  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  // Get characters once

  static Future<QuerySnapshot<Character>> getCharactersOnce() async {
    return ref.get();
  }

  // Update character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      "stats": character.getStatsAsMap,
      "points": character.getPoints,
      "skills": character.skills.map((skill) => skill.id).toList(),
      "isFav": character.getIsFav,
    });
  }

  // Delete a character

  static Future<void> deleteCharacter(Character character) async {
    await ref.doc(character.id).delete();
  }
}
