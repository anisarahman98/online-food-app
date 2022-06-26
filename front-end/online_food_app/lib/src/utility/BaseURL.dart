class BaseURL {
  // static String domain = "http://10.0.2.2/";
  static String domain = "http://192.168.100.194/";

  static String baseURL = domain + "food_app/api/";
  static String baseURLImg = domain + "food_app/public/uploads/img/";

  // Produk
  static String urlGetProduk = baseURL + "produk";

  // Auth
  static String urlGetValidateEmail = baseURL + "auth/getValidateEmail";
  static String urlLogin = baseURL + "auth/login";
  static String urlRegister = baseURL + "auth/register";
  static String urlSimpanPassword = baseURL + "auth/simpanPassword";

  //keranjang
  static String urlGetKeranjang = baseURL + "keranjang";
  static String urlTambahKeranjang = baseURL + "keranjang/tambahKeranjang";
  static String urlUbahQtyKeranjang = baseURL + "keranjang/ubahQtyKeranjang";
  static String urlHapusItemKeranjang =
      baseURL + "keranjang/hapusItemKeranjang";
  static String urlGetTotalItem = baseURL + "keranjang/getTotalItem";

  //Pemesanan
  static String urlGetTotalBayar = baseURL + "pemesanan/getTotalBayar";
  static String urlKirimPesanan = baseURL + "pemesanan";
  static String urlGetTransaksi = baseURL + "pemesanan/getTransaksi";
  static String urlGetItemTransaksi = baseURL + "pemesanan/getItemTransaksi";
}
