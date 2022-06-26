import 'package:online_food_app/src/model/LogPemesanan.dart';
import 'package:online_food_app/src/model/TransaksiModel.dart';
import 'package:online_food_app/src/repository/TransaksiRepo.dart';
import 'package:rxdart/rxdart.dart';

class TransaksiBloc {
  final _transaksiRepo = TransaksiRepo();

  final _getTransaksi = PublishSubject<List<TransaksiModel>>();
  Stream<List<TransaksiModel>> get countTransaksi => _getTransaksi.stream;

  final _getItemTransaksi = PublishSubject<List<LogPemesananModel>>();
  Stream<List<LogPemesananModel>> get countItemTransaksi =>
      _getItemTransaksi.stream;

  getTotalBayar(String id_pelanggan) {
    return _transaksiRepo.getTotalBayar(id_pelanggan);
  }

  kirimPesanan(Map<String, String> data) {
    return _transaksiRepo.kirimPesanan(data);
  }

  getTransaksi(String id_pelanggan) async {
    List<TransaksiModel> trf = await _transaksiRepo.getTransaksi(id_pelanggan);
    _getTransaksi.sink.add(trf);
  }

  getItemTransaksi(String kd_pemesanan, String id_pelanggan) async {
    List<LogPemesananModel> log =
        await _transaksiRepo.getItemTransaksi(kd_pemesanan, id_pelanggan);
    _getItemTransaksi.sink.add(log);
  }

  dispose() async {
    await _getTransaksi.drain();
    _getTransaksi.close();
  }

  disposeLog() async {
    await _getItemTransaksi.drain();
    _getItemTransaksi.close();
  }
}

final transaksiBloc = TransaksiBloc();
