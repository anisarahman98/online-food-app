// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/Alamat.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/AppBar.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/Bayar.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/Catatan.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/CatatanPembatalan.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/ListPemesanan.dart';
import 'package:online_food_app/src/ui/widget/detail_transaksi/StatusPemesanan.dart';

class DetailTransaksi extends StatefulWidget {
  String kd_pemesanan;
  String tgl_pesan;
  String total_bayar;
  String alamat_kirim;
  String status_pemesanan;
  String noteCancel;
  String note;
  String payment;
  String ongkir;
  String id_pelanggan;

  DetailTransaksi({
    this.kd_pemesanan,
    this.tgl_pesan,
    this.total_bayar,
    this.alamat_kirim,
    this.status_pemesanan,
    this.noteCancel,
    this.note,
    this.payment,
    this.ongkir,
    this.id_pelanggan,
  });

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusPemesanan(
                      status: widget.status_pemesanan,
                    ),
                    if (widget.status_pemesanan == '0')CatatanPembatalan(
                        noteCancel: widget.noteCancel,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'ALAMAT KIRIM',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Alamat(
                      alamat: widget.alamat_kirim,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'RINGKASAN PEMESANAN',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ListPemesanan(
                      kd_pemesanan:widget.kd_pemesanan,
                      id_pelanggan: widget.id_pelanggan,
                      ongkir: int.parse(widget.ongkir),
                      totalBayar:int.parse(widget.total_bayar),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'METODE PEMBAYARAN',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Bayar(
                      payment: widget.payment,
                    ),
                    Catatan(note: widget.note),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.1,
              left: 0.1,
              right: 0.1,
              child: Container(
                height: 60.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          width: 50.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Bayar:',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Rp. ${formatter.format(int.parse(widget.total_bayar))}',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
