import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/utils/colors_util.dart';

class ButtonWidget extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final bool disable;
  final double width;

  ButtonWidget({required this.onPressed, required this.txtButton, required this.color, this.disable = false, this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: disable ? AppColors.form : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txtButton,
                maxLines: 1,
                style: TextStyle(
                  color: disable ? AppColors.secondaryText : Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (!disable) {
            onPressed();
          }
        },
      ),
    );
  }
}

class ButtonDefault extends StatelessWidget {
  final String txtButton;
  final GestureTapCallback onPressed;
  final double width;

  ButtonDefault({required this.onPressed, required this.txtButton, this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: AppColors.form,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txtButton,
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.mainText,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final double width;
  final Widget icon;

  ButtonIcon({required this.onPressed, required this.txtButton, required this.color, this.width = double.infinity, required this.icon});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(child: icon),
              SizedBox(width: 8),
              Text(
                txtButton,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  final String txtButton;
  final Color color;
  final Color colorLabel;
  final GestureTapCallback onPressed;
  final bool disable;
  final double width;

  ButtonOutline(
      {required this.onPressed,
      required this.txtButton,
      required this.color,
      this.disable = false,
      this.colorLabel = AppColors.outline,
      this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      //backgroundColor: disable ? AppColors.form : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
        side: BorderSide(color: disable ? AppColors.outline : color, width: 1.5),
      ),
    );
    return SizedBox(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                txtButton,
                maxLines: 1,
                style: TextStyle(
                  color: disable ? AppColors.outline : colorLabel,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (!disable) {
            onPressed();
          }
        },
      ),
    );
  }
}

class ButtonSM extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final bool disable;

  ButtonSM({
    required this.onPressed,
    required this.txtButton,
    required this.color,
    this.disable = false,
  });
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: disable ? AppColors.form : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    );
    return TextButton(
      style: flatButtonStyle,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              txtButton,
              maxLines: 1,
              style: TextStyle(
                color: disable ? AppColors.mainText : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        if (!disable) {
          onPressed();
        }
      },
    );
  }
}

Widget btnNavbar({required Widget icon, required String title}) {
  return Column(
    children: [
      IconButton(
        onPressed: () {},
        iconSize: 27.0,
        icon: icon,
      ),
      Container(child: Text(title)),
    ],
  );
}
