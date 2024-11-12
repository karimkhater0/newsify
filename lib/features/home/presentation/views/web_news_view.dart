import 'package:flutter/material.dart';
import 'package:newsify/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebNewsView extends StatelessWidget {
  const WebNewsView({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
