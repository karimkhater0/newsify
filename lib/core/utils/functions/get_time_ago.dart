import 'package:get_time_ago/get_time_ago.dart';
import 'package:newsify/core/cache_helper.dart';

String getTimeAgo(String timestamp) {
  var convertedTimestamp = DateTime.parse(timestamp);
  return GetTimeAgo.parse(
      convertedTimestamp,
      locale: CacheHelper.getData(key: 'lang'),
  );
}