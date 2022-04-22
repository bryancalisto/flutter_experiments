import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _appId;
  late AgoraClient _agoraClient;

  @override
  void initState() {
    super.initState();

    if (dotenv.env['AGORA_APP_ID'] == null) {
      throw Exception('No AGORA_APP_ID');
    }

    _appId = dotenv.env['AGORA_APP_ID']!;

    _agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(appId: _appId, channelName: 'test'),
      enabledPermission: [Permission.camera, Permission.microphone],
    );

    _agoraClient.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AgoraVideoViewer(client: _agoraClient),
          AgoraVideoButtons(client: _agoraClient),
        ],
      ),
    );
  }
}
