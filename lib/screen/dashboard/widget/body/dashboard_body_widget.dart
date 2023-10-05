import 'package:flutter/material.dart';
import '../../../../config/master_config.dart';
import '../../../../core/constant/master_constants.dart';
import '../../../user/account/view/user_account_screen.dart';
import '../home/home_dashboard_view.dart';

class DashboardBodyWidget extends StatefulWidget {
  const DashboardBodyWidget({
    super.key,
    required this.currentIndex,
    required this.updateSelectedIndexWithAnimation,
    required this.updateSelectedIndexAndAppBarTitle,
    required this.updateSelectedIndex,
  });
  final int currentIndex;
  final Function updateSelectedIndex;
  final Function updateSelectedIndexWithAnimation;
  final Function updateSelectedIndexAndAppBarTitle;

  @override
  DashboardBodyWidgetState<DashboardBodyWidget> createState() =>
      DashboardBodyWidgetState<DashboardBodyWidget>();
}

class DashboardBodyWidgetState<T extends DashboardBodyWidget>
    extends State<DashboardBodyWidget> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: MasterConfig.animation_duration, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    /**
       * UI SECTION
       */
    return Builder(builder: (BuildContext context) {
      if (widget.currentIndex == MasterConst.REQUEST_CODE__ACCOUNT_FRAGMENT) {
        return const UserAccountScreen();
      }

      return const HomeDashboardViewWidget();
    });
  }
}
