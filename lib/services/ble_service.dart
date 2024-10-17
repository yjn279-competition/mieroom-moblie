import 'dart:convert';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import '../models/profile.dart';

class BLEService {
  static const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  static const String CHARACTERISTIC_UUID =
      "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  static Future<void> advertiseProfile(Profile profile) async {
    final flutterBlePeripheral = FlutterBlePeripheral();

    // プロフィールデータをJSON形式に変換
    String jsonProfile = jsonEncode(profile.toJson());

    // 広告データの準備（制限があるため、実際のデータは短くする必要があります）
    List<int> advertisementData =
        utf8.encode(jsonProfile.substring(0, 20)); // 最初の20文字のみ

    final AdvertiseData advertiseData = AdvertiseData(
      serviceUuid: SERVICE_UUID,
      serviceData: advertisementData,
    );

    try {
      await flutterBlePeripheral.start(advertiseData: advertiseData);
      print('Started advertising profile data');
    } catch (e) {
      print('Error starting advertisement: $e');
    }
  }
}


// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import '../models/profile.dart';

// class BLEService {
//   static const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
//   static const String CHARACTERISTIC_UUID =
//       "beb5483e-36e1-4688-b7f5-ea07361b26a8";

//   static Future<void> sendProfile(Profile profile) async {
//     try {
//       // BLEの状態を確認
//       if (await FlutterBluePlus.isAvailable == false) {
//         print('Bluetooth is not available');
//         return;
//       }

//       // スキャンが既に実行中の場合は停止
//       if (FlutterBluePlus.isScanningNow) {
//         await FlutterBluePlus.stopScan();
//       }

//       // BLEをスキャン
//       await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

//       // デバイスを探す
//       StreamSubscription<List<ScanResult>>? subscription;
//       subscription = FlutterBluePlus.scanResults.listen((results) {
//         for (ScanResult r in results) {
//           print('${r.device.platformName} found! rssi: ${r.rssi}');

//           // ここで特定のデバイスを選択する条件を設定
//           if (r.device.platformName?.contains("高野誠のMacBook Air") ?? false) {
//             _connectAndSend(r.device, profile);
//             subscription?.cancel();
//             break;
//           }
//         }
//       });

//       // タイムアウト後にスキャンを停止
//       await Future.delayed(Duration(seconds: 4));
//       if (FlutterBluePlus.isScanningNow) {
//         await FlutterBluePlus.stopScan();
//       }
//       subscription?.cancel();
//     } catch (e) {
//       print('Error during BLE operation: $e');
//     }
//   }

//   static Future<void> _connectAndSend(
//       BluetoothDevice device, Profile profile) async {
//     try {
//       await device.connect();
//       print('Connected to ${device.platformName}');

//       List<BluetoothService> services = await device.discoverServices();
//       for (BluetoothService service in services) {
//         if (service.uuid.toString() == SERVICE_UUID) {
//           for (BluetoothCharacteristic characteristic
//               in service.characteristics) {
//             if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
//               // プロフィールデータをJSON形式に変換
//               String jsonProfile = jsonEncode(profile.toJson());
//               List<int> bytes = utf8.encode(jsonProfile);

//               // データを送信
//               await characteristic.write(bytes);
//               print('Profile data sent successfully');
//               break;
//             }
//           }
//         }
//       }

//       // 接続を切断
//       device.disconnect();
//     } catch (e) {
//       print('Error in _connectAndSend: $e');
//     }
//   }
// }


