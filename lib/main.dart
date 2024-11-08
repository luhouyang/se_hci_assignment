import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/pages/login_page.dart';
import 'package:hotel_management/states/app_state.dart';
import 'package:hotel_management/widgets/ui_color.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppState(savedThemeMode: savedThemeMode ?? AdaptiveThemeMode.light),
          ),
        ],
        child: AdaptiveTheme(
          light: lightTheme,
          dark: darkTheme,
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder: (light, dark) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            home: const LoginPage(),
          ),
        ));
  }
}
