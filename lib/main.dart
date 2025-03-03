import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotelino/bootstrap.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/feachures/onboarding/data/repositories/onboarding_repositories.dart';
import 'package:hotelino/feachures/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:provider/provider.dart';

void main() async {
  final widgetsbinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsbinding);
  await lazyBootstrap();
  FlutterNativeSplash.remove();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(
              WidgetsBinding.instance.platformDispatcher.platformBrightness)),
      ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepositories()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(context, listen: false).updateTheme(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeModeProvider, child) {
      return MaterialApp(
        theme: themeModeProvider.brightness == Brightness.light
            ? AppTheme.lightTheme
            : AppTheme.darkTheme,
        routes: AppRoute.routes,
        initialRoute: AppRoute.onboarding,
      );
    });
  }
}
