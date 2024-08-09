import 'package:flutter/material.dart';
import 'package:custom_timer/screens/home_screen.dart';

class RestartDialog extends StatelessWidget {
  final VoidCallback onRestartPressed;
  const RestartDialog({super.key, required this.onRestartPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Warning'),
      content: const Text('Do you want to restart?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            onRestartPressed(); // Execute restart logic
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

void showRestartDialog(BuildContext context, VoidCallback onRestartPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RestartDialog(onRestartPressed: onRestartPressed);
    },
  );
}
