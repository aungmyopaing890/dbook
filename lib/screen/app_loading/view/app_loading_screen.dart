// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:dbook/config/master_colors.dart';
import 'package:dbook/config/master_config.dart';
import 'package:flutter/material.dart';
import 'package:dbook/core/provider/auth/auth_provider.dart';
import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:provider/provider.dart';

import '../../../config/route/route_paths.dart';
import '../../../core/constant/dimesions.dart';
import '../../../core/utils/utils.dart';
import '../../../core/viewobject/common/master_value_holder.dart';

class AppLoadingView extends StatefulWidget {
  const AppLoadingView({super.key});

  @override
  State<AppLoadingView> createState() => _AppLoadingViewState();
}

class _AppLoadingViewState extends State<AppLoadingView>
    with TickerProviderStateMixin {
  MasterValueHolder? valueHolder;

  Future<dynamic> callDateFunction(
      AuthProvider provider, BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (Utils.isLogined(valueHolder)) {
      Navigator.pushReplacementNamed(
        context,
        RoutePaths.home,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        RoutePaths.login,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    valueHolder = Provider.of<MasterValueHolder?>(context);
    final AuthRepository repository = Provider.of<AuthRepository>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            lazy: false,
            create: (BuildContext context) {
              AuthProvider authProvider =
                  AuthProvider(authRepository: repository);
              callDateFunction(authProvider, context);
              return authProvider;
            }),
      ],
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loading_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: MasterColors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: Dimesion.height10),
                  height: Dimesion.height40 * 5,
                  width: Dimesion.height40 * 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text("Welcome To ${MasterConfig.app_name}",
                    style: Theme.of(context).textTheme.titleMedium!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
