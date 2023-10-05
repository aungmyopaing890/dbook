import 'package:flutter/material.dart';
import '../../../../config/master_colors.dart';
import '../../../../core/constant/dimesions.dart';
import '../../config/route/route_paths.dart';
import 'button_widgets.dart';

class CallLoginView extends StatelessWidget {
  const CallLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/login.png'),
            ),
            Text(
              "Login",
              style: TextStyle(
                  color: MasterColors.textColor1,
                  fontSize: Dimesion.font16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimesion.width20, vertical: Dimesion.height40),
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.login,
                );
              },
              child: BigButton(
                buttonColor: MasterColors.mainColor,
                text: "Login",
              )),
        ));
  }
}
