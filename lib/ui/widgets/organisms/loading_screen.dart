import 'package:flutter/material.dart';

class FullscreenLoading extends StatefulWidget {
  const FullscreenLoading({Key? key}) : super(key: key);

  @override
  _FullscreenLoadingState createState() => _FullscreenLoadingState();
}

class _FullscreenLoadingState extends State<FullscreenLoading>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var br = Theme.of(context).brightness;
    return SizedBox.expand(
      child: Container(
        color: br == Brightness.dark ? Colors.black87 : Colors.white12,
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
