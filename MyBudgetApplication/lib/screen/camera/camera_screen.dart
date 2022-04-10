import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/camera/camera_picture_screen.dart';
import 'package:my_budget_application/widget/camera/camera_button.dart';

import '../../util/constants.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = Constants.cameraRoute;

  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initController;
  var isCameraReady = false;
  late XFile imageFile;

  @override
  void initState() {
    super.initState();
    initCamera();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initController = _controller.initialize();
    }
    if (mounted) {
      setState(() {
        isCameraReady = true;
      });
    }
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
      scale: scale,
      child: Center(child: CameraPreview(_controller)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.cameraTitle),
      ),
      body: FutureBuilder(
        future: _initController,
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.done)
              ? Stack(
                  children: [
                    cameraWidget(context),
                    CameraButton(captureImage, context),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  captureImage(BuildContext context) {
    _controller.takePicture().then((file) {
      setState(() {
        imageFile = file;
      });
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayPictureScreen(
              image: imageFile,
            ),
          ),
        );
      }
    });
  }
}
