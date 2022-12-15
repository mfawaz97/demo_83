import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:demo_83/data/repositories/settings_repository.dart';
import 'package:demo_83/ui/style/app.fonts.dart';
import 'package:demo_83/ui/style/theme.dart';
import 'package:demo_83/util/injectables/injectable.variables.dart';
import 'package:demo_83/util/injectables/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc(this.settingsRepository) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) async {
      try {
        if (event is LoadSettings) {
          ThemeMode themeMode = await settingsRepository.getThemeData();
          Locale locale = await settingsRepository.getLocal();
          getIt<InjectableVariables>().locale = locale;
          emit(SettingsLoaded(themeMode, locale));
        } else if (event is ChangeThemeEvent) {
          ThemeMode themeMode = await settingsRepository.changeThemeData(event.themeMode);
          getIt<InjectableVariables>().themeMode = themeMode;
          // ignore: use_build_context_synchronously
          _changeTheme(event.themeContext);
          emit(ThemeModeLoaded(themeMode));
        } else if (event is ChangeLocalEvent) {
          Locale locale = await settingsRepository.changeLocalData(event.locale);
          getIt<InjectableVariables>().locale = locale;
          // ignore: use_build_context_synchronously
          _changeTheme(event.themeContext);
          emit(LocalLoaded(locale));
        }
      } catch (error) {
        try {
          ThemeMode themeMode = await settingsRepository.getThemeData();
          Locale locale = await settingsRepository.getLocal();
          emit(SettingsLoaded(themeMode, locale));
        } catch (error) {
          emit(SettingsLoaded(ThemeMode.system, const Locale('en')));
        }
      }
    });
  }

  _changeTheme(BuildContext themeContext) {
    final String fontFamily = getIt<InjectableVariables>().locale.languageCode == 'ar' ? AppFonts.fontCairo : AppFonts.fontPoppins;
    if (getIt<InjectableVariables>().themeMode == ThemeMode.light) {
      ThemeSwitcher.of(themeContext).changeTheme(
        theme: AppTheme.lightTheme.copyWith(
          textTheme: AppTheme.lightTheme.textTheme.apply(fontFamily: fontFamily),
        ),
      );
    } else {
      ThemeSwitcher.of(themeContext).changeTheme(
        theme: AppTheme.darkTheme.copyWith(
          textTheme: AppTheme.darkTheme.textTheme.apply(
            fontFamily: fontFamily,
          ),
        ),
      );
    }
  }
}
