import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class _PageTransitionController {

  Key pageKey = const ValueKey("page_transition");

  final Duration scaleAnimationDuration = const Duration(milliseconds: 250);
  AnimationController? scaleAnimationController;
  Animation<double>? scaleAnimation;

  initializeAnimationController({required TickerProvider vsync}) {
    scaleAnimationController = AnimationController(
      vsync: vsync,
      duration: scaleAnimationDuration,
    );

    scaleAnimation = Tween(begin: 1.0, end: 0.75).animate(
      CurvedAnimation(
          parent: scaleAnimationController!.view, curve: Curves.easeInExpo),
    );
  }

  animateScaleTransition(
      {required BuildContext context, required Widget routePage}) {
    scaleAnimationController!.forward().then(
          (value) {
        scaleAnimationController!.reverse();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => routePage,
          ),
        );
      },
    );
  }
}

class PageTransitionButton extends StatefulWidget {
  const PageTransitionButton({
    Key? key, required this.vsync, required this.child, required this.nextPage,
  }) : super(key: key);

  final TickerProvider vsync;
  final Widget child;
  final Widget nextPage;

  @override
  State<PageTransitionButton> createState() => _PageTransitionButtonState();
}

class _PageTransitionButtonState extends State<PageTransitionButton> {
  final _PageTransitionController _homeScreenController = _PageTransitionController();

  @override
  void initState() {
    super.initState();
    _homeScreenController.initializeAnimationController(vsync: widget.vsync);
  }

  @override
  void dispose() {
    super.dispose();
    _homeScreenController.scaleAnimationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _homeScreenController.scaleAnimation!,
      child: Hero(
        tag: /*"page_transition"*/_homeScreenController.pageKey,
        child: GestureDetector(
          onTap: () =>
              _homeScreenController.animateScaleTransition(context: context, routePage: widget.nextPage),
          child: widget.child,
        ),
      ),
    );
  }
}

class PageTransitionReceiver extends StatefulWidget {
  const PageTransitionReceiver({Key? key, required this.scaffold}) : super(key: key);

  final Scaffold scaffold;
  @override
  _PageTransitionReceiverState createState() => _PageTransitionReceiverState();
}

class _PageTransitionReceiverState extends State<PageTransitionReceiver> {

  final _PageTransitionController _pageTransitionController = _PageTransitionController();
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _pageTransitionController.pageKey,
      child: widget.scaffold,
    );
  }
}