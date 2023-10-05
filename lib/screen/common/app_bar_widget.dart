import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/master_colors.dart';
import '../../core/utils/utils.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget(
      {super.key,
      this.useSliver = false,
      this.autoLeading = true,
      this.appBarTitle,
      this.actionWidgets,
      this.leading});
  final bool useSliver;
  final String? appBarTitle;
  final List<Widget>? actionWidgets;
  final Widget? leading;
  final bool autoLeading;

  @override
  Widget build(BuildContext context) {
    if (useSliver) {
      return SliverToBoxAdapter(
          child: _AppbarWidget(
        appBarTitle: appBarTitle,
        actionWidgets: actionWidgets,
        autoLeading: autoLeading,
        leading: leading,
      ));
    } else {
      return _AppbarWidget(
        appBarTitle: appBarTitle,
        actionWidgets: actionWidgets,
        autoLeading: autoLeading,
        leading: leading,
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarWidget extends StatelessWidget {
  const _AppbarWidget(
      {required this.autoLeading,
      this.appBarTitle,
      this.actionWidgets,
      this.leading});
  final String? appBarTitle;
  final List<Widget>? actionWidgets;
  final Widget? leading;
  final bool autoLeading;

  @override
  Widget build(BuildContext context) {
    if (leading != null) {
      return AppBar(
        titleSpacing: 0,
        leading: leading,
        automaticallyImplyLeading: autoLeading,
        backgroundColor: MasterColors.appBackgorundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Utils.getBrightnessForAppBar(context),
        ),
        centerTitle: false,
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: MasterColors.mainColor),
        title: Text(appBarTitle ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: MasterColors.appBarTitleColor,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: actionWidgets,
      );
    } else {
      return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Utils.getBrightnessForAppBar(context),
        ),
        iconTheme: Theme.of(context).iconTheme,
        automaticallyImplyLeading: autoLeading,
        backgroundColor: MasterColors.appBackgorundColor,
        centerTitle: false,
        title: Text(appBarTitle ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: MasterColors.appBarTitleColor,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: actionWidgets,
      );
    }
  }
}
