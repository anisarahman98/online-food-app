import 'package:online_food_app/src/model/LogPemesanan.dart';
import 'package:online_food_app/src/model/TransaksiModel.dart';
import 'package:online_food_app/src/provider/TransaksiProvider.dart';

class TransaksiRepo {
  final _transaksiProvider = TransaksiProvider();

  Future getTotalBayar(String id_pelanggan) {
    return _transaksiProvider.getTotalBayar(id_pelanggan);
  }

  Future kirimPesanan(Map<String, String> data) {
    return _transaksiProvider.kirimPesanan(data);
  }

  Future<List<TransaksiModel>> getTransaksi(String id_pelanggan) {
    return _transaksiProvider.getTransaksi(id_pelanggan);
  }

  Future<List<LogPemesananModel>> getItemTransaksi(
      String kd_pemesanan, String id_pelanggan) {
    return _transaksiProvider.getItemTransaksi(kd_pemesanan, id_pelanggan);
  }
}
