import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';

class TranslationController implements Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en': english,
    'ar': arabic,
  };
}