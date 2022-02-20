class ListPesananModel {
  String id;
  String id_konsumen;
  String nama_penerima;
  String alamat_penerima;
  String hp_penerima;
  String kg;
  String total;
  String tgl_pemesanan;
  String status;
  String gambar;
  String tgl_bayar;
  String bonus;

  ListPesananModel(
      {this.id,
      this.id_konsumen,
      this.nama_penerima,
      this.alamat_penerima,
      this.hp_penerima,
      this.kg,
      this.total,
      this.tgl_pemesanan,
      this.status,
      this.gambar,
      this.tgl_bayar,
      this.bonus});

  ListPesananModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id_konsumen = json['id_konsumen'];
    nama_penerima = json['nama_penerima'];
    alamat_penerima = json['alamat_penerima'];
    hp_penerima = json['hp_penerima'];
    kg = json['kg'];
    total = json['total'];
    tgl_pemesanan = json['tgl_pemesanan'].toString();
    status = json['status'];
    gambar = json['gambar'];
    tgl_bayar = json['tgl_bayar'];
    bonus = json['bonus'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_konsumen': id_konsumen,
      'nama_penerima': nama_penerima,
      'alamat_penerima': alamat_penerima,
      'hp_penerima': hp_penerima,
      'kg': kg,
      'total': total,
      'tgl_pemesanan': tgl_pemesanan,
      'status': status,
      'gambar': gambar,
      'tgl_bayar': tgl_bayar,
      'bonus': bonus
    };
  }
}
