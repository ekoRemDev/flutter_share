import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final _controller = ScreenshotController();

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  // Future<void> shareFile() async {
  //   List<dynamic> docs = await DocumentsPicker.pickDocuments;
  //   if (docs == null || docs.isEmpty) return null;
  //
  //   await FlutterShare.shareFile(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     filePath: docs[0] as String,
  //   );
  // }

  // Future<void> shareScreenShot() async {
  //   Directory directory;
  //   if (Platform.isAndroid) {
  //     directory = await getExternalStorageDirectory();
  //   } else {
  //     directory = await getApplicationDocumentsDirectory();
  //   }
  //   final String localPath =
  //       '${directory.path}/${DateTime.now().toIso8601String()}.png';
  //
  //   await _controller.capture(path: localPath);
  //
  //   await Future.delayed(Duration(seconds: 1));
  //
  //   await FlutterShare.shareFile(
  //     title: 'Compartilhar comprovante',
  //     filePath: localPath,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // mini: false,
        backgroundColor: Colors.amber[900],
        autofocus: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        elevation: 5,
        onPressed: () => share(),
        tooltip: 'Increment',
        icon: Icon(Icons.share),
        label: Text("Share it "),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
