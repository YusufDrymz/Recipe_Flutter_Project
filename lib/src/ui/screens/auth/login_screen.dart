import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:recipe_app/src/core/controllers/login_controller.dart';
import 'package:recipe_app/src/ui/screens/main/home_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/src/ui/utils/assets_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';
import 'package:recipe_app/src/ui/widgets/form_widget.dart';

import '../../../core/functions/google_sign_method.dart';
import '../../utils/colors_util.dart';
import '../../utils/typography_util.dart';
import '../../widgets/button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorText = 'Invalid Format/ Credentials';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleGreeting(
                      title: 'Hoşgeldiniz!',
                      subtitle: 'Lütfen Hesabınızı Giriniz',
                    ),
                    textfieldIcon(
                      controller: loginC.username,
                      hintText: 'Mail adresinizi giriniz',
                      icon: SvgPicture.asset(AssetIcons.message),
                      isRequired: 'Email zorunlu !',
                    ),
                    Obx(
                      () => textfieldPassword(
                        controller: loginC.password,
                        obsecure: loginC.showPassword.value,
                        hintText: 'Şifre',
                        isRequired: 'Şifre Zorunlu !',
                        icon: SvgPicture.asset(AssetIcons.lock),
                        onTap: () => loginC.visiblePassword(),
                      ),
                    ),
                    InkWell(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Şifremi Unuttum?',
                        style:
                            TextStyle(color: AppColors.mainText, fontSize: 15),
                      ),
                    ),
                    onTap: () => Get.toNamed('/auth/password/forget'),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(top: 50, bottom: 24),
                  child: ButtonWidget(
                    disable: false,
                    onPressed: () {
                      setState(() {
                        showSpinner = true;
                      });
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: loginC.username.text, password: loginC.password.text).then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        print(error.toString());

                        setState(() {
                          showSpinner = false;
                        });
                        if (error.toString() ==
                            '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                          setState(() {
                            errorText = 'Kullanıcı Bulunamadı. Lütfen Kaydolun 🙏';
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 5),
                            content: Text(
                              errorText,
                              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                          ),
                        );
                      });
                      setState(() {
                        errorText = 'Invalid Format/ Credentials';
                      });
                    },
                    txtButton: 'Giriş',
                    color: AppColors.primary,
                  ),
                ),
                Text('Yada', style: TextTypography.sP2),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(top: 24, bottom: 24),
                  child: ButtonIcon(
                    onPressed: () async {
                      try {
                        var user = await signInWithGoogle();
                        print(user);
                        
                      } catch (e) {
                        return print(e);
                      }
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                    },
                    txtButton: 'Google',
                    color: AppColors.secondary,
                    icon: Icon(
                      FontAwesome.google,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hesabınız yok mu ?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '  Kayıt Olun',
                          style: TextStyle(color: Color.fromRGBO(31, 204, 121, 1), fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
