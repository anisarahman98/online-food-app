// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CatatanPembatalan extends StatelessWidget {
  String noteCancel;

  CatatanPembatalan({
    this.noteCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 15.0,
            bottom: 10.0,
          ),
          child: Text(
            'CATATAN PEMBATALAN',
            style: TextStyle(
              color: Colors.lightBlue[800],
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
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.event_note,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                    child: Text(
                  noteCancel == '' ? '-' : noteCancel,
                  style: TextStyle(
                    fontFamily: 'Varela',
                    color: Colors.grey[800],
                    fontSize: 13.0,
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
