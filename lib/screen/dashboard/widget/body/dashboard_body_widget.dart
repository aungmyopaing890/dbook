import 'package:flutter/material.dart';
import '../../../../core/constant/master_constants.dart';
import '../../../user/account/view/user_account_screen.dart';
import '../home/home_dashboard_view.dart';

class DashboardBodyWidget extends StatefulWidget {
  const DashboardBodyWidget({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  DashboardBodyWidgetState<DashboardBodyWidget> createState() =>
      DashboardBodyWidgetState<DashboardBodyWidget>();
}

class DashboardBodyWidgetState<T extends DashboardBodyWidget>
    extends State<DashboardBodyWidget> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
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
