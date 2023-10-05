import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../config/master_colors.dart';
import '../../../config/route/route_paths.dart';
import '../../../core/constant/dimesions.dart';
import '../../../core/provider/auth/auth_provider.dart';
import '../../../core/utils/utils.dart';
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
  // TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  late AuthProvider authProvider;
  @override
  void initState() {
    super.initState();
    // nameController.text = "aung11";
    // emailController.text = "aua1111@gmail.com";
    // passwordController.text = "password1";
    // confrimPasswordController.text = "password1";
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: MasterColors.black,
              size: Dimesion.height24,
            ),
          ),
          title: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold, color: MasterColors.textColor3),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: MasterColors.textColor2),
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
                  margin: EdgeInsets.only(top: Dimesion.height10),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    "assets/images/logo.png",
                  )),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MasterColors.textColor1),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
                  child: MasterTextFieldWidget(
                      hintText: "Name", textEditingController: nameController)),
              SizedBox(
                height: Dimesion.height10,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
                  child: MasterTextFieldWidget(
                      hintText: "Email",
                      textEditingController: emailController)),
              SizedBox(
                height: Dimesion.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
                child: MasterPasswordTextFieldWidget(
                    hintText: "Password",
                    textEditingController: passwordController),
              ),
              SizedBox(
                height: Dimesion.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
                child: MasterPasswordTextFieldWidget(
                    hintText: "Confirm Password",
                    textEditingController: confrimPasswordController),
              ),
              SizedBox(
                height: Dimesion.height10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (nameController.text == '') {
                      callWarningDialog(context, 'Please Fill Name');
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
                    } else {}
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
