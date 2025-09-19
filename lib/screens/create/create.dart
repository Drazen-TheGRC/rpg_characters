import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/screens/create/vocation_card.dart';
import 'package:rpg_characters/screens/home/home.dart';
import 'package:rpg_characters/shared/styled_button.dart';
import 'package:rpg_characters/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // Variables
  // Controller
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  // Handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  // Functions
  // Free up memory when controller not in use
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // Submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: StyledHeading(text: "Close"),
              ),
            ],
            title: StyledHeading(text: "Missing Character Name"),
            content: StyledText(
              text: "Every good RPG character needs a great name...",
            ),
          );
        },
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: StyledHeading(text: "Close"),
              ),
            ],
            title: StyledHeading(text: "Missing Slogan"),
            content: StyledText(text: "Remember to add a catchy slogan..."),
          );
        },
      );
      return;
    }
    // Create a character
    characters.add(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading(text: "Character Creation")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledHeading(text: "Welcome, new player.")),
              Center(
                child: StyledText(
                  text: "Create a name and slogan for your player.",
                ),
              ),
              SizedBox(height: 30),
              // Text Fields
              // Input for name and slogan
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText(text: "Character name"),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText(text: "Character slogan"),
                ),
              ),
              SizedBox(height: 30),

              // Select vocation title
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledHeading(text: "Chose a vocation")),
              Center(
                child: StyledText(
                  text: "This determines your available skills.",
                ),
              ),

              SizedBox(height: 30),

              // Vocations
              VocationCard(
                vocation: Vocation.junkie,
                updateVocation: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                vocation: Vocation.ninja,
                updateVocation: updateVocation,
                selected: selectedVocation == Vocation.ninja,
              ),
              VocationCard(
                vocation: Vocation.raider,
                updateVocation: updateVocation,
                selected: selectedVocation == Vocation.raider,
              ),
              VocationCard(
                vocation: Vocation.wizard,
                updateVocation: updateVocation,
                selected: selectedVocation == Vocation.wizard,
              ),
              // Good luck message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledHeading(text: "Good Luck!!!")),
              Center(child: StyledText(text: "And enjoy the journey...")),
              //Button
              Center(
                child: StyledButton(
                  onPressed: () {
                    handleSubmit();
                  },
                  child: StyledHeading(text: "Create Character"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
