import 'dart:convert';

JadwalToday jadwalTodayFromJson(String str) => JadwalToday.fromJson(json.decode(str));

String jadwalTodayToJson(JadwalToday data) => json.encode(data.toJson());

class JadwalToday {
    bool status;
    String message;
    List<Datum> data;

    JadwalToday({
        required this.status,
        required this.message,
        required this.data,
    });

    factory JadwalToday.fromJson(Map<String, dynamic> json) => JadwalToday(
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
    Ruangan ruangan;
    Absensi? absensi;

    Datum({
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
        required this.ruangan,
        required this.absensi,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        ruangan: Ruangan.fromJson(json["ruangan"]),
        absensi: json["absensi"] == null ? null : Absensi.fromJson(json["absensi"]),
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
        "ruangan": ruangan.toJson(),
        "absensi": absensi?.toJson(),
    };
}

class Absensi {
    int id;
    DateTime tanggal;
    String nim;
    int idJadwal;
    String masuk;
    dynamic selesai;
    String status;

    Absensi({
        required this.id,
        required this.tanggal,
        required this.nim,
        required this.idJadwal,
        required this.masuk,
        required this.selesai,
        required this.status,
    });

    factory Absensi.fromJson(Map<String, dynamic> json) => Absensi(
        id: json["id"],
        tanggal: DateTime.parse(json["tanggal"]),
        nim: json["nim"],
        idJadwal: json["id_jadwal"],
        masuk: json["masuk"],
        selesai: json["selesai"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "nim": nim,
        "id_jadwal": idJadwal,
        "masuk": masuk,
        "selesai": selesai,
        "status": status,
    };
}

class Matkul {
    int id;
    String kodeProdi;
    String nama;
    String sks;
    int idDosen;
    Dosen dosen;

    Matkul({
        required this.id,
        required this.kodeProdi,
        required this.nama,
        required this.sks,
        required this.idDosen,
        required this.dosen,
    });

    factory Matkul.fromJson(Map<String, dynamic> json) => Matkul(
        id: json["id"],
        kodeProdi: json["kode_prodi"],
        nama: json["nama"],
        sks: json["sks"],
        idDosen: json["id_dosen"],
        dosen: Dosen.fromJson(json["dosen"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kode_prodi": kodeProdi,
        "nama": nama,
        "sks": sks,
        "id_dosen": idDosen,
        "dosen": dosen.toJson(),
    };
}

class Dosen {
    int id;
    String nip;
    String nama;

    Dosen({
        required this.id,
        required this.nip,
        required this.nama,
    });

    factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
    };
}

class Ruangan {
    int id;
    String kodeJurusan;
    String namaKelas;
    Jurusan jurusan;

    Ruangan({
        required this.id,
        required this.kodeJurusan,
        required this.namaKelas,
        required this.jurusan,
    });

    factory Ruangan.fromJson(Map<String, dynamic> json) => Ruangan(
        id: json["id"],
        kodeJurusan: json["kode_jurusan"],
        namaKelas: json["nama_kelas"],
        jurusan: Jurusan.fromJson(json["jurusan"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kode_jurusan": kodeJurusan,
        "nama_kelas": namaKelas,
        "jurusan": jurusan.toJson(),
    };
}

class Jurusan {
    int id;
    String kodeJurusan;
    String nama;

    Jurusan({
        required this.id,
        required this.kodeJurusan,
        required this.nama,
    });

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        id: json["id"],
        kodeJurusan: json["kode_jurusan"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kode_jurusan": kodeJurusan,
        "nama": nama,
    };
}
