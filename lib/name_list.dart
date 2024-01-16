import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NameList extends StatelessWidget {
  final List<String> currentLevelNames;
  final String currentLevel;
  // final Map<String, List<String>> levelMap;
  // final int index;
  const NameList(
      {required this.currentLevel, required this.currentLevelNames, super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    try {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(17, 24, 40, 1),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: screenHeight,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(34),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Color.fromARGB(255, 193, 193, 193),
              //     blurRadius: 7.0,
              //     spreadRadius: 3,
              //   )
              // ],
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: Text(
                    currentLevel.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: AutofillHints.addressCity,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(17, 24, 40, 1),
                            // image: const DecorationImage(
                            //   image: AssetImage('assets/tilebackground.png'),
                            //   fit: BoxFit.cover,
                            // ),
                            borderRadius: BorderRadius.circular(22),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Color.fromARGB(255, 235, 235, 235),
                            //     blurRadius: 3.0,
                            //     spreadRadius: 1,
                            //   )
                            // ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle_rounded,
                                size: 20,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                currentLevelNames[index],
                                style: const TextStyle(
                                  fontFamily: AutofillHints.addressCity,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ));
                    },
                    childCount: currentLevelNames.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Text("error");
    }
  }
}
