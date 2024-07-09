import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:government_services/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(6.0),
        //   child: Image.asset('assets/images/logo.png'),
        // ),
        centerTitle: false,
        title: Text('${data['name']}'),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Provider.of<BookmarkProvider>(context, listen: false)
                  .addBookmark(url: data['website']);
            },
            icon: Icon((Provider.of<BookmarkProvider>(context)
                    .bookmarkList
                    .contains(data['website']))
                ? Icons.bookmark_added
                : Icons.bookmark_add_outlined),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(
            child: InAppWebView(
              onLoadStart: (controller, url) {
                webViewController = controller;
              },
              initialUrlRequest: URLRequest(
                url: WebUri(data['website']),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue[200],
              ),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onTap: (value) async {
                    if (value == 0) {
                      if (webViewController != null) {
                        if (await webViewController!.canGoBack()) {
                          webViewController?.goBack();
                        }
                      }
                    } else if (value == 2) {
                      if (webViewController != null) {
                        if (await webViewController!.canGoForward()) {
                          webViewController?.goForward();
                        }
                      }
                    }
                  },
                  currentIndex: 1,
                  showSelectedLabels: true,
                  selectedIconTheme: const IconThemeData(size: 30),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                      label: "Back",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      label: "Forward",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
