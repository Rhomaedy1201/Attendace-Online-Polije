// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late CameraController _cameraController;
  late FaceDetector _faceDetector;
  bool _isFaceDetected = false;
  late List<CameraDescription> _cameras;
  late CameraDescription _camera;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _faceDetector = FaceDetector(options: FaceDetectorOptions());
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _camera = _cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(
      _camera,
      ResolutionPreset.low,  // Gunakan resolusi lebih rendah untuk kecepatan
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21, // Format gambar untuk Android
    );
    await _cameraController.initialize();
    _cameraController.lockCaptureOrientation(DeviceOrientation.landscapeLeft); 
    setState(() {});

    _cameraController.startImageStream((CameraImage image) {
      _processCameraImage(image);
    });
  }

  Future<void> _processCameraImage(CameraImage image) async {
    // Tambahkan Future.delayed agar pemrosesan tidak menghambat UI
    await Future.delayed(Duration(milliseconds: 100));

    final inputImage = _inputImageFromCameraImage(image);

    if (inputImage != null) {
      final faces = await _faceDetector.processImage(inputImage);
      setState(() {
        _isFaceDetected = faces.isNotEmpty;
      });
      print(_isFaceDetected);
    }
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final camera = _cameraController.description;
    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation rotation;

    rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ??
          InputImageRotation.rotation0deg;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null || image.planes.length != 1) return null;
    final plane = image.planes.first;
    print(_isFaceDetected);

    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,  // Sekarang pasti ada nilai
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.stopImageStream();  // Hentikan aliran gambar
    _cameraController.dispose();  // Lepaskan sumber daya kamera
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Detection'),
      ),
      body: Center(
        child: _cameraController.value.isInitialized
            ? Stack(
                children: [
                  SizedBox(
                    height: 600,
                    child: CameraPreview(_cameraController)),
                  Positioned(
                    bottom: 30,
                    left: 50,
                    child: Text(
                      _isFaceDetected.toString(),
                      //  ? 'Wajah Terdeteksi' : 'Tidak ada wajah',
                      style: TextStyle(
                        fontSize: 24,
                        color: _isFaceDetected ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
