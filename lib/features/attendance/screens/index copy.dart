// import 'package:attendace_online_polije/core/constants/color_constants.dart';
// import 'package:attendace_online_polije/core/utils/media_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/services.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

// class AttendanceScreen extends StatefulWidget {
//   const AttendanceScreen({super.key});

//   @override
//   State<AttendanceScreen> createState() => _AttendanceScreenState();
// }

// class _AttendanceScreenState extends State<AttendanceScreen> {
//   late List<CameraDescription> _cameras;
//   late CameraController _cameraController;
//   late FaceDetector _faceDetector;
//   bool _isFaceDetected = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     _faceDetector = FaceDetector(options: FaceDetectorOptions());
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     _faceDetector.close();
//     super.dispose();
//   }

//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     _cameraController = CameraController(
//       _cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front), 
//       ResolutionPreset.max,
//       imageFormatGroup: ImageFormatGroup.yuv420,
//     );
//     await _cameraController.initialize();
//     _cameraController.lockCaptureOrientation(DeviceOrientation.landscapeLeft); 

//     _cameraController.startImageStream((image) => _processImage(image));

//     setState(() {});
//   }

//   Future<void> _processImage(CameraImage image) async {
//     final WriteBuffer allBytes = WriteBuffer();
//     for (Plane plane in image.planes) {
//       allBytes.putUint8List(plane.bytes);
//     }
//     final bytes = allBytes.done().buffer.asUint8List();

//     final Size imageSize =
//         Size(image.width.toDouble(), image.height.toDouble());

//     final InputImageRotation imageRotation =
//         InputImageRotationValue.fromRawValue(
//                 _cameraController.description.sensorOrientation) ??
//             InputImageRotation.rotation0deg;

//     final InputImageFormat inputImageFormat =
//         InputImageFormatValue.fromRawValue(image.format.raw) ??
//             InputImageFormat.nv21;

//     final inputImageMetadata = InputImageMetadata(size: imageSize, rotation: imageRotation, format: inputImageFormat, bytesPerRow: image.planes[0].bytesPerRow);

//     final InputImage inputImage = InputImage.fromBytes(bytes: bytes, metadata: inputImageMetadata);

//     final List<Face> faces = await _faceDetector.processImage(inputImage);

//     setState(() {
//       _isFaceDetected = faces.isNotEmpty;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaHelper.getScreenHeight(context);
//     return Scaffold(
//       backgroundColor: ColorConstants.backgroundC,
//       appBar: AppBar(
//         title: const Text('Attendance'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: screenHeight * 0.63,
//             child: _cameraController.value.isInitialized ? 
//               CameraPreview(
//                 _cameraController,
//             ) : Container()
//           ),
//           Text(
//             _isFaceDetected ? 'Wajah terdeteksi' : 'Wajah tidak terdeteksi',
//             style: const TextStyle(
//               fontSize: 24,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }