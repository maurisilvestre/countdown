import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key? key, required this.time}) : super(key: key);

  final int time;

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  double _height = double.maxFinite;

  void _updateSize() {
    setState(() {
      _height = _height == 0 ? double.maxFinite : 0;
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    await Future.delayed(const Duration(seconds: 1));
    _updateSize();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: AnimatedSize(
                duration: Duration(seconds: widget.time),
                curve: Curves.linear,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: _height,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
