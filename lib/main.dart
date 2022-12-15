import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:demo_83/ui/style/theme.dart';
import 'package:demo_83/util/injectables/injectable.variables.dart';
import 'package:demo_83/util/injectables/injection.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import "bloc/settings/settings_bloc.dart";
import "data/repositories/settings_repository.dart";
import "ui/style/app.fonts.dart";
import "util/app_localization.dart";
import "util/constants.dart";
import "util/route_generator.dart";

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    configureInjection(Constants.mode);

    runApp(const Root());
  }, (error, stack) => debugPrint(error.toString()));
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  bool localeLoaded = false;
  SettingsBloc settingsBloc = SettingsBloc(SettingsDataRepository());

  @override
  void initState() {
    super.initState();
    settingsBloc.add(LoadSettings());
    getIt<InjectableVariables>().fontFamily = AppFonts.fontPoppins;
    getIt<InjectableVariables>().globalNavigatorKey = GlobalKey(debugLabel: "Main Navigator");
  }

  ThemeData getInitTheme() {
    final String fontFamily = getIt<InjectableVariables>().locale.languageCode == 'en' ? AppFonts.fontPoppins : AppFonts.fontCairo;
    if (getIt<InjectableVariables>().themeMode == ThemeMode.dark) {
      return AppTheme.darkTheme.copyWith(
        textTheme: AppTheme.darkTheme.textTheme.apply(
          fontFamily: fontFamily,
        ),
      );
    } else {
      return AppTheme.lightTheme.copyWith(
        textTheme: AppTheme.lightTheme.textTheme.apply(
          fontFamily: fontFamily,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    settingsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (BuildContext context) => settingsBloc,
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsLoaded) {
            if (getIt<InjectableVariables>().themeMode == null) {
              setState(() {
                getIt<InjectableVariables>().themeMode = state.themeMode;
              });
            }
          }
        },
        child: getIt<InjectableVariables>().themeMode == null
            ? Container()
            : ThemeProvider(
                duration: const Duration(milliseconds: 600),
                initTheme: getInitTheme(),
                builder: (_, theme) {
                  return MaterialApp(
                    navigatorKey: getIt<InjectableVariables>().globalNavigatorKey,
                    // navigatorObservers: [getIt<InjectableServices>().firebaseAnalyticsObserver],
                    title: Constants.appName,
                    supportedLocales: ["en", "ar"].map<Locale>((language) => Locale(language)),
                    builder: (context, child) {
                      return ScrollConfiguration(behavior: CustomScrollBehavior(), child: child ?? Container());
                    },
                    theme: theme,
                    darkTheme: theme,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    locale: getIt<InjectableVariables>().locale,
                    debugShowCheckedModeBanner: false,
                    themeMode: getIt<InjectableVariables>().themeMode,
                    onGenerateRoute: RouteGenerator.generateRoute,
                  );
                },
              ),
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
