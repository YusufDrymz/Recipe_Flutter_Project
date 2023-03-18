import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/src/core/controllers/register_controller.dart';
import 'package:recipe_app/src/ui/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/screens/main/home_screen.dart';
import 'package:recipe_app/src/ui/utils/assets_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';
import 'package:recipe_app/src/ui/widgets/form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    final registerC = Get.put(RegisterController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child:  Column(
                  children: [
                    titleGreeting(
                      title: 'Hoşgeldiniz!',
                      subtitle: 'Lütfen Hesabınızı Giriniz',
                    ),
                    textfieldIcon(
                      controller: registerC.username,
                      hintText: 'Mail adresinizi giriniz',
                      icon: SvgPicture.asset(AssetIcons.message),
                      isRequired: 'Email adresi zorunlu!',
                    ),
                    Obx(
                      () => textfieldPassword(
                        controller: registerC.password,
                        obsecure: registerC.showPassword.value,
                        hintText: 'Şifre',
                        isRequired: 'Şifre zorunlu !',
                        icon: SvgPicture.asset(AssetIcons.lock),
                        onTap: () => registerC.visiblePassword(),
                      ),
                    )
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  color: Color.fromRGBO(31, 204, 121, 1),
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        showSpinner = true;
                      });
                      FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: registerC.username.text,
                            password: registerC.password.text)
                        .then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      setState(() {
                          showSpinner = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 5),
                            content: Text(
                            error.toString().substring(30),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          ),
                        );
                      });
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 110),
                      child: Text(
                        'Kayıt Olun',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
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
                      "Hesabınız var mı ?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '  Giriş Yap',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
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
