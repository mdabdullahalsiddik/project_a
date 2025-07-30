import 'package:get/get.dart';

import 'en_us.dart';
import 'bn_bd.dart';
import 'pt_pt.dart';
import 'fr_fr.dart';
import 'de_de.dart';
import 'it_it.dart';
import 'zh_cn.dart';
import 'ko_kr.dart';
import 'es_es.dart';
import 'hi_in.dart';
import 'ja_jp.dart';
import 'ru_ru.dart';
import 'ar_sa.dart';
import 'tr_tr.dart';
import 'nl_nl.dart';
import 'pl_pl.dart';
import 'ur_pk.dart';
import 'th_th.dart';
import 'vi_vn.dart';
import 'ms_my.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': EnglishLanguage().english,
    'bn_BD': BanglaLanguage().bangla,
    'pt_PT': PortugueseLanguage().portuguese,
    'fr_FR': FrenchLanguage().french,
    'de_DE': GermanLanguage().german,
    'it_IT': ItalianLanguage().italian,
    'zh_CN': ChineseLanguage().chinese,
    'ko_KR': KoreanLanguage().korean,
    'es_ES': SpanishLanguage().spanish,
    'hi_IN': HindiLanguage().hindi,
    'ja_JP': JapaneseLanguage().japanese,
    'ru_RU': RussianLanguage().russian,
    'ar_SA': ArabicLanguage().arabic,
    'tr_TR': TurkishLanguage().turkish,
    'nl_NL': DutchLanguage().dutch,
    'pl_PL': PolishLanguage().polish,
    'ur_PK': UrduLanguage().urdu,
    'th_TH': ThaiLanguage().thai,
    'vi_VN': VietnameseLanguage().vietnamese,
    'ms_MY': MalayLanguage().malay,
  };
}