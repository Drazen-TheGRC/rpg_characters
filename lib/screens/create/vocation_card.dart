import 'package:flutter/material.dart';
import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:rpg_characters/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.updateVocation,
    required this.selected,
  });

  final Vocation vocation;
  final void Function(Vocation) updateVocation;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateVocation(vocation);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,

        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                "assets/img/vocations/${vocation.image}",
                width: 80,
                colorBlendMode: BlendMode.color,
                color: !selected
                    ? Colors.black.withValues(alpha: 0.9)
                    : Colors.transparent,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(text: vocation.title),
                    StyledText(text: vocation.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
