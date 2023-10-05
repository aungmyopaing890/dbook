import 'package:dbook/config/master_config.dart';
import 'package:flutter/material.dart';
import '../../../config/master_colors.dart';
import '../../../config/route/route_paths.dart';
import '../../../core/constant/dimesions.dart';

class LoginOrSignUpView extends StatefulWidget {
  const LoginOrSignUpView({Key? key}) : super(key: key);

  @override
  State<LoginOrSignUpView> createState() => _LoginOrSignUpViewState();
}

class _LoginOrSignUpViewState extends State<LoginOrSignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimesion.height50,
              ),
              alignment: Alignment.center,
              child: SizedBox(
                  height: Dimesion.height40 * 6,
                  width: Dimesion.width30 * 8,
                  child: Image.asset("assets/images/logo.png")),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: Dimesion.height30),
              child: Text("Welcome To ${MasterConfig.app_name}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith()),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.login,
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: Dimesion.height30),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MasterColors.mainColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimesion.height10)),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: MasterColors.white,
                      fontSize: Dimesion.font12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.signUp,
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: Dimesion.height30, vertical: Dimesion.height20),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: MasterColors.mainColor, width: 1),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimesion.height10)),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: MasterColors.mainColor,
                      fontSize: Dimesion.font12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
