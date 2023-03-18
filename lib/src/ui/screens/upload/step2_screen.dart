import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/helper_controller.dart';
import 'package:recipe_app/src/ui/utils/assets_util.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class Step2Screen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final step2C = Get.put(UploadController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 70),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: pagination(currentPage: '2', nextPage: '2'),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, bottom: 10),
                      child: labelForm(label: 'İçindekiler'),
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: SvgPicture.asset(AssetIcons.drag),
                      title: textfield(
                        controller: step2C.ingredient,
                        hintText: 'İçindekileri gir',
                        isRequired: 'İçindekile zorunlu !',
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: SvgPicture.asset(AssetIcons.drag),
                      title: textfield(
                        controller: step2C.ingredient,
                        hintText: 'İçindekileri gir',
                        isRequired: 'İçindekile zorunlu !',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: ButtonOutline(
                        onPressed: () {},
                        color: AppColors.outline,
                        colorLabel: AppColors.titleText,
                        txtButton: '+ İçindekiler',
                      ),
                    ),
                    divider(),
                    Container(
                      margin: EdgeInsets.only(left: 24, bottom: 10),
                      child: labelForm(label: 'Adımlar'),
                    ),
                    ListTile(
                      minLeadingWidth: 10,
                      leading: stepNumber(number: 1),
                      title: textarea(
                        controller: step2C.ingredient,
                        hintText: 'Biraz yemeklerinden bahset',
                        minLines: 4,
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.form,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: SvgPicture.asset(AssetIcons.camera),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonDefault(
                            width: SizeConfig().deviceWidth(context) / 2.5,
                            onPressed: () {
                              Get.back();
                            },
                            txtButton: 'Geri',
                          ),
                          ButtonWidget(
                            disable: false,
                            width: SizeConfig().deviceWidth(context) / 2.5,
                            onPressed: () {
                              dialog(
                                title: 'Yükleme Başarılı',
                                subtitle: 'Tarifiniz yüklendi, profilinizde görebilirsiniz.',
                                icon: Image.asset(AssetImages.emoticonParty),
                                txtButton: 'Anasayfaya Dön',
                                onPressed: () {
                                  Get.toNamed('/home');
                                },
                              );
                            },
                            txtButton: 'Bitti',
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
