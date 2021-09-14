import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(VineBoom());
}

class VineBoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vine Boom',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Vine Boom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache audioCache = AudioCache();
  bool _isLoading = true;

  @override
  void initState() {
    loadAudioFiles();
    super.initState();
  }

  Future<void> loadAudioFiles() async {
    setState(() {
      _isLoading = true;
    });

    await audioCache.load('boom.mp3');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    child: Text("Play"),
                    onPressed: () {
                      audioCache.play('boom.mp3');
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
