import 'package:flutter/material.dart';

class SoonPage extends StatefulWidget {
  const SoonPage({Key? key}) : super(key: key);

  @override
  SoonPageState createState() => SoonPageState();
}

class SoonPageState extends State<SoonPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    final _padding = MediaQuery.of(context).padding;
    var textToShow = "Hello Flutter";
    final _availableHeight = _deviceSize.height - _padding.top;
    // dynamic args = ModalRoute.of(context)!.settings.arguments;
    // if (args != null) {
    //   textToShow = args as String;
    // }
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(textToShow),
            ],
          )),
    ));
  }
}
