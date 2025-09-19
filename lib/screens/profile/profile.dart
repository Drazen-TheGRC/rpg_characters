import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/screens/profile/skill_list.dart';
import 'package:rpg_characters/screens/profile/stats_table.dart';
import 'package:rpg_characters/shared/styled_button.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:rpg_characters/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading(text: character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Basic info - image, vocation, description
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 140,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(text: character.vocation.title),
                        StyledText(text: character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Weapon, ability & slogan
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),

            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(text: "Slogan"),
                    StyledText(text: character.slogan),
                    SizedBox(height: 10),
                    StyledHeading(text: "Weapon of choice"),
                    StyledText(text: character.vocation.weapon),
                    SizedBox(height: 10),
                    StyledHeading(text: "Unique Ability"),
                    StyledText(text: character.vocation.ability),
                  ],
                ),
              ),
            ),

            // Stats & Skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character: character),
                  SkillList(character: character),
                ],
              ),
            ),

            // Save button
            StyledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: StyledHeading(text: "Character was saved."),
                    showCloseIcon: true,
                    duration: Duration(seconds: 5),
                    backgroundColor: AppColors.secondaryColor,
                  ),
                );
              },
              child: StyledHeading(text: "Save Character"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
