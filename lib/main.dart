import 'package:flutter/material.dart';
import 'package:gauge_animation_flutter/src/gauge/animated_gauge.dart';
import 'package:gauge_animation_flutter/src/gauge/gauge_driver.dart';

void main() {
  runApp(GaugeDemo());
}

class GaugeDemo extends StatelessWidget {
  static const String _title = 'Flutter Gauge Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MainPage(title: _title),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GaugeDriver _driver = GaugeDriver();

  @override
  void initState() {
    super.initState();
    _driver.listen((x) => setState(() {}));
    print('print from develop branch');
    print("initState");
    print('rebase');
    print('change release/v1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      backgroundColor: Colors.black,
      body: Center(child: AnimatedGauge(driver: _driver),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _driver.drive(1/10),
        child: Icon(_driver.maxed ? Icons.settings_backup_restore : Icons.offline_bolt),
        tooltip: _driver.maxed ? 'Reset' : 'Drive',
      ),
    );
  }
}


