import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_characters/screens/create/create_screen.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/services/character_store.dart';
import 'package:rpg_characters/shared/styled_button.dart';
import 'package:rpg_characters/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(text: "Your Characters")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            //
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.getCharacters.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: ValueKey(value.getCharacters[index].id),
                        // confirmDismiss: (direction) async {
                        //   // Show a dialog before deleting
                        //   return await showDialog(
                        //     context: context,
                        //     builder: (ctx) => AlertDialog(
                        //       title: Text("Confirm"),
                        //       content: Text(
                        //         "Do you really want to delete this item?",
                        //       ),
                        //       actions: [
                        //         TextButton(
                        //           onPressed: () => Navigator.of(ctx).pop(false),
                        //           child: Text("Cancel"),
                        //         ),
                        //         TextButton(
                        //           onPressed: () => Navigator.of(ctx).pop(true),
                        //           child: Text("Delete"),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // },
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(
                            context,
                            listen: false,
                          ).removeCharacter(value.getCharacters[index]);
                        },
                        child: CharacterCard(
                          character: value.getCharacters[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            //
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateScreen()),
                );
              },
              child: StyledHeading(text: "Create New"),
            ),
          ],
        ),
      ),
    );
  }
}
