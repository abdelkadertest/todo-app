import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  Function() onPress;
  String lable;
  ButtonStyle? theme;

  ElevatedBtn({
    super.key,
    required this.lable,
    required this.onPress,
    this.theme
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            lable,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
