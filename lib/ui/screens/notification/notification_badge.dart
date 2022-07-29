
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int totalNotification;
  const NotificationBadge({Key? key, required this.totalNotification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text("$totalNotification",
          style: const TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
      ),
    );
  }
}