import 'package:ar/examples/debugoptionsexample.dart';
import 'package:ar/examples/localandwebobjectsexample.dart';
import 'package:ar/examples/objectsonplanesexample.dart';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'examples/objectgesturesexample.dart';
import 'examples/screenshotexample.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//   static const String _title = 'AR Model';

//   List<Model3D> listModels = [
//     Model3D(
//         name: 'Modelo 1',
//         src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
//         type: modelType.web),
//     Model3D(
//         name: 'Modelo 2',
//         src: 'lib/Images/Chicken_01/jaww.gltf',
//         type: modelType.asset),
//     Model3D(
//         name: 'Modelo 4',
//         src: 'lib/Images/Chicken_01/jaww.gltf',
//         type: modelType.asset),
//   ];
//   Model3D? selectedModel = Model3D(
//       name: 'Default',
//       src: 'lib/Images/Chicken_01/jaww.gltf',
//       type: modelType.asset);

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await ArFlutterPlugin.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//     if (!mounted) return;

//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }

//   void selectModel(int index) {
//     setState(() {
//       selectedModel = listModels[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(_title),
//         backgroundColor: Colors.teal[400],
//       ),
//       body: Column(children: [
//         FloatingActionButton(
//           backgroundColor: Colors.grey,
//           onPressed: () {
//             print('kjabkjfbakejbfkje f');
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => LocalAndWebObjectsWidget()),
//             );
//           },
//           child: const Icon(
//             Icons.view_in_ar,
//             //center_focus_weak_outlined
//             //filter_center_focus
//             size: 35,
//             color: Colors.white,
//           ),
//         ),
//         Text('Running on: $_platformVersion\n'),
//         Container(
//             width: 500,
//             height: 500,
//             child: Stack(
//               children: [
//                 Positioned(
//                   bottom: 10,
//                   right: 10,
//                   child: FloatingActionButton(
//                     backgroundColor: Colors.grey,
//                     onPressed: () {
//                       print('kjabkjfbakejbfkje f');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => LocalAndWebObjectsWidget()),
//                       );
//                     },
//                     child: const Icon(
//                       Icons.view_in_ar,
//                       //center_focus_weak_outlined
//                       //filter_center_focus
//                       size: 35,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   left: 10,
//                   child: Text(
//                     selectedModel!.name,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ModelViewer(
//                   key: UniqueKey(),
//                   src: selectedModel!.src,
//                   alt: selectedModel!.name,
//                   ar: true,
//                   autoPlay: true,
//                   autoRotate: true,
//                   cameraControls: true,
//                   loading: Loading.auto,
//                   disableZoom: false,
//                   shadowIntensity: 1,
//                 ),
//               ],
//             )),
//         Expanded(
//           child: ListView.builder(
//             itemCount: listModels.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(
//                   listModels[index].name,
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//                 subtitle: Text(
//                   listModels[index].src,
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//                 leading: listModels[index].type == modelType.web
//                     ? const Icon(Icons.upload_rounded)
//                     : const Icon(Icons.file_open),
//                 onTap: () {
//                   selectModel(index);
//                 },
//               );
//             },
//           ),
//         ),
//         Expanded(
//           child: ExampleList(),
//         ),
//       ]),
//     );
//   }

//   void _navigateToNextScreen(BuildContext context) {
//     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
//       return LocalAndWebObjectsWidget();
//     }));
//   }
// }

// class ExampleList extends StatelessWidget {
//   ExampleList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final examples = [
//       Example(
//           'Debug Options',
//           'Visualize feature points, planes and world coordinate system',
//           () => Navigator.push(context,
//               MaterialPageRoute(builder: (context) => DebugOptionsWidget()))),
//       Example(
//           'Local & Online Objects',
//           'Place 3D objects from Flutter assets and the web into the scene',
//           () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => LocalAndWebObjectsWidget()))),
//       Example(
//           'Anchors & Objects on Planes',
//           'Place 3D objects on detected planes using anchors',
//           () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ObjectsOnPlanesWidget()))),
//       Example(
//           'Object Transformation Gestures',
//           'Rotate and Pan Objects',
//           () => Navigator.push(context,
//               MaterialPageRoute(builder: (context) => ObjectGesturesWidget()))),
//       Example(
//           'Screenshots',
//           'Place 3D objects on planes and take screenshots',
//           () => Navigator.push(context,
//               MaterialPageRoute(builder: (context) => ScreenshotWidget()))),
//       // Example(
//       //     'Cloud Anchors',
//       //     'Place and retrieve 3D objects using the Google Cloud Anchor API',
//       //     () => Navigator.push(context,
//       //         MaterialPageRoute(builder: (context) => CloudAnchorWidget()))),
//       // Example(
//       //     'External Model Management',
//       //     'Similar to Cloud Anchors example, but uses external database to choose from available 3D models',
//       //     () => Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //             builder: (context) => ExternalModelManagementWidget())))
//     ];
//     return ListView(
//       children:
//           examples.map((example) => ExampleCard(example: example)).toList(),
//     );
//   }
// }

class ExampleCard extends StatelessWidget {
  ExampleCard({Key? key, required this.example}) : super(key: key);
  final Example example;

  @override
  build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          example.onTap();
        },
        child: ListTile(
          title: Text(example.name),
          subtitle: Text(example.description),
        ),
      ),
    );
  }
}

class Example {
  const Example(this.name, this.description, this.onTap);
  final String name;
  final String description;
  final Function onTap;
}

class Model3D {
  late String name;
  late String src;
  modelType type;

  Model3D({required this.name, required this.src, required this.type});
}

enum modelType { asset, web }

modelType defineType(String itemType) {
  switch (itemType) {
    case "asset":
      return modelType.asset;
    case "web":
      return modelType.web;
    default:
      return modelType.web;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _platformVersion = 'Unknown';
  static const String _title = 'AR Model';

  List<Model3D> listModels = [
    Model3D(
        name: 'Modelo 1',
        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        type: modelType.web),
    Model3D(
        name: 'Modelo 2',
        src: 'lib/Images/Chicken_01/jaww.gltf',
        type: modelType.asset),
    Model3D(
        name: 'Modelo 4',
        src: 'lib/Images/Chicken_01/jaww.gltf',
        type: modelType.asset),
  ];
  Model3D? selectedModel = Model3D(
      name: 'Default',
      src: 'lib/Images/Chicken_01/jaww.gltf',
      type: modelType.asset);

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ArFlutterPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void selectModel(int index) {
    setState(() {
      selectedModel = listModels[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.teal[400],
      ),
      body: Column(children: [
        Text('Running on: $_platformVersion\n'),
        Container(
            width: 500,
            height: 500,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ModelViewer(
                  key: UniqueKey(),
                  src: selectedModel!.src,
                  alt: selectedModel!.name,
                  ar: true,
                  autoPlay: true,
                  autoRotate: true,
                  cameraControls: true,
                  loading: Loading.auto,
                  disableZoom: false,
                  shadowIntensity: 1,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      print('kjabkjfbakejbfkje f');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocalAndWebObjectsWidget()));
                    },
                    child: const Icon(
                      Icons.view_in_ar,
                      //center_focus_weak_outlined
                      //filter_center_focus
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    selectedModel!.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        Expanded(
          child: ListView.builder(
            itemCount: listModels.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  listModels[index].name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  listModels[index].src,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                leading: listModels[index].type == modelType.web
                    ? const Icon(Icons.upload_rounded)
                    : const Icon(Icons.file_open),
                onTap: () {
                  selectModel(index);
                },
              );
            },
          ),
        ),
        // Expanded(
        //   child: ExampleList(),
        // ),
      ]),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: const Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
