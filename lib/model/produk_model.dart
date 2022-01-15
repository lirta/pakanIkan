class ProdukModel {
  String id;
  String nama;
  int harga;

  ProdukModel({this.id, this.nama, this.harga});
  ProdukModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    nama = json['nama'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    return { 'nama': nama, 'harga': harga};
  }
}
