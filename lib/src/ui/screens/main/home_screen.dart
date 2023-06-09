import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/src/ui/screens/user/profile_screen.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/screens/main/dashboard_screen.dart';
import 'package:recipe_app/src/ui/screens/upload/step1_screen.dart';
import 'package:recipe_app/src/ui/screens/notification/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List pages
    List<Widget> _pages = [
      DashboardScreen(),
      Step1Screen(),
      DashboardScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
    final navC = Get.put(NavbarController());
    return Obx(
      () => Scaffold(
        body: _pages.elementAt(navC.index.value),
        floatingActionButtonLocation: const FixedCenterDockedFabLocation(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            navC.setIndex(2);
          },
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: SvgPicture.asset(AssetIcons.scan),
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            selectedFontSize: 12,
            currentIndex: navC.index.value,
            onTap: (index) {
              navC.setIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: "Ana Sayfa",
                icon: SvgPicture.asset(
                  AssetIcons.home,
                  color: navC.index.value == 0
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
              BottomNavigationBarItem(
                label: "Yükleme",
                icon: SvgPicture.asset(
                  AssetIcons.edit,
                  color: navC.index.value == 1
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
              BottomNavigationBarItem(
                label: "Tara",
                icon: Icon(
                  Icons.cancel,
                  color: Colors.transparent,
                ),
              ),
              BottomNavigationBarItem(
                label: "Bildirim",
                icon: SvgPicture.asset(
                  AssetIcons.notification,
                  color: navC.index.value == 3
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profil",
                icon: SvgPicture.asset(
                  AssetIcons.profile,
                  color: navC.index.value == 4
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FixedCenterDockedFabLocation extends StandardFabLocation
    with FabCenterOffsetX, FabDockedOffsetY {
  const FixedCenterDockedFabLocation();

  @override
  String toString() => 'FloatingActionButtonLocation.fixedCenterDocked';

  @override
  double getOffsetY(
      ScaffoldPrelayoutGeometry scaffoldGeometry, double adjustment) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomMinInset = scaffoldGeometry.minInsets.bottom;
    if (bottomMinInset > 0) {
      // Hide if there's a keyboard
      return contentBottom;
    }
    return super.getOffsetY(scaffoldGeometry, adjustment);
  }
}

class NavbarController extends GetxController {
  var index = 0.obs;
  void setIndex(int page) => index.value = page;
}
