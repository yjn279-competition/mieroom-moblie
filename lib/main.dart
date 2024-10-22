import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_links/app_links.dart';
import 'screens/home_page.dart';
import 'screens/check_in_page.dart';
import 'screens/profile_view_page.dart';
// 他の必要なインポート

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appLinks = AppLinks();
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    initAppLinks();
  }

  Future<void> initAppLinks() async {
    // リスナーを設定
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        handleAppLink(uri);
      }
    });

    // アプリが起動していない状態からのリンクを処理
    final appLinkUri = await _appLinks.getInitialLink();
    if (appLinkUri != null) {
      handleAppLink(appLinkUri);
    }
  }

  void handleAppLink(Uri uri) {
    if (uri.path == '/checkin') {
      final shelterName = uri.queryParameters['shelter'];
      _navigatorKey.currentState?.pushNamed('/checkin', arguments: shelterName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: 'MieRoom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/checkin': (context) => CheckInPage(
              qrData: ModalRoute.of(context)?.settings.arguments as String?,
            ),
        '/profile': (context) => const ProfileViewPage(),
      },
    );
  }
}
