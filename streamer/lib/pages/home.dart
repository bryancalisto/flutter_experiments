import 'package:flutter/material.dart';
import 'package:streamer/pages/director.dart';
import 'package:streamer/pages/participant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _channelName = TextEditingController();
  final _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Multi streaming with friends'),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: _channelName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: 'Channel Name',
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: _userName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: 'User Name',
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Participant(
                      userName: _userName.text,
                      channelName: _channelName.text,
                    ),
                  ),
                );
              },
              child: Row(
                children: const <Widget>[
                  Text('Participant'),
                  Icon(Icons.live_tv),
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Director(
                    channelName: _channelName.text,
                  ),
                ));
              },
              child: Row(
                children: const <Widget>[
                  Text('Director'),
                  Icon(Icons.cut),
                ],
              ))
        ],
      )),
    );
  }
}
