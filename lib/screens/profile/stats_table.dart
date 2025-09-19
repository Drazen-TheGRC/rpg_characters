import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:rpg_characters/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable({super.key, required this.character});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Available points
          Container(
            color: AppColors.secondaryColor,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.character.getPoints > 0
                      ? Colors.yellow
                      : Colors.grey,
                ),
                SizedBox(width: 20),
                StyledTitle(text: "Stats points available"),
                Expanded(child: SizedBox(width: 20)),
                StyledHeading(text: widget.character.getPoints.toString()),
                SizedBox(width: 20),
              ],
            ),
          ),

          // Stats table
          Table(
            columnWidths: const {
              0: FractionColumnWidth(0.30), // 30% for the first column
            },
            children: widget.character.getStatsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withValues(alpha: 0.5),
                ),
                children: [
                  // Stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: StyledHeading(text: stat["title"]!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: StyledHeading(text: stat["value"]!),
                    ),
                  ),
                  // Icon to increase
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.increaseStat(stat["title"]!);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  // Icon to decrease
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.decreaseStat(stat["title"]!);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
