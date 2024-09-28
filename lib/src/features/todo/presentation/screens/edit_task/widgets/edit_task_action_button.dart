import 'package:flutter/material.dart';

class EditTaskActionButton extends StatelessWidget {
  const EditTaskActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Edit Task'),
      ),
    );
  }
}
