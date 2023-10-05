import 'package:dbook/core/provider/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../config/master_colors.dart';
import '../../../../config/route/route_paths.dart';
import '../../../../core/constant/dimesions.dart';
import '../../../../core/utils/utils.dart';
import '../../../core/repository/auth_repositroy.dart';
import '../../common/button_widgets.dart';
import '../../common/dialog/warning_dialog_view.dart';
import '../../common/textfields/master_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // emailController.text = "aung@gmail.com";
    // passwordController.text = "password";
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthProvider authProvider;
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: MasterColors.black,
          ),
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold, color: MasterColors.textColor3),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Utils.getBrightnessForAppBar(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    "assets/images/logo.png",
                  )),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: MasterColors.mainColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimesion.width20,
                      vertical: Dimesion.height10),
                  child: MasterTextFieldWidget(
                      hintText: "Phone",
                      textEditingController: emailController)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
                child: MasterPasswordTextFieldWidget(
                    hintText: "Password",
                    textEditingController: passwordController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimesion.height20, vertical: Dimesion.height10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  height: Dimesion.height24,
                                  width: Dimesion.height24,
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor:
                                            MasterColors.black),
                                    child: Checkbox(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3))),
                                      activeColor: MasterColors.black,
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                  )),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: MasterColors.black,
                                  fontSize: Dimesion.font12,
                                ),
                              )
                            ]),
                      ),
                    ]),
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (emailController.text == '') {
                      callWarningDialog(context, 'Please Fill Email!');
                    } else if (passwordController.text == '') {
                      callWarningDialog(context, 'Please Fil Password');
                    } else {}
                  },
                  child: BigButton(
                    buttonColor: MasterColors.mainColor,
                    text: "Login",
                  ),
                ),
              ),
              SizedBox(
                height: Dimesion.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Text("Don't have an account?",
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
                        RoutePaths.signUp,
                      );
                    },
                    child: Text('Sign Up here',
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
