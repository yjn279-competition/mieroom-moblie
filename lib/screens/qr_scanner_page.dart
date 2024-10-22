import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  MobileScannerController? _controller;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QRコードスキャン'),
      ),
      body: MobileScanner(
        controller: _controller,
        onDetect: (capture) {
          if (_hasNavigated) return; // 既に遷移している場合は何もしない
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            if (barcode.rawValue != null) {
              _hasNavigated = true;
              _controller?.stop(); // スキャンを停止
              // QRコードの内容をDeep Linkとして処理
              handleAppLink(barcode.rawValue!, context);
            }
            break;
          }
        },
      ),
    );
  }

  void handleAppLink(String link, BuildContext context) {
    // Deep Linkを処理してチェックイン画面に遷移
    if (link.startsWith('mieroom://checkin')) {
      final uri = Uri.parse(link);
      final shelterName = uri.queryParameters['shelter'];
      Navigator.of(context)
          .pushReplacementNamed('/checkin', arguments: shelterName);
    }
  }
}
