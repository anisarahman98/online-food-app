// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:online_food_app/src/bloc/ProdukBloc.dart';
import 'package:online_food_app/src/model/ProdukModel.dart';
import 'package:online_food_app/src/ui/main/Detail.dart';
import 'package:online_food_app/src/ui/widget/produk/ListProduk.dart';

class Produk extends StatefulWidget {
  String kategori;
  String id_pelanggan;
  bool isLogin;
  VoidCallback getTotalItem;

  Produk({
    this.kategori,
    this.id_pelanggan,
    this.isLogin,
    this.getTotalItem,
  });

  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: produkBloc.countProduk,
        builder: (context, AsyncSnapshot<List<ProdukModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text('Tidak Ada Produk'),
              );
            } else {
              return _buildListProduk(snapshot);
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildListProduk(AsyncSnapshot<List<ProdukModel>> snapshot) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.85,
        ),
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final data = snapshot.data[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      nama_produk: data.nama_produk,
                      kategori: data.kategori,
                      deskripsi: data.deskripsi,
                      gambar: data.gambar,
                      harga: int.parse(data.harga),
                      getTotalItem : widget.getTotalItem,
                    ),
                  ));
            },
            child: ListProduk(
              nama_produk: data.nama_produk,
              harga: data.harga,
              gambar: data.gambar,
              isFavorite: false,
              id_pelanggan: widget.id_pelanggan,
              isLogin: widget.isLogin,
              getTotalItem :widget.getTotalItem,
            ),
          );
        });
  }
}
