import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(

                child: Image.asset(
                  AssetImages.onboardingImg,
                  width: SizeConfig().deviceWidth(context),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                'Pişirmeye Başla',
                style: TextTypography.mH1,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  'Daha iyi yemek pişirmek için topluluğumuza katılın!',
                  style: TextTypography.sP1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.only(top: 40),
                child: ButtonWidget(
                  disable: false,
                  onPressed: () {
                    Get.toNamed('/auth/login');
                  },
                  txtButton: 'Başlayalım',
                  color: AppColors.primary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
