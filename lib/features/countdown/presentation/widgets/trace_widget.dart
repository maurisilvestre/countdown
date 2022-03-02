import 'package:flutter/material.dart';

class TraceWidget extends StatefulWidget {
  const TraceWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TraceWidgetState createState() => _TraceWidgetState();
}

class _TraceWidgetState extends State<TraceWidget> {
  List<Widget> _getTraces() {
    double _width = MediaQuery.of(context).size.width;

    double _count = (_width * 0.50) / 15;

    List<Widget> _traces = [];
    for (var i = 0; i < _count.toInt(); i++) {
      _traces.add(Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: 5,
        height: 20,
        color: Colors.grey,
      ));
    }
    return _traces;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _getTraces(),
    );
  }
}
