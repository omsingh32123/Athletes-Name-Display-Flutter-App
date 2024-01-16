import 'package:athlete_levels/athlete_list.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Image.asset(
                    'assets/tokyo.png',
                    width: screenWidth * 0.6,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(10)),
                        backgroundColor: const MaterialStatePropertyAll(
                            const Color.fromRGBO(17, 24, 40, 1)),
                        shadowColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 205, 205, 205)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AthleteList()),
                      );
                    },
                    child: Center(
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                            fontFamily: AutofillHints.addressCity,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  )
                ])));
  }
}
