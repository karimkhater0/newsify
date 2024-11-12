
import 'package:newsify/core/cache_helper.dart';

bool isArabic(){
  return CacheHelper.getData(key: 'lang') == 'ar';
}