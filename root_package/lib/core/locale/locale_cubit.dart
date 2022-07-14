import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../packages/injectable.dart';
import '../../packages/shared_preferences.dart';
import '../local_keys.dart';

part 'locale_state.dart';

@injectable
class LocaleCubit extends Cubit<LocaleState> {
  final SharedPreferences sharedPreferences;
  LocaleCubit(this.sharedPreferences) : super(LocaleState());

  void init() {
    final language = sharedPreferences.getString(LocalKeys.language);
    if (language != null) {
      emit(LocaleState(Locale(language)));
    }
  }

  void toArabic() {
    sharedPreferences.setString(LocalKeys.language, 'ar');
    emit(LocaleState(const Locale('ar')));
  }

  void toEnglish() {
    sharedPreferences.setString(LocalKeys.language, 'en');
    emit(LocaleState(const Locale('en')));
  }
}
