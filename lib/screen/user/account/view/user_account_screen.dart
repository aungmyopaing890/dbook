import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/master_colors.dart';
import '../../../../config/route/route_paths.dart';
import '../../../../core/constant/dimesions.dart';
import '../../../../core/provider/auth/auth_provider.dart';
import '../../../../core/repository/auth_repositroy.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/viewobject/common/master_value_holder.dart';
import '../../../common/call_login_view.dart';
import '../../../common/dialog/confirm_dialog_view.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  late AuthProvider authProvider;
  MasterValueHolder? valueHolder;

  @override
  Widget build(BuildContext context) {
    valueHolder = Provider.of<MasterValueHolder>(context);

    final AuthRepository authRepository = Provider.of<AuthRepository>(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
              lazy: false,
              create: (BuildContext context) {
                authProvider = AuthProvider(authRepository: authRepository);
                return authProvider;
              }),
        ],
        child: Utils.isLogined(valueHolder)
            ? Scaffold(
                backgroundColor: MasterColors.appBackgorundColor,
                body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: Dimesion.height100,
                          width: Dimesion.height100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                Image.asset('assets/images/default_user.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimesion.height10),
                          alignment: Alignment.center,
                          child: Text(
                            valueHolder?.loginUserName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimesion.height10),
                          alignment: Alignment.center,
                          child: Text(
                            valueHolder?.loginUserEmail ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimesion.height20,
                              vertical: Dimesion.height30),
                          decoration: BoxDecoration(
                            color: MasterColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.changePassword,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Dimesion.height18,
                                      vertical: Dimesion.height12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.key_outlined,
                                            size: Dimesion.height24,
                                            color: MasterColors.mainColor,
                                          ),
                                          SizedBox(
                                            width: Dimesion.height24,
                                          ),
                                          Text(
                                            'Change Password',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: MasterColors.black,
                                                    fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: MasterColors.black,
                                        size: Dimesion.height24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimesion.height20),
                                child: const Divider(
                                  height: 1,
                                  color: Colors.black38,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  return showDialog<dynamic>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ConfirmDialogView(
                                            title: 'Confirm',
                                            description:
                                                'Are you sure You want To Delete Your Account?',
                                            leftButtonText: 'Cancel',
                                            rightButtonText: 'Ok',
                                            onAgreeTap: () async {
                                              Navigator.pop(context);
                                              authProvider.deleteUser(context,
                                                  callBackAfterDeleteSuccess:
                                                      () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  "/",
                                                );
                                              });
                                            });
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Dimesion.height18,
                                      vertical: Dimesion.height12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.delete_forever,
                                            size: Dimesion.height24,
                                            color: MasterColors.mainColor,
                                          ),
                                          SizedBox(
                                            width: Dimesion.height24,
                                          ),
                                          Text(
                                            'Delete Account',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  color: MasterColors.black,
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: MasterColors.black,
                                        size: Dimesion.height24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: Dimesion.height60,
                            right: Dimesion.height60,
                            top: Dimesion.height40,
                          ),
                          decoration: BoxDecoration(
                            color: MasterColors.rejectColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  return showDialog<dynamic>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ConfirmDialogView(
                                            title: 'Confirm',
                                            description:
                                                'Are you sure You want To Logout?',
                                            leftButtonText: 'Cancel',
                                            rightButtonText: 'Ok',
                                            onAgreeTap: () async {
                                              Navigator.pop(context);
                                              authProvider.logoutUser(context,
                                                  logout: () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  "/",
                                                );
                                              });
                                            });
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Dimesion.height18,
                                      vertical: Dimesion.height8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            size: Dimesion.height24,
                                            color: MasterColors.white,
                                          ),
                                          SizedBox(
                                            width: Dimesion.height24,
                                          ),
                                          Text(
                                            'Logout',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  color: MasterColors.white,
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )))
            : const CallLoginView());
  }
}
