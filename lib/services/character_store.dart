import 'package:flutter/cupertino.dart';
import 'package:rpg_characters/services/firestore_service.dart';

import '../models/character.dart';
import '../models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  // dummy character data

  final List<Character> _characters = [];

  get getCharacters => _characters;

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // Save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  // Remove character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }

  // Initially fetch characters
  void fetchCharactersOnce() async {
    if (_characters.isEmpty) {
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  //
}
