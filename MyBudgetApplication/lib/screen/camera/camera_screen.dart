import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/camera/camera_picture_screen.dart';
import 'package:my_budget_application/widget/camera/camera_button.dart';

import '../../util/constants.dart';

/// Defines the screen that is used for capturing image using the user's device camera.
class CameraScreen extends StatefulWidget {
  /// The route name of the camera image screen.
  static const routeName = Constants.cameraRoute;

  /// Creates new camera image screen.
  const CameraScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [LoginScreen].
  @override
  State<StatefulWidget> createState() => _CameraScreenState();
}

/// State class used to display the camera image capturing screen.
class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  /// Defines the camera controller which handles the camera from the device.
  late CameraController _controller;

  /// Defines the initial controller.
  late Future<void> _initController;

  /// Defines whether the camera is ready or not.
  var isCameraReady = false;

  /// This variable assigns the current captured image from the user's camera.
  late XFile imageFile;

  /// This method defines the initial state of the widget.
  @override
  void initState() {
    super.initState();
    initCamera();
    WidgetsBinding.instance?.addObserver(this);
  }

  /// This method is called when the widget is disposed and
  /// therefore we dispose the camera controller.
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  /// Method which is called whenever there is a change in the [AppLifecycleState],
  /// and in this method we initialize the camera controller.
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

  /// This method creates the UI elements for the camera screen for the
  /// given [context].
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

  /// Builds the UI elements for the camera image capturing screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate image capturing elements.
  ///
  @override
  Widget build(BuildContext context) {
    return (_initController != null) ? Scaffold(
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
    ) : Container();
  }

  /// This method is called at the initialization of the widget in order to
  /// initialize the camera controller which handles the managing of the user's device camera.
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

  /// This method is called whenever the user wants to take an image.
  /// It captures the image and stores it into the [imageFile] variable.
  ///
  /// As a parameter it expects the [context] of the widget.
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
