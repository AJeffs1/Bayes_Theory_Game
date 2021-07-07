
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bayes Theory Game'),
          centerTitle: true,
          backgroundColor: Colors.tealAccent[700]
      ),
      body: Center(
        child: Column(
          child: Container(
            color: Colors.teal,
              child: Align(
             alignment: Alignment.topCenter,
              //heightFactor: 0.5,
                child: Image.network('assets/space-3.jpg'),

            )
          )
        )
      ),
    );
  }
}




