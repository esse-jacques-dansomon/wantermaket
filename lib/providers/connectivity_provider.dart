// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
//
// enum ConnectivityStatus {
//   Online,
//   Offline,
// }
// class ConnectivityProvider  {
//   StreamController<ConnectivityStatus> connectionStatusController = StreamController();
//
//   ConnectivityProvider(){
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.wifi) {
//         connectionStatusController.add(ConnectivityStatus.Online);
//       } else if (result == ConnectivityResult.mobile) {
//         connectionStatusController.add(ConnectivityStatus.Online);
//       } else {
//         connectionStatusController.add(ConnectivityStatus.Offline);
//       }
//     });
//   }
// }