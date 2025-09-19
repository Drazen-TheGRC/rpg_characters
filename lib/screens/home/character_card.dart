import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/screens/profile/profile.dart';
import 'package:rpg_characters/theme.dart';

import '../../shared/styled_text.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              "assets/img/vocations/${character.vocation.image}",
              width: 80,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(text: character.name),
                StyledText(text: character.vocation.title),
              ],
            ),
            Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(character: character),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
