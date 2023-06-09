import 'package:get/get.dart';
import 'package:recipe_app/src/ui/screens/auth/forget_pass_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/login_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/signup_screen.dart';
import 'package:recipe_app/src/ui/screens/intro/onboarding_screen.dart';
import 'package:recipe_app/src/ui/screens/main/home_screen.dart';
import 'package:recipe_app/src/ui/screens/recipe/detail_recipe_screen.dart';
import 'package:recipe_app/src/ui/screens/search/search_form_screen.dart';
import 'package:recipe_app/src/ui/screens/upload/step1_screen.dart';
import 'package:recipe_app/src/ui/screens/upload/step2_screen.dart';


class Routes {
  static final pages = [
    GetPage(
      name: '/intro/onboarding',
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: '/auth/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/auth/password/forget',
      page: () => ForgetScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/search/form',
      page: () => SearchFormScreen(),
    ),
    GetPage(
      name: '/recipe/detail',
      page: () => DetailReciperScreen(),
    ),
    GetPage(
      name: '/upload/step/1',
      page: () => Step1Screen(),
    ),
    GetPage(
      name: '/upload/step/2',
      page: () => Step2Screen(),
    ),
  ];
}
