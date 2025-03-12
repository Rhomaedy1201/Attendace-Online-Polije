import 'dart:convert';

HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
    bool status;
    String message;
    List<Datum> data;

    HistoryModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    DateTime tanggal;
    String nim;
    int idJadwal;
    String masuk;
    dynamic selesai;
    String status;
    Mahasiswa mahasiswa;
    Jadwal jadwal;

    Datum({
        required this.id,
        required this.tanggal,
        required this.nim,
        required this.idJadwal,
        required this.masuk,
        required this.selesai,
        required this.status,
        required this.mahasiswa,
        required this.jadwal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: DateTime.parse(json["tanggal"]),
        nim: json["nim"],
        idJadwal: json["id_jadwal"],
        masuk: json["masuk"],
        selesai: json["selesai"],
        status: json["status"],
        mahasiswa: Mahasiswa.fromJson(json["mahasiswa"]),
        jadwal: Jadwal.fromJson(json["jadwal"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "nim": nim,
        "id_jadwal": idJadwal,
        "masuk": masuk,
        "selesai": selesai,
        "status": status,
        "mahasiswa": mahasiswa.toJson(),
        "jadwal": jadwal.toJson(),
    };
}

class Jadwal {
    int id;
    String hari;
    String jamMasuk;
    String jamToleransiMasuk;
    String jamSelesai;
    dynamic jamToleransiSelesai;
    String durasi;
    int idMk;
    String semester;
    int idRuang;
    String golongan;
    String kodeProdi;
    Matkul matkul;

    Jadwal({
        required this.id,
        required this.hari,
        required this.jamMasuk,
        required this.jamToleransiMasuk,
        required this.jamSelesai,
        required this.jamToleransiSelesai,
        required this.durasi,
        required this.idMk,
        required this.semester,
        required this.idRuang,
        required this.golongan,
        required this.kodeProdi,
        required this.matkul,
    });

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        id: json["id"],
        hari: json["hari"],
        jamMasuk: json["jam_masuk"],
        jamToleransiMasuk: json["jam_toleransi_masuk"],
        jamSelesai: json["jam_selesai"],
        jamToleransiSelesai: json["jam_toleransi_selesai"],
        durasi: json["durasi"],
        idMk: json["id_mk"],
        semester: json["semester"],
        idRuang: json["id_ruang"],
        golongan: json["golongan"],
        kodeProdi: json["kode_prodi"],
        matkul: Matkul.fromJson(json["matkul"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "jam_masuk": jamMasuk,
        "jam_toleransi_masuk": jamToleransiMasuk,
        "jam_selesai": jamSelesai,
        "jam_toleransi_selesai": jamToleransiSelesai,
        "durasi": durasi,
        "id_mk": idMk,
        "semester": semester,
        "id_ruang": idRuang,
        "golongan": golongan,
        "kode_prodi": kodeProdi,
        "matkul": matkul.toJson(),
    };
}

class Matkul {
    int id;
    String kodeProdi;
    String nama;
    String sks;
    int idDosen;

    Matkul({
        required this.id,
        required this.kodeProdi,
        required this.nama,
        required this.sks,
        required this.idDosen,
    });

    factory Matkul.fromJson(Map<String, dynamic> json) => Matkul(
        id: json["id"],
        kodeProdi: json["kode_prodi"],
        nama: json["nama"],
        sks: json["sks"],
        idDosen: json["id_dosen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kode_prodi": kodeProdi,
        "nama": nama,
        "sks": sks,
        "id_dosen": idDosen,
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
