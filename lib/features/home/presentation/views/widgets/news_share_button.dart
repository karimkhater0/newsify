import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NewsShareButton extends StatelessWidget {
  const NewsShareButton({super.key, required this.url});

  final String? url;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(url != null && url != ''){
          Share.share(url!);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No link available'),));
        }

      },
      icon: const Icon(Icons.ios_share_rounded,),
    );
  }
}
