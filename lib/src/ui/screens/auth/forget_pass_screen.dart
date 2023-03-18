import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/src/ui/utils/assets_util.dart';
import 'package:recipe_app/src/ui/widgets/component_widget.dart';
import 'package:recipe_app/src/ui/widgets/form_widget.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                      title: 'Şifre Sıfırlama',
                      subtitle: 'Şifre sıfırlama linki için mail adresinizi giriniz',
                    ),
                    textfieldIcon(
                      controller: _email,
                      hintText: 'Email adresiniz',
                      icon: SvgPicture.asset(AssetIcons.message),
                      isRequired: 'Email zorunlu!',
                    ),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  color: Color.fromRGBO(31, 204, 121, 1),
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _email.text)
                          .then((value) {
                        Navigator.pop(context);
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 5),
                            content: Text(
                              'Invalid Credentials / Kullanıcı Bulunamadı',
                              style: TextStyle(
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
                        'Şifremi Sıfırla',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        )
      ),
    );
  }
}
