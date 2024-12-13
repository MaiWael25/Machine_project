import 'package:flutter/material.dart';

class NextandBackButtonWidget extends StatelessWidget {
  const NextandBackButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
  });
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(Color(0xff9661A0)),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
      onPressed: onPressed,
      child: Text(
        label,
      ),
    );
  }
}
