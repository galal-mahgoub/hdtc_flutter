import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../languages/app_translations.dart';
import '../../../theme/text_manager.dart';
import '../../custom_back_btn.dart';
import '../../custom_loading.dart';
import '../controllers/web_view_controller.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebViewPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              LocaleKeys.checkout.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            isLoading: controller.load,
            widget: WebViewWidget(
              controller: controller.webViewController,
            ),
          ),
        );
      },
    );
  }
}
