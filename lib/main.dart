import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/core/const/theme_data.dart';
import 'package:newsapp/core/provider/theme_provider.dart';
import 'package:newsapp/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();
  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeChangeProvider, child) => MaterialApp(
          home: const HomeScreen(),
          routes: const {},
          theme: Styles.themeData(themeChangeProvider.getDartTheme, context),
        ),
      ),
    );
  }
}
