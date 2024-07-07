class Mahasiswa {
  final String nim;
  final String nama;
  final String kelas;
  final String prodi;
  final String jurusan;
  final String fakultas;

  Mahasiswa({
    required this.nim,
    required this.nama,
    required this.kelas,
    required this.prodi,
    required this.jurusan,
    required this.fakultas,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      nim: json['nim'],
      nama: json['nama'],
      kelas: json['kelas'],
      prodi: json['prodi'],
      jurusan: json['jurusan'],
      fakultas: json['fakultas'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'nama': nama,
      'kelas': kelas,
      'prodi': prodi,
      'jurusan': jurusan,
      'fakultas': fakultas,
    };
  }
}
