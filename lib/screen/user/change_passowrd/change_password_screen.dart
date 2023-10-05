import 'package:dbook/core/viewobject/common/master_value_holder.dart';
import 'package:dbook/screen/common/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:provider/provider.dart';

import '../../../config/master_colors.dart';
import '../../../core/constant/dimesions.dart';
import '../../../core/provider/auth/auth_provider.dart';
import '../../common/button_widgets.dart';
import '../../common/dialog/warning_dialog_view.dart';
import '../../common/textfields/master_textfield_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late AuthProvider authProvider;
  @override
  Widget build(BuildContext context) {
    final MasterValueHolder valueHolder =
        Provider.of<MasterValueHolder>(context);

    final AuthRepository authRepository = Provider.of<AuthRepository>(context);
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
              lazy: false,
              create: (BuildContext context) {
                authProvider = AuthProvider(authRepository: authRepository);
                return authProvider;
              }),
        ],
        child: Scaffold(
          backgroundColor: MasterColors.appBackgorundColor,
          appBar: AppbarWidget(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: MasterColors.black,
                size: Dimesion.height24,
              ),
            ),
            appBarTitle: "Change Password",
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimesion.height20,
                  ),
                  MasterPasswordTextFieldWidget(
                      hintText: "Old Password",
                      textEditingController: oldPasswordController),
                  MasterPasswordTextFieldWidget(
                      hintText: "Fill New Password",
                      textEditingController: passwordController),
                  MasterPasswordTextFieldWidget(
                      hintText: "Confirm Password",
                      textEditingController: confirmPasswordController),
                  SizedBox(
                    height: Dimesion.height10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (passwordController.text == '') {
                          callWarningDialog(context, 'Please Fill Password');
                        } else if (confirmPasswordController.text == '') {
                          callWarningDialog(
                              context, 'Please Fill Confirm Password');
                        } else if (oldPasswordController.text == '') {
                          callWarningDialog(
                              context, 'Please Fill Old Password');
                        } else {
                          await authProvider.changeUserPassword(
                            context,
                            id: valueHolder.loginUserId,
                            oldPassword: oldPasswordController.text,
                            newPassword: passwordController.text,
                          );
                        }
                      },
                      child: BigButton(
                        text: "Change Password",
                        buttonColor: MasterColors.mainColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimesion.height5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  dynamic callWarningDialog(BuildContext context, String text) {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return WarningDialog(
            message: text,
            onPressed: () {},
          );
        });
  }
}
