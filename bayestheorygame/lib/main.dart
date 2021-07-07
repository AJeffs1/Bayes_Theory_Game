import 'package:flutter/material.dart';

// ...
// TODO consolidate design
// TODO Implement Dragging
// TODO Remove non needed code, CLean
void main() {
  runApp(const BottomAppBarDemo());
}

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({Key? key}) : super(key: key);

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Bayes Theory Game App'),
          backgroundColor: Colors.tealAccent[700],
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: <Widget>[
            SwitchListTile(
              title: const Text('-fab- Lock environment '),
              value: _showFab,
              onChanged: _onShowFabChanged,
              activeColor: Colors.teal,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Text Above Dragging Box'),
            ),
            //const SizedBox(
             // width: 200.0,
            //  height: 300.0,
            //),
            Expanded(
              child: Container(
                height: 400,
                width: 100,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.tealAccent[100],
                  border: Border.all(
                    color: Colors.red,  // red as border color
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.circle),
                    // TODO Implement draggable circle here

                )
              )
            )
          ],
        ),

        floatingActionButton: _showFab
            ? FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {},
          child: const Icon(Icons.add_location_alt),
          tooltip: 'Create',
        )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.tealAccent[700],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}