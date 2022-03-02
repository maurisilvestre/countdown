import 'package:flutter/material.dart';

import '../widgets/start_widget.dart';
import '../widgets/trace_widget.dart';
import '../widgets/background_widget.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({Key? key}) : super(key: key);

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> with SingleTickerProviderStateMixin {
  final Duration _durationMilliseconds = const Duration(milliseconds: 300);
  final int countDownStart = 30;

  int _countDown = 0;
  bool _show = true;
  double _realHeightMediaSize = 0;

  @override
  void initState() {
    _countDown = countDownStart;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _realHeightMediaSize = (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight);
    super.didChangeDependencies();
  }

  _startCountDown() async {
    await Future.delayed(const Duration(seconds: 1));
    if (_countDown == 0) {
      _countDown = countDownStart;
      setState(() {
        _show = true;
      });
      return;
    }

    setState(() {
      _countDown--;
    });

    _startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: _realHeightMediaSize * 0.75,
                child: const Text(
                  'seconds',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: _durationMilliseconds,
                reverseDuration: _durationMilliseconds,
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (widget, animation) => ScaleTransition(
                  scale: animation,
                  child: widget,
                ),
                child: _show
                    ? Container(
                        color: Theme.of(context).primaryColor,
                        width: 5,
                        height: 30,
                      )
                    : BackgroundWidget(
                        time: countDownStart,
                      ),
              ),
              AnimatedPositioned(
                duration: _durationMilliseconds,
                bottom: _realHeightMediaSize * 0.52,
                left: _show ? 0 : -MediaQuery.of(context).size.width,
                child: const TraceWidget(),
              ),
              AnimatedPositioned(
                duration: _durationMilliseconds,
                bottom: _realHeightMediaSize * 0.52,
                right: _show ? 0 : -MediaQuery.of(context).size.width,
                child: const TraceWidget(),
              ),
              AnimatedPositioned(
                duration: _durationMilliseconds,
                bottom: _show ? _realHeightMediaSize * 0.77 : _realHeightMediaSize * 0.5,
                child: Text(
                  '$_countDown',
                  style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white),
                ),
              ),
              AnimatedPositioned(
                duration: _durationMilliseconds,
                bottom: _show ? _realHeightMediaSize * 0.20 : -100,
                child: StartWidget(
                  onPress: () {
                    setState(() {
                      _show = false;
                    });
                    _startCountDown();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
