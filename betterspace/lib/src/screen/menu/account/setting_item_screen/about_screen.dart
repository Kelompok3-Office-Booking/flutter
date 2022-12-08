import 'package:betterspace/src/view_model/account_view_model.dart';
import 'package:betterspace/src/widget/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = UniqueKey();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Consumer<AccountViewModel>(builder: (context, value, child) {
              return WebView(
                key: key,
                initialUrl: 'https://betterspace.netlify.app/',
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  value.completeLoading();
                },
              );
            }),
          ),
          Consumer<AccountViewModel>(builder: (context, value, child) {
            return value.webLoading
                ? Center(
                    child: LoadingWidget.darkBlueButtonLoading,
                  )
                : Stack();
          })
        ],
      ),
    );
  }
}
