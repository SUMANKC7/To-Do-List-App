import 'package:flutter/material.dart';
import 'package:todo_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
 DialogBox({
    super.key,
    this.controller,
    required this.onCancel,
    required this.onSave,
    
  });
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          children: [
            //To get input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
            ),
            // Buttons  save  ceancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
