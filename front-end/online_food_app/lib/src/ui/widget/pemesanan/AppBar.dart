import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.lightBlue[800],
    elevation: 5,
    title: Text(
      'Transaksi Pemesanan',
      style: TextStyle(
        fontFamily: 'Varela',
      ),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        // getTotalItem();
      },
      icon: Icon(
        Icons.chevron_left,
        size: 32.0,
      ),
    ),
  );
}
