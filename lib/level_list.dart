import 'package:flutter/material.dart';

import 'name_list.dart';

class LevelList extends StatefulWidget {
  final Map<String, List<String>> levelMap;
  final List<String> level;

  const LevelList({required this.levelMap, required this.level, super.key});

  @override
  State<LevelList> createState() => _LevelListState();
}

class _LevelListState extends State<LevelList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(17, 24, 40, 1),
        leading: ClipOval(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Image.asset(
              'assets/olympic-less.png',

              width: 60, // Adjust the width based on your preference
              height: 60, // Adjust the height based on your preference
              fit: BoxFit
                  .fitWidth, // This property controls how the image is fitted within its bounds
            ),
          ),
        ),
        title: Text(
          'Olympic 2020',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notification icon action here
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(17, 24, 40, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(10,0,0,0),
            //   width: screenWidth,
            //   child: const Text(
            //     "Welcome",
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //       fontSize: 30,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10,),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(10,10,10,10),
            //   height: screenHeight*0.2,
            //   width: screenWidth,
            //   // padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: const Color.fromARGB(255, 255, 255, 255),
            //     borderRadius: BorderRadius.circular(40),
            //   ),
            //   child: Image.asset('assets/title.png', fit: BoxFit.cover, height: double.infinity, width:double.infinity,),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: SizedBox(
                height: screenHeight * 0.23,
                width: screenWidth,
                child: const Column(
                  children: [
                    Text(
                      "Tokyo ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        // fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Summer Olympic 2020",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        // fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "List of Division",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.5,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverFixedExtentList(
                    itemExtent: screenWidth,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        String currentLevel = widget.level[index];
                        try {
                          List<String>? currentLevelNames =
                              widget.levelMap[currentLevel];
                          if (currentLevelNames == null) {
                            return SizedBox(
                                width: screenWidth,
                                child: Center(child: Text(currentLevel)));
                          } else {
                            return NameList(
                                currentLevel: currentLevel,
                                currentLevelNames: currentLevelNames);
                          }
                        } catch (e) {
                          return Text("error $e");
                        }
                      },
                      childCount: widget.level.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
