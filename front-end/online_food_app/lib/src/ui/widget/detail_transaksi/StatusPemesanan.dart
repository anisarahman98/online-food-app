// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatusPemesanan extends StatelessWidget {
  String status;

  StatusPemesanan({
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    String isStatus;
    Color stastusColor;
    IconData statusIcon;

    if (status == '0') {
      isStatus = 'Pesanan Dibatalkan';
      stastusColor = Colors.red;
      statusIcon = Icons.cancel;
    } else if (status == '1') {
      isStatus = 'Belum Diproses';
      stastusColor = Colors.orange;
      statusIcon = Icons.assignment_late;
    } else if (status == '2') {
      isStatus = 'Diproses';
      stastusColor = Colors.blue;
      statusIcon = Icons.sync;
    } else if (status == '3') {
      isStatus = 'Dalam Pengiriman';
      stastusColor = Colors.lightBlueAccent;
      statusIcon = Icons.motorcycle;
    } else {
      isStatus = 'Selesai';
      stastusColor = Colors.green;
      statusIcon = Icons.assignment_turned_in;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 10.0,
          ),
          child: Text(
            'STATUS PESANAN',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 12.0,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Card(
          elevation: 1.0,
          margin: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 15.0,
            right: 15.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  statusIcon,
                  color: stastusColor,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Text(
                    '$isStatus',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      color: stastusColor,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
