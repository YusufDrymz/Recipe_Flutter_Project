import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/utils/colors_util.dart';

class Button extends StatelessWidget {
  final Function ontap;
  final String title;
  const Button({
    super.key,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            ontap();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
