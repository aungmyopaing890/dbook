import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:theme_manager/theme_manager.dart';

import 'config/master_theme_data.dart';
import 'config/route/router.dart' as router;
import 'core/provider/provider_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _AppState();
}

class _AppState extends State<MainApp> {
  Completer<ThemeData>? themeDataCompleter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildWidget>[
          ...providers,
        ],
        child: ThemeManager(
            defaultBrightnessPreference: BrightnessPreference.light,
            data: (Brightness brightness) => themeData(ThemeData.light()),
            themedWidgetBuilder: (BuildContext context, ThemeData theme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Say Taugh Mal',
                theme: theme,
                initialRoute: '/',
                onGenerateRoute: router.generateRoute,
              );
            }));
  }
}
