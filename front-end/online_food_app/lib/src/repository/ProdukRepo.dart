import 'package:online_food_app/src/model/ProdukModel.dart';
import 'package:online_food_app/src/provider/ProdukProvider.dart';

class ProdukRepo {
  ProdukProvider _produkProvider = ProdukProvider();

  Future<List<ProdukModel>> getProduk(String kategori) {
    return _produkProvider.getProduk(kategori);
  }
}
