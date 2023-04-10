import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PaperTile extends StatelessWidget {

  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;

  PaperTile({required this.habitName,required this.habitCompleted,required this.onChanged,this.settingsTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: settingsTapped,
              icon: Icons.settings,
              backgroundColor: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            Checkbox(value: habitCompleted, onChanged: onChanged),
            SizedBox(width: 10,),
            Text(habitName),
          ]),
        ),
      ),
    );
  }
}
