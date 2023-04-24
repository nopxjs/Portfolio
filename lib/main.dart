import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 700) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  List indexappbar = [false, false, false];
  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.easeInOut);
  }

  void _scrollToAboutMe() {
    _scrollController.animateTo(930,
        duration: const Duration(seconds: 2), curve: Curves.easeInOut);
  }

  void _scrollToServices() {
    _scrollController.animateTo(1550,
        duration: const Duration(seconds: 2), curve: Curves.easeInOut);
  }

  void _scrollToContactrMe() {
    _scrollController.animateTo(1200,
        duration: const Duration(seconds: 2), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              splashColor: Colors.greenAccent,
              backgroundColor: Colors.green,
              onPressed: _scrollToTop,
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Appbar
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Omar Sammour',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w900),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => _scrollToAboutMe(),
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                indexappbar[0] = true;
                              } else {
                                indexappbar[0] = false;
                              }
                            });
                          },
                          child: Text(
                            'About me',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: !indexappbar[0]
                                  ? FontWeight.w200
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: _scrollToServices,
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                indexappbar[1] = true;
                              } else {
                                indexappbar[1] = false;
                              }
                            });
                          },
                          child: Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: !indexappbar[1]
                                  ? FontWeight.w200
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: _scrollToContactrMe,
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                indexappbar[2] = true;
                              } else {
                                indexappbar[2] = false;
                              }
                            });
                          },
                          child: Text(
                            'Contact me',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: !indexappbar[2]
                                  ? FontWeight.w200
                                  : FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 170,
              ),
              // * Who i am and CV
              Container(
                padding: const EdgeInsets.only(left: 25),
                constraints: const BoxConstraints(maxWidth: 450),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, I am Omar Sammour',
                      style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Fullstack Developer',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 126, 126, 126)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        myBtn(true, "I'm Useless Button ", () {}),
                        const SizedBox(
                          width: 15,
                        ),
                        myBtn(false, 'Learn More', () {
                          _scrollToAboutMe();
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              // * About Me
              Center(
                child: Column(
                  children: [
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(maxWidth: 780),
                      child: const Text(
                        "My name is omar sammour, i'm fullstack developer, i have experience with flutter, javascript, c# and photoshop and this is my portfolio, u can check my projects on Github,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    // * Contact Me!
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            kora(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Full Name',
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Omar Sammour',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            kora(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Email Address',
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'or.sammour@gmail.com',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            kora(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Instagram',
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Seko.dev',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            kora(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Github',
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'nopxjs',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    // * what i do
                    const Text(
                      'What i do',
                      style: TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        card(card1[2], 'Software Development', 'weird'),
                        card(card2[2], 'Web Devlopment', 'dev'),
                        card(card3[2], 'Game Devlopment', 'a'),
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    const Text(
                      'My Skills',
                      style: TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      height: 235,
                      padding: const EdgeInsets.all(40),
                      color: const Color.fromARGB(255, 35, 35, 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                '80%',
                                style: TextStyle(
                                  fontSize: 74,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 87, 87, 87),
                                ),
                              ),
                              const Text(
                                'Flutter',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                '80%',
                                style: TextStyle(
                                  fontSize: 74,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 87, 87, 87),
                                ),
                              ),
                              const Text(
                                'Javascript',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 74,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 87, 87, 87),
                                ),
                              ),
                              const Text(
                                'C#',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                '40%',
                                style: TextStyle(
                                  fontSize: 74,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 87, 87, 87),
                                ),
                              ),
                              const Text(
                                'Desgin',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List card1 = [350, 241, false];
  List card2 = [350, 241, false];
  List card3 = [350, 241, false];

  AnimatedContainer card(border, text, type) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutBack,
      padding: const EdgeInsets.all(40),
      alignment: Alignment.centerLeft,
      // width: !isHover ? 350 : 400,
      // height: !isHover ? 241 : 291,
      width: type == 'dev'
          ? card2[0]
          : type == 'weird'
              ? card1[0]
              : card3[0],
      height: type == 'dev'
          ? card2[1]
          : type == 'weird'
              ? card1[1]
              : card3[1],

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 35, 35, 35),
        border: BorderDirectional(
          bottom: BorderSide(
            color: Colors.green,
            width: border ? 5 : 0.01,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            if (value && type == 'weird') {
              card1[0] += 20;
              card1[1] += 20;
              card1[2] = true;
            } else if (value && type == "dev") {
              card2[0] += 20;
              card2[1] += 20;
              card2[2] = true;
            } else if (value && type == 'a') {
              card3[0] += 20;
              card3[1] += 20;
              card3[2] = true;
            } else {
              card1 = [350, 241, false];
              card2 = [350, 241, false];
              card3 = [350, 241, false];
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            type == 'dev'
                ? Image.asset('assets/Vector.png')
                : type == 'weird'
                    ? Image.asset('assets/Vector1.png')
                    : Image.asset('assets/Vector2.png'),
            Text(
              text,
              style: const TextStyle(
                fontSize: 36,
                letterSpacing: 2,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double gw = 165;
  double gh = 64;
  double w = 165;
  double h = 64;
  var hover = false;
  var ghover = false;
  InkWell myBtn(isGreen, text, onTap) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        if (value && isGreen) {
          setState(() {
            gh += 10;
            gw += 10;
          });
        } else if (value && !isGreen) {
          setState(() {
            h += 10;
            w += 10;
          });
        } else {
          setState(() {
            gw = 165;
            gh = 64;
            w = 165;
            h = 64;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutBack,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                isGreen ? Colors.green : const Color.fromARGB(255, 23, 23, 23),
            border:
                Border.all(color: Colors.white, width: !isGreen ? 1.5 : 0.01)),
        alignment: Alignment.center,
        width: isGreen ? gw : w,
        height: isGreen ? gh : h,
        child: Text(
          text.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }

  AnimatedContainer kora() {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      alignment: Alignment.center,
      width: 82,
      height: 82,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 35, 35, 35),
      ),
      child: Container(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
      ),
    );
  }
}
