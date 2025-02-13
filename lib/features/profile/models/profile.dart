import 'dart:convert';

ProfileM profileMFromJson(String str) => ProfileM.fromJson(json.decode(str));

String profileMToJson(ProfileM data) => json.encode(data.toJson());

class ProfileM {
    bool status;
    String message;
    Data data;

    ProfileM({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileM.fromJson(Map<String, dynamic> json) => ProfileM(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String nim;
    String kodeProdi;
    String jk;
    String alamat;
    String telp;
    String golongan;
    String angkatan;
    String semesterSekarang;
    dynamic semesterTempuh;
    Mahasiswa mahasiswa;
    Prodi prodi;

    Data({
        required this.nim,
        required this.kodeProdi,
        required this.jk,
        required this.alamat,
        required this.telp,
        required this.golongan,
        required this.angkatan,
        required this.semesterSekarang,
        required this.semesterTempuh,
        required this.mahasiswa,
        required this.prodi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nim: json["nim"],
        kodeProdi: json["kode_prodi"],
        jk: json["jk"],
        alamat: json["alamat"],
        telp: json["telp"],
        golongan: json["golongan"],
        angkatan: json["angkatan"],
        semesterSekarang: json["semester_sekarang"],
        semesterTempuh: json["semester_tempuh"],
        mahasiswa: Mahasiswa.fromJson(json["mahasiswa"]),
        prodi: Prodi.fromJson(json["prodi"]),
    );

    Map<String, dynamic> toJson() => {
        "nim": nim,
        "kode_prodi": kodeProdi,
        "jk": jk,
        "alamat": alamat,
        "telp": telp,
        "golongan": golongan,
        "angkatan": angkatan,
        "semester_sekarang": semesterSekarang,
        "semester_tempuh": semesterTempuh,
        "mahasiswa": mahasiswa.toJson(),
        "prodi": prodi.toJson(),
    };
}

class Mahasiswa {
    int id;
    String nim;
    String nama;

    Mahasiswa({
        required this.id,
        required this.nim,
        required this.nama,
    });

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        id: json["id"],
        nim: json["nim"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nim": nim,
        "nama": nama,
    };
}

class Prodi {
    int id;
    String kodeProdi;
    String kodeJurusan;
    String nama;

    Prodi({
        required this.id,
        required this.kodeProdi,
        required this.kodeJurusan,
        required this.nama,
    });

    factory Prodi.fromJson(Map<String, dynamic> json) => Prodi(
        id: json["id"],
        kodeProdi: json["kode_prodi"],
        kodeJurusan: json["kode_jurusan"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kode_prodi": kodeProdi,
        "kode_jurusan": kodeJurusan,
        "nama": nama,
    };
}
