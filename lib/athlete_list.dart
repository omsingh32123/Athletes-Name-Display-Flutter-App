import 'dart:convert';
import 'package:athlete_levels/level_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AthleteList extends StatefulWidget {
  const AthleteList({super.key});

  @override
  State<AthleteList> createState() => _AthleteListState();
}

class _AthleteListState extends State<AthleteList> {
  final FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  List<String> level = ['Basic', 'Intermediate', 'Advanced'];
  Map<String, List<String>> levelMap = {};

  @override
  void initState() {
    super.initState();
    _jsonToList();
  }

  Future<void> _jsonToList() async {
    try {
      String athleteString = await rootBundle.loadString('assets/Athlete.json');
      List<Map<String, String>> athleteLevelNameList =
          (jsonDecode(athleteString) as List<dynamic>)
              .cast<Map<String, dynamic>>()
              .map((item) => Map<String, String>.from(item))
              .toList();

      Map<String, List<String>> levelMap1 = {};

      for (var list in athleteLevelNameList) {
        var name = list['name'];
        var level = list['level'];

        if (name != null && level != null) {
          levelMap1.putIfAbsent(level, () => []).add(name);
        }
      }
      setState(() {
        levelMap = levelMap1;
      });
      // print(levelMap);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    try {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(17, 24, 40, 1),
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(20),
        //     ),
        //   ),
        //   shadowColor: const Color.fromARGB(0, 0, 0, 0),
        //   backgroundColor: Colors.black,
        //   title: const Center(child: Text('ATHLETARIA')),
        //   elevation: 10,
        // ),
        body: LevelList(levelMap: levelMap, level: level),
      );
    } catch (e) {
      return Text("error $e");
    }
  }

  // void _showPopup(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: SizedBox(
  //           height: MediaQuery.of(context).size.height * 0.26,
  //           child: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     const SizedBox(
  //                       width: 30,
  //                     ),
  //                     const Text(
  //                       'Tutorial',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           fontSize: 21, fontWeight: FontWeight.w500),
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       style: const ButtonStyle(
  //                           shadowColor: MaterialStatePropertyAll(
  //                               Color.fromARGB(0, 255, 255, 255)),
  //                           backgroundColor: MaterialStatePropertyAll(
  //                               const Color.fromRGBO(17, 24, 40, 1)),
  //                           shape: MaterialStatePropertyAll(
  //                             CircleBorder(),
  //                           )),
  //                       child: const Icon(
  //                         Icons.close,
  //                         color: Color.fromARGB(255, 0, 0, 0),
  //                         size: 20,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 Container(
  //                   padding: const EdgeInsets.all(10),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(20),
  //                     color: const Color.fromRGBO(17, 24, 40, 1),
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children: [
  //                       SizedBox(
  //                           width: MediaQuery.of(context).size.width * 0.4,
  //                           child: const Text(
  //                               'Scroll Horizontally for more levels')),
  //                       const Icon(
  //                         Icons.arrow_forward,
  //                         size: 25,
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Container(
  //                   padding: const EdgeInsets.all(10),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(20),
  //                     color: const Color.fromRGBO(17, 24, 40, 1),
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children: [
  //                       SizedBox(
  //                           width: MediaQuery.of(context).size.width * 0.4,
  //                           child:
  //                               const Text('Scroll Vertically for more names')),
  //                       const Icon(
  //                         Icons.arrow_downward,
  //                         size: 25,
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
