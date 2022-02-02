# Animated page transition

This package for page transition animation. With this package you can give have smooth page transitions in your apps. chack out the video given below!!!


![VID_20220201122805](https://user-images.githubusercontent.com/81064834/152094077-cf4bef50-cbe4-4925-bcde-eb4acd0587d6.gif)


## Usage

Add animation_page_transition dependency into the pubspec.yaml file

then import package into the implementation file/s.

```dart
import 'package:animated_page_transition/animated_page_transition.dart';
```

You can implement animated page transition very easily. 

First of all wrap your button with [PageTransitionButton] widget, example code is given below:

To use [PageTransitionButton] you have to add [TickerProviderStateMixin] into your widget.

```dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionButton(
          vsync: this,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFFF9735),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          nextPage: const SecondScreen(),
        ),
      ),
    );
  }
}
```

Then wrap the scaffold of the second screen with [PageTransitionReceiver] widget where you want to navigate it as given below:

```dart
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionReceiver(
      scaffold: const Scaffold(
        backgroundColor: Color(0xFFFF9735),
      ),
    );
  }
}
```

And now you are ready to go!!!

Have fun and happy coding ;)
