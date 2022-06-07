import 'package:flutter/material.dart';

class ListTitleItem extends StatelessWidget {
  final bool isSelect;
  final String name;
  const ListTitleItem({Key? key, required this.name, required this.isSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: isSelect ? Colors.blueAccent : Colors.transparent,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelect ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
