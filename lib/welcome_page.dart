import 'package:app_intro/screens/screen1.dart';

import 'package:app_intro/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController();
  String buttonText = "Get strated";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              if (index == 2) {
                buttonText = "Get started";
              } else {
                buttonText = "Next";
              }
              setState(
                  () {}); // Permet au boutton de changer à fonction de l'image
            },
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 300),
                  child: Image.asset(
                    'assets/img/img1.jpg',
                    width: MediaQuery.of(context)
                        .size
                        .width, // Largeur de l'image égale à la largeur de l'écran
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 330),
                  child: Image.asset(
                    'assets/img/img2.jpg',
                    width: MediaQuery.of(context)
                        .size
                        .width, // Largeur de l'image égale à la largeur de l'écran
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 300),
                  child: Image.asset(
                    'assets/img/img3.jpg',
                    width: MediaQuery.of(context)
                        .size
                        .width, // Largeur de l'image égale à la largeur de l'écran
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const Form1(),
          const Padding(
            padding: EdgeInsets.only(top: 480, left: 30),
            child: Text(
              "Let's find your\ndream vacation",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontFamily: 'FontsFree',
                letterSpacing: -2.0,
                height: 1,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 590, left: 30),
            child: Text(
              'Hotels,Resorts,Hostels & more get the\nbest prices on 2,000,000+ properties,\nworldnwide',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 108, 108, 108)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 430, left: 30),
            child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'FontsFree',
                    ),
                    children: <TextSpan>[
                  TextSpan(
                      text: '01',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '.03',
                      style:
                          TextStyle(color: Color.fromARGB(255, 119, 116, 106)))
                ])),
          ),
          Container(
              alignment: const Alignment(0, 0.8),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController, // Le contrôleur pour PageView
                      count: 3, // Nombre de pages
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xff018868),
                        spacing: 1.0, // Couleur du rectangle actif
                        dotColor: Color.fromARGB(255, 218, 218,
                            218), // C'est la couleur des rectangles inactifs
                        dotWidth:
                            20.0, // C'est la largeur des rectangles inactifs
                        dotHeight:
                            8.0, // C'est la hauteur commune des rectangles
                        expansionFactor:
                            3.0, // Facteur d'expansion du rectangle actif (2.0 pour le doubler)
                        radius:
                            0.0, // Permet d'arrondir légèrement les angles des rectangles
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (buttonText == "Get started") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Screen1()),
                          );
                        } else {
                          // Permet de passer à l'image suivante
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff018868),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            buttonText,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
