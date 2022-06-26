// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<TransaksiModel> transaksiFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<TransaksiModel>.from(
      jsonData.map((x) => TransaksiModel.fromJson(x)));
}

class TransaksiModel {
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

  TransaksiModel({
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

  factory TransaksiModel.fromJson(Map<String, dynamic> json) => TransaksiModel(
        kd_pemesanan: json['kd_pemesanan'],
        tgl_pesan: json['tgl_pesan'],
        total_bayar: json['total_bayar'],
        alamat_kirim: json['alamat_kirim'],
        status_pemesanan: json['status_pemesanan'],
        noteCancel: json['noteCancel'],
        note: json['note'],
        payment: json['payment'],
        ongkir: json['ongkir'],
        id_pelanggan: json['id_pelanggan'],
      );

  Map<String, dynamic> toJson() => {
        'kd_pemesanan': kd_pemesanan,
        'tgl_pesan': tgl_pesan,
        'total_bayar': total_bayar,
        'alamat_kirim': alamat_kirim,
        'status_pemesanan': status_pemesanan,
        'noteCancel': noteCancel,
        'note': note,
        'payment': payment,
        'ongkir': ongkir,
        'id_pelanggan': id_pelanggan,
      };
}
