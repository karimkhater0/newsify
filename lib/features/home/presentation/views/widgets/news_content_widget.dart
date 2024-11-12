import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsify/constants.dart';
import 'package:newsify/core/utils/functions/navigation_functions.dart';

import '../../../../../core/cache_helper.dart';
import '../../../../../core/styles.dart';
import '../../../../../generated/l10n.dart';
import '../web_news_view.dart';

class NewsContentWidget extends StatelessWidget {
  const NewsContentWidget({super.key, required this.text, required this.url});

  final String text;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(children: [
              TextSpan(
                text: text,
                style: Styles.tsP1Regular.copyWith(
                  fontSize: 18,
                  color: CacheHelper.getData(key: 'isDark') ? kWhite : kBlack),
              ),
              TextSpan(
                text: S.of(context).read_more,
                style: Styles.tsP1Regular.copyWith(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    navigateTo(context, WebNewsView(url: url));
                  },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
