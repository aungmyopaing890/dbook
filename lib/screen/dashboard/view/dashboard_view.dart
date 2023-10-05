// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dbook/config/master_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/master_colors.dart';
import '../../../core/constant/master_constants.dart';
import '../../common/app_bar_widget.dart';
import '../../common/dialog/confirm_dialog_view.dart';
import '../widget/body/dashboard_body_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);
  @override
  State<DashboardView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DashboardView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late Animation<double> animation;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late AnimationController animationControllerForFab;
  String appBarTitleName = 'Home';

  void changeAppBarTitle(String categoryName) {
    appBarTitleName = categoryName;
  }

  int? _currentIndex = MasterConst.REQUEST_CODE__HOME_FRAGMENT;

  Future<void> updateSelectedIndexWithAnimation(
      String? title, int? index) async {
    await animationController.reverse().then<dynamic>((void data) {
      if (!mounted) {
        return;
      }

      setState(() {
        appBarTitleName = title!;
        // appBarTitle = title;
        _currentIndex = index;
      });
    });
  }

  void updateSelectedIndexAndAppBarTitle(String? title, int? index) {
    setState(() {
      appBarTitleName = title!;
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: MasterConfig.animation_duration, vsync: this);

    animationControllerForFab = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this, value: 1);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      return showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialogView(
                title: 'Confirm',
                description: 'Are you sure You want To Quit',
                leftButtonText: 'Cancel',
                rightButtonText: 'Ok',
                onAgreeTap: () {
                  Navigator.pop(context, true);
                });
          }).then((dynamic value) {
        if (value) {
          SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        }
        return value;
      });
    }

    Future<void> updateSelectedIndex(int index) async {
      setState(() {
        _currentIndex = index;
      });
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppbarWidget(
          appBarTitle: appBarTitleName,
          autoLeading: false,
        ),
        body: DashboardBodyWidget(
          currentIndex: _currentIndex!,
          updateSelectedIndex: updateSelectedIndex,
          updateSelectedIndexAndAppBarTitle: updateSelectedIndexAndAppBarTitle,
          updateSelectedIndexWithAnimation: updateSelectedIndexWithAnimation,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: MasterColors.white,
          currentIndex: getBottonNavigationIndex(_currentIndex),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: MasterColors.grey,
          selectedItemColor: MasterColors.black,
          selectedLabelStyle: TextStyle(
              fontFamily: MasterConfig.default_font_family,
              color: MasterColors.black,
              fontWeight: FontWeight.w400),
          unselectedLabelStyle: TextStyle(
              fontFamily: MasterConfig.default_font_family,
              color: MasterColors.grey,
              fontWeight: FontWeight.w400),
          onTap: (int index) {
            final dynamic returnValue =
                getIndexFromBottonNavigationIndex(index);
            updateSelectedIndexWithAnimation(returnValue[0], returnValue[1]);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/icons/home.svg",
                color: MasterColors.black,
              ),
              icon: SvgPicture.asset("assets/images/icons/home.svg"),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/images/icons/account.svg",
                color: MasterColors.black,
              ),
              icon: SvgPicture.asset("assets/images/icons/account.svg"),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  int getBottonNavigationIndex(int? param) {
    int index = 0;
    switch (param) {
      case MasterConst.REQUEST_CODE__HOME_FRAGMENT:
        index = 0;
        break;
      case MasterConst.REQUEST_CODE__ACCOUNT_FRAGMENT:
        index = 1;
        break;
      default:
        index = MasterConst.REQUEST_CODE__HOME_FRAGMENT;
        break;
    }
    return index;
  }

  dynamic getIndexFromBottonNavigationIndex(int param) {
    int index = MasterConst.REQUEST_CODE__HOME_FRAGMENT;
    String title;
    switch (param) {
      case 0:
        index = MasterConst.REQUEST_CODE__HOME_FRAGMENT;
        title = 'Home';
        break;
      case 1:
        index = MasterConst.REQUEST_CODE__ACCOUNT_FRAGMENT;
        title = 'Profile';
        break;
      default:
        index = MasterConst.REQUEST_CODE__HOME_FRAGMENT;
        title = 'Home';
        break;
    }
    return <dynamic>[title, index];
  }
}
