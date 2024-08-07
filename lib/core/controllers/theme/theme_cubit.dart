import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../network/local/cache/cache_helper.dart';
import '../../helper/app_locals.dart';
import '../../../main.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(BuildContext _) => BlocProvider.of(_);

  /// CURRENT THEME
  ThemeMode? mode;

  /// BOOL IS DARK
  bool isDark = false;

  /// GET SETTINGS
  Future getSettings(context) async {
    /// GET THEME
    final String theme = await CacheHelper.getData('theme');

    /// IF THEME DARK
    if (theme == 'dark') {
      mode = ThemeMode.dark;
      isDark = true;
    }

    /// IF THEME LIGHT
    else if (theme == 'light') {
      mode = ThemeMode.light;
      isDark = false;
    }

    emit(ThemeInitial());
  }

  /// CHANGE THEME
  Future changeTheme(bool isDark) async {
    await CacheHelper.saveData('theme', isDark ? 'dark' : 'light');
    restartApplication();
  }
}

class ThemeChangeObserver extends WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    restartApplication();
  }
}

void restartApplication() {
  final key = UniqueKey();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      startLocale: AppLocales.currentLocale,
      fallbackLocale: AppLocales.currentLocale,
      supportedLocales: AppLocales.supportedLocales,
      child: MyApp(key: key),
    ),
  );
}
