import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          'start'.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
