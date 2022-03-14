import 'package:flutter/material.dart';
import 'package:flutter_web/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget navItem({title, index}) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: index == selectedIndex ? activeBar : titleBar,
            ),
            Container(
                width: 66,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: index == selectedIndex
                      ? redLightColor
                      : Colors.transparent,
                ))
          ],
        ),
      );
    }

    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'images/bg.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
            child: Column(
              children: [
                // NOTE: NAVIGATION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 72,
                      height: 40,
                    ),
                    Row(
                      children: [
                        navItem(
                          title: 'Guides',
                          index: 0,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        navItem(
                          title: 'Pricing',
                          index: 1,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        navItem(
                          title: 'Team',
                          index: 2,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        navItem(
                          title: 'Stories',
                          index: 3,
                        ),
                      ],
                    ),
                    Image.asset(
                      'images/btn.png',
                      width: 163,
                      height: 53,
                    ),
                  ],
                ),

                // NOTE: CONTENT
                SizedBox(
                  height: 77,
                ),
                Image.asset(
                  'images/illustration.png',
                  height: 500,
                ),
                SizedBox(
                  height: 84,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_down_circle,
                      size: 25,
                      color: redLightColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Scroll to Learn More',
                      style: activeBar,
                    ),
                  ],
                ),
                SizedBox(
                  height: 77,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
