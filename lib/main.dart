// import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'sounds.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: MyHomePage(
//         title: 'Sounds App',
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;

//   MyHomePage({Key key, this.title}) : super(key: key);
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> _shots = [
//     'assets/images/owen1.png',
//     'assets/images/owen2.png',
//     'assets/images/owen3.png',
//     'assets/images/owen4.png',
//     'assets/images/owen5.png',
//     'assets/images/owen6.png',
//   ];

//   AudioCache audioCache;
//   AudioPlayer audioPlayer;
//   final List _sounds = NewSounds().sounds;
//   int indexIsPlaying;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initSounds();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     super.dispose();
//   }

//   void initSounds() async {
//     audioPlayer = AudioPlayer();
//     audioCache = AudioCache(fixedPlayer: audioPlayer);
//     audioCache.loadAll(_sounds);
//   }

//   void playSound(sound) async {
//     var fileName = sound;
//     if (audioPlayer.state == AudioPlayerState.PLAYING) {
//       audioPlayer.stop();
//     }
//     audioPlayer = await audioCache.play(fileName);
//   }

//   void stopSound(sound) {
//     audioPlayer.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text('Hi, Emoji Speaking. Pls Click On Me'),
//           GridView.builder(
//             shrinkWrap: true,
//             itemCount: 15,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               mainAxisSpacing: 15,
//               crossAxisSpacing: 15,
//             ),
//             itemBuilder: (BuildContext context, int index) => GestureDetector(
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: new DecorationImage(
//                     image: new AssetImage(_shots[index % 5]),
//                   ),
//                   color: Colors.yellow[600],
//                   borderRadius: BorderRadius.circular(100.0),
//                 ),
//                 child: Center(
//                   child: AnimatedContainer(
//                     width: indexIsPlaying == index ? 120 : 80,
//                     height: indexIsPlaying == index ? 120 : 80,
//                     duration: Duration(milliseconds: 400),
//                     curve: Curves.bounceOut,
//                     decoration: BoxDecoration(
//                       color: indexIsPlaying == index
//                           ? Colors.white
//                           : Colors.yellow[500],
//                       borderRadius: new BorderRadius.circular(100.0),
//                       image: DecorationImage(
//                         image: new AssetImage(_shots[index % 5]),
//                         fit: BoxFit.fill,
//                       ),
//                       border: new Border.all(
//                         color: indexIsPlaying == index
//                             ? Colors.yellow
//                             : Colors.transparent,
//                         width: 2.0,
//                         style: BorderStyle.solid,
//                       ),
//                       boxShadow: [
//                         new BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           offset: Offset(0, 10.0),
//                           blurRadius: 10.0,
//                         )
//                       ],
//                     ),
//                   ),
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: Text('${index + 1}'),
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 if (mounted) {
//                   setState(() {
//                     playSound(_sounds[index]);
//                     indexIsPlaying = index;
//                   });
//                 }
//               },
//             ),
//             primary: false,
//             padding: const EdgeInsets.all(30),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'sounds.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'FredokaOne',
      ),
      home: MyHomePage(title: 'Play Sounds By Clicking On Emoji'),
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
  /// Owen's Faces
  /// 
  int x=Random().nextInt(14);
  List<String> _headshots = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
  ];

  /// Owen's WOWs
  final List _sounds = NewSounds().sounds;

  /// Audio Cache
  AudioCache audioCache;
  AudioPlayer audioPlayer;
  int indexIsPlaying;

  @override
  void initState() {
    super.initState();
    initSounds();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GridView.builder(
            shrinkWrap: true,
            itemCount: 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: Center(
                child: AnimatedContainer(
                  width: indexIsPlaying == index ? 120 : 80,
                  height: indexIsPlaying == index ? 120 : 80,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    color: indexIsPlaying == index
                        ? Colors.white
                        : Colors.yellow[500],
                    borderRadius: new BorderRadius.circular(100.0),
                    image: new DecorationImage(
                      image: new AssetImage(_headshots[index % 5]),
                      fit: BoxFit.fill,
                    ),
                    border: new Border.all(
                        color: indexIsPlaying == index
                            ? Colors.yellow
                            : Colors.transparent,
                        width: 2.0,
                        style: BorderStyle.solid),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: Offset(0, 10.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text('${index + 1}'),
                  ),
                ),
              ),
              onTap: () {
                if (mounted) {
                  setState(() {
                    playSound(_sounds[x]);
                    indexIsPlaying = index;
                  });
                }
              },
            ),
            padding: const EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }

  void initSounds() async {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioCache.loadAll(_sounds);
  }

  void playSound(wow) async {
    var fileName = wow;
    if (audioPlayer.state == AudioPlayerState.PLAYING) {
      audioPlayer.stop();
    }
    audioPlayer = await audioCache.play(fileName);
  }

  void stopSound(wow) {
    audioPlayer.stop();
  }
}
