import 'package:flutter/cupertino.dart';

import '../models/character.dart';
import '../models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  // dummy character data

  final List<Character> _characters = [
    Character(
      id: '1',
      name: 'Alexis The Sniffer',
      vocation: Vocation.raider,
      slogan: "Farts make me happy!!!",
    ),
    Character(
      id: '2',
      name: 'Drazen The Mighty',
      vocation: Vocation.junkie,
      slogan: 'For Christ & Glory',
    ),
  ];

  get getCharacters => _characters;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
