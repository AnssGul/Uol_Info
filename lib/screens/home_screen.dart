import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:uol_info/constants/icons.dart';
import 'package:uol_info/widgets/custom_images.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uol_info/constants/icons.dart';
import 'package:uol_info/widgets/custom_images.dart';
import 'home_detail.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the home details screen after 10 seconds
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeDetail()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white, // Assuming app theme color is green
            ),
          ),
          AnimatedLogo(),
          Positioned(
            bottom: 20.0,
            left: 5,
            right: 0,
            child:Column(
              children: [
                SizedBox(
                  height: 55,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        FadeAnimatedText(
                          'Develop by Muhammad Anus Gul Nissoana',
                        ),

                            FadeAnimatedText(
                              'Nissoana',
                            ),


                      ],
                    ),
                  ),
                ),

              ],
            )
          ),
        ],
      ),
    );
  }
}
class AnimatedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomImageWidget(image: AppIcons.appicon), // Use your logo here
    );
  }
}


// class AnimatedLogo extends StatefulWidget {
//   @override
//   _AnimatedLogoState createState() => _AnimatedLogoState();
// }
//
// class _AnimatedLogoState extends State<AnimatedLogo> {
//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween<double>(begin: MediaQuery.of(context).size.height, end: 0),
//       duration: Duration(seconds: 6),
//       builder: (context, value, child) {
//         return Center(
//           child: SizedBox(
//             height: value,
//             width: value,
//             child: child,
//           ),
//         );
//       },
//       child: CustomImageWidget(image: AppIcons.appicon), // Use your logo here
//     );
//   }
// }
