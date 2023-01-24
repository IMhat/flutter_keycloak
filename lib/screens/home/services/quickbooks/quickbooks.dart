import 'package:another_quickbooks/another_quickbooks.dart';
import 'package:another_quickbooks/quickbook_models.dart';
import 'package:keycloakflutter/screens/home/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class QuickbooksScreen extends StatefulWidget {
  static const String routeName = '/home';
  const QuickbooksScreen({Key? key}) : super(key: key);

  @override
  State<QuickbooksScreen> createState() => _QuickbooksScreenState();
}

class _QuickbooksScreenState extends State<QuickbooksScreen> {
  late final WebViewController controller;

  final String applicationId = "7a0a57b2-a22a-4da2-90c4-b6415bf865c0";

  final String clientId = "ABaRfByg1zPZbvQfMAcQtPE7guilPx3RkGX3AVIQLTX2jV9FBM";
  final String clientSecret = "i2KnSMAynvMeI10xM1NcCgucCIu0QWXmQg9rjUjP";

  final String refreshToken =
      "AB11683235306RkGfMaV4EuahU5WQ6GlwqlbbvANmXW6Gz5AfB"; //"AB11652210098Wbv587q2tebOcKFcsPRplbRtoqobsvEmI2vVr";

  String? realmId;

  // Configured in Quickbooks Dashboard.

  final String redirectUrl =
      "https://developer.intuit.com/v2/OAuth2Playground/RedirectUrl";

  QuickbooksClient? quickClient;
  String authUrl = "";
  TokenResponse? token;

  void initState() {
    print("Init Called");
    initializeQuickbooks();
  }

  ///
  /// Initialize Quickbooks Client
  ///
  Future<void> initializeQuickbooks() async {
    quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret,
        environmentType: EnvironmentType.Sandbox);

    await quickClient!.initialize();
    setState(() {
      authUrl = quickClient!.getAuthorizationPageUrl(
          scopes: [Scope.Payments, Scope.Accounting],
          redirectUrl: redirectUrl,
          state: "state123");
    });
  }

  Future<void> requestAccessToken(String code, String realmId) async {
    this.realmId = realmId;
    token = await quickClient!
        .getAuthToken(code: code, redirectUrl: redirectUrl, realmId: realmId);

    setState(() {});
  }

  Future<void> requestPaymentClient() async {
    quickClient!.getPaymentClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: token == null
            ? WebViewWidget(
                controller: controller = WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        print('WebView is loading (progress : $progress%)');
                      },
                      onPageStarted: (String url) {
                        print('Page started loading: $url');
                      },
                      onPageFinished: (String url) {
                        print('Page finished loading: $url');
                      },
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url.startsWith(redirectUrl)) {
                          print('blocking navigation to $request}');
                          var url = Uri.parse(request.url);
                          String code = url.queryParameters["code"]!;
                          String realmId = url.queryParameters['realmId']!;
                          // Request access token
                          requestAccessToken(code, realmId);

                          return NavigationDecision.prevent;
                        }
                        print('allowing navigation to $request');
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse(authUrl)))
            : Container(
                child: Column(children: [
                  Text("Authenticated with Quickbooks"),
                  SizedBox(
                    child: ElevatedButton(
                      child: const Text("Desconect"),
                      onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: HomeScreen()),
                    ),
                  ),
                ]),
              ),
      ),
      floatingActionButton: token != null
          ? FloatingActionButton(
              onPressed: () {
                // printQuickbooksReport();
                //printQuickbooksReportBle();
                print(token);
                print(realmId);
              },
              tooltip: 'Print',
              child: const Icon(Icons.print),
            )
          : null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
