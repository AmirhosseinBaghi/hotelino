import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotelino/bootstrap.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/feachures/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/feachures/home/data/repositories/profile_repository.dart';
import 'package:hotelino/feachures/home/presentation/provider/favorite_list_provider.dart';
import 'package:hotelino/feachures/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feachures/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/feachures/onboarding/data/repositories/onboarding_repositories.dart';
import 'package:hotelino/feachures/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:hotelino/shared/servises/json_data_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
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
          create: (_) => OnboardingProvider(OnboardingRepositories())),
      ChangeNotifierProvider(
          create: (_) => HomeProvider(
              HotelRepository(jsonDataService: JsonDataService()))),
      ChangeNotifierProvider(
          create: (_) => ProfileProvider(ProfileRepository(),
              HotelRepository(jsonDataService: JsonDataService()))),
      ChangeNotifierProvider(
          create: (_) => FavoriteListProvider(
              HotelRepository(jsonDataService: JsonDataService())))
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
        title: "Hotelino",
        locale: Locale("fa", "IR"),
        supportedLocales: [Locale("fa", "IR"), Locale("en", "US")],
        localizationsDelegates: [
          PersianMaterialLocalizations.delegate,
          PersianCupertinoLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        theme: themeModeProvider.brightness == Brightness.light
            ? AppTheme.lightTheme
            : AppTheme.darkTheme,
        routes: AppRoute.routes,
        initialRoute: AppRoute.onboarding,
      );
    });
  }
}
