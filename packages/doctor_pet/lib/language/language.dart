import 'package:doctor_pet/language/vn.dart';
import 'package:get/get.dart';
import '../utils/app_constant.dart';
import 'en.dart';

class LanguageKey {}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LocaleKey.en: EnglishLanguage().generateLanguage(),
        LocaleKey.vi: VNLanguage().generateLanguage(),
      };
}
