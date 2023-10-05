import 'package:flutter/material.dart';
import '../../../../config/master_colors.dart';
import '../../../../core/constant/dimesions.dart';

bool isFirstTime = true;

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
    required this.appBarTitleName,
  });
  final String appBarTitleName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MasterColors.appBackgorundColor,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_sharp,
              color: MasterColors.iconColor,
              size: Dimesion.iconSize25,
            )),
      ],
      centerTitle: false,
      elevation: 0,
      title: SizedBox(
        width: Dimesion.width30 * 6,
        child: Text(appBarTitleName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: MasterColors.appBarTitleColor,
                fontWeight: FontWeight.normal)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
