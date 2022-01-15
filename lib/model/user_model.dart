class UserModel {
  String id;
  String nama;
  String hp;
  String alamat;
  String email;
  String gambar;
  String rules;

  UserModel(
      {this.id,
      this.nama,
      this.hp,
      this.alamat,
      this.email,
      this.gambar,
      this.rules});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    hp = json['hp'];
    alamat = json['alamat'];
    email = json['email'];
    gambar = json['gambar'];
    rules = json['rules'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'hp': hp,
      'alamat': alamat,
      'email': email,
      'gambar': gambar,
      'rules': rules
    };
  }
}
