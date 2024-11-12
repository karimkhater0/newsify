import 'package:flutter/material.dart';
import 'package:newsify/features/home/data/news_model.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:newsify/features/home/presentation/views/widgets/news_save_button.dart';
import 'package:newsify/features/home/presentation/views/widgets/news_share_button.dart';
import 'package:newsify/features/home/presentation/views/widgets/news_view_body.dart';


class NewsView extends StatelessWidget {
  const NewsView({super.key, required this.model});

  final Results model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        actions: [
          NewsSaveButton(model: model,),
          NewsShareButton(url: model.link,),
        ],
      ),

      body: NewsViewBody(model: model,),
    );
  }
}


