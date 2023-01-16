import 'package:flutter/material.dart';

class CheckModal extends StatelessWidget {
  const CheckModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: const Text(
        "Boxes can't be empty",
        textAlign: TextAlign.center,
      ),
    );
  }
}
