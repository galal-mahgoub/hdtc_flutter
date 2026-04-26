// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../utils/toast_manager.dart';

class WebViewPageController extends GetxController {
  late WebViewController webViewController;

  bool load = true;
  String url = '';

  @override
  Future<void> onInit() async {
    url = Get.arguments['url'] ?? '';
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            Get.log('WebView is loading (progress : $progress%)');
            if (progress == 100) {
              load = false;
            } else {
              load = true;
            }
            update();
          },
          onPageStarted: (String url) {
            Get.log('Page started loading: $url');
          },
          onPageFinished: (String url) {
            Get.log('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            Get.log('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              Get.log('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            Get.log('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ToastManager.showSuccess(message.message);
        },
      )
      ..loadRequest(Uri.parse(url));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    webViewController = controller;

    update();
    super.onInit();
  }
}
