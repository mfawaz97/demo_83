part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class ChangeThemeEvent extends SettingsEvent {
  final ThemeMode themeMode;
  final BuildContext themeContext;
  ChangeThemeEvent(this.themeContext, this.themeMode);
}

class ChangeLocalEvent extends SettingsEvent {
  final Locale locale;
  final BuildContext themeContext;
  ChangeLocalEvent(this.themeContext, this.locale);
}
