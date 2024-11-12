import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/functions/is_valid_img_url.dart';

class NewsArticleImage extends StatelessWidget {
  const NewsArticleImage({super.key, required this.imgUrl, this.width, this.height});

  final String imgUrl;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isValidImageUrl(imgUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data == false) {
            return const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey,
              size: 140,
            );
          } else {
            return Image.network(
              imgUrl,
              fit: BoxFit.fitWidth,
              height: height,
              width: width ?? double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 140,
                    child: CustomProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                  size: 140,
                );
              },
            );
          }
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
