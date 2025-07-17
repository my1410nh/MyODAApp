import 'package:flutter/material.dart';

class LoginDialogue extends StatelessWidget {
  const LoginDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
  Stack(
    alignment: Alignment.center,
        children: [
          const Center(
            child: Text(
              'Alert',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      const Text(
        'Incorrect username or password. Please log in again!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 25),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF18B3BD),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          'Retry',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    ],

        ),
      ),
    );
  }
}
