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

  // Vocation
  final Vocation vocation;

  // Functions
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  // Getters

  bool get getIsFav => _isFav;

  // Setters
}
