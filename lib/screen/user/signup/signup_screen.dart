import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:dbook/core/viewobject/user.dart';
import 'package:dbook/screen/common/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/master_colors.dart';
import '../../../config/route/route_paths.dart';
import '../../../core/constant/dimesions.dart';
import '../../../core/provider/auth/auth_provider.dart';
import '../../common/button_widgets.dart';
import '../../common/dialog/warning_dialog_view.dart';
import '../../common/textfields/master_textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  late AuthProvider authProvider;
  @override
  void initState() {
    super.initState();
    nameController.text = "aung11";
    emailController.text = "aua1111@gmail.com";
    passwordController.text = "password1";
    confrimPasswordController.text = "password1";
  }

  @override
  Widget build(BuildContext context) {
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
          appBarTitle: "Sign up",
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: Dimesion.height10),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MasterColors.textColor1),
                ),
                MasterTextFieldWidget(
                    hintText: "User Name",
                    textEditingController: nameController),
                SizedBox(
                  height: Dimesion.height10,
                ),
                MasterTextFieldWidget(
                    hintText: "Email", textEditingController: emailController),
                SizedBox(
                  height: Dimesion.height10,
                ),
                MasterPasswordTextFieldWidget(
                    hintText: "Password",
                    textEditingController: passwordController),
                SizedBox(
                  height: Dimesion.height10,
                ),
                MasterPasswordTextFieldWidget(
                    hintText: "Confirm Password",
                    textEditingController: confrimPasswordController),
                SizedBox(
                  height: Dimesion.height10,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (nameController.text == '') {
                        callWarningDialog(context, 'Please Fill User Name');
                      } else if (emailController.text == '') {
                        callWarningDialog(context, 'Please Fill Email');
                      } else if (passwordController.text == '') {
                        callWarningDialog(context, 'Please Fill Password');
                      } else if (confrimPasswordController.text == '') {
                        callWarningDialog(
                            context, 'Please Fill Confirm Password');
                      } else if (confrimPasswordController.text !=
                          passwordController.text) {
                        callWarningDialog(context, 'Password Does not match');
                      } else {
                        authProvider.registerUser(context,
                            user: User(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ), callBackAfterLoginSuccess: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/",
                          );
                        });
                      }
                    },
                    child: BigButton(
                      buttonColor: MasterColors.mainColor,
                      text: "Sign Up",
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimesion.height5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Text("Already Registered?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: MasterColors.black,
                            fontSize: Dimesion.font12 - 2,
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutePaths.login,
                        );
                      },
                      child: Text('Sign In here',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: Dimesion.font12 - 2,
                          )),
                    ),
                  ],
                ),
              ],
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
