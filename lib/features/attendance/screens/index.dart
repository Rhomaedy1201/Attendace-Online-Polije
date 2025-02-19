import 'dart:math' as math;
import 'package:attendace_online_polije/core/config/app_router.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:lottie/lottie.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  CameraController? _cameraController;
  late FaceDetector _faceDetector;
  bool _isFaceDetected = false;
  String _faceStatusText = "Mendeteksi wajah...";
  Color _faceStatusColor = Colors.orange;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );
  }

  /// **Inisialisasi Kamera**
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front),
      ResolutionPreset.veryHigh,
    );
    await _cameraController!.initialize();
    _cameraController!.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
    _cameraController!.startImageStream((CameraImage image) {
      if (!mounted) return;
      _processImage(image);
    });
  }

  /// **Proses Gambar & Deteksi Wajah**
  Future<void> _processImage(CameraImage image) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final metadata = InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: InputImageRotation.rotation270deg, // Sesuaikan dengan orientasi kamera
        format: InputImageFormat.nv21,
        bytesPerRow: image.planes[0].bytesPerRow,
      );

      final inputImage = InputImage.fromBytes(bytes: bytes, metadata: metadata);
      final faces = await _faceDetector.processImage(inputImage);


      setState(() {
        if (faces.isNotEmpty) {
          _isFaceDetected = true;
          _faceStatusText = "Wajah Terdeteksi";
          _faceStatusColor = Colors.green;
        } else {
          _isFaceDetected = false;
          _faceStatusText = "Wajah Tidak Terdeteksi";
          _faceStatusColor = Colors.red;
        }
      });
    } catch (e) {
      print("Error mendeteksi wajah: $e");
    }

    _isProcessing = false;
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("FOTO SELFI")),
      body: Stack(
        children: [
          // Kamera
          SizedBox(
            height: size.height * 0.8,
            width: size.width,
            child: _cameraController == null || !_cameraController!.value.isInitialized
                ? Center(child: CircularProgressIndicator())
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi), // Mirror untuk kamera depan
                    child: CameraPreview(_cameraController!),
                  ),
          ),

          // Animasi Lottie (Face Scan)
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Lottie.asset("assets/lottie/face_scan.json", fit: BoxFit.cover),
          ),

          // Indikator & Tombol
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "Pastikan Anda berada di tempat terang, agar wajah terlihat jelas.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 20),

                  // Status Deteksi Wajah
                  Text(
                    _faceStatusText,
                    style: TextStyle(color: _faceStatusColor, fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  // Tombol Kamera (Aktif Jika Wajah Terdeteksi)
                  ClipOval(
                    child: Material(
                      color: _isFaceDetected ? Colors.pinkAccent : Colors.grey, // Jika wajah terdeteksi, warna aktif
                      child: InkWell(
                        splashColor: Colors.pink,
                        // onTap: _isFaceDetected ? _captureImage : null, // Tombol hanya aktif jika wajah terdeteksi
                        onTap: _isFaceDetected ? () {
                          Navigator.pushReplacementNamed(context, AppRoutes.detailAttendance);
                        } : null, // Tombol hanya aktif jika wajah terdeteksi
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.camera_enhance_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Fungsi untuk Menangkap Gambar
  Future<void> _captureImage() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        _cameraController!.setFlashMode(FlashMode.off);
        final XFile image = await _cameraController!.takePicture();
        print("Gambar diambil: ${image.path}");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Gambar berhasil diambil!", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        ));

      } catch (e) {
        print("Gagal mengambil gambar: $e");
      }
    }
  }
}
