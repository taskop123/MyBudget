import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/camera/display_picture_screen.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = 'cameraScreen';

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
      _initController =
          (_controller != null ? _controller.initialize() : null)!;
    }
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
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
        // title: const Text('Take picture'),
      ),
      body: FutureBuilder(
        future: _initController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                cameraWidget(context),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      color: const Color(0xAA333639),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              iconSize: 40,
                              onPressed: () => captureImage(context),
                              icon: const Icon(Icons.camera_alt,
                                  color: Colors.white),
                            )
                          ])),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
                    )));
      }
    });
  }
}
