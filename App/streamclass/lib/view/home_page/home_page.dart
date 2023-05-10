import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController? _tabController;
  final tab = [
    'Home',
    'Professor',
    'Materias',
    'Forum',
    'User',
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            image: AssetImage(
              "assets/background.jpg",
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 20.h,
                  width: 100.w,
                  color: Colors.blueGrey.withOpacity(.9),
                )),
            Positioned(
              top: 5.5.h,
              left: 6.0.w,
              child: Text(
                "Stream Class",
                style: TextStyle(
                  fontSize: 5.h,
                  color: Colors.white,
                  fontFamily: 'JockeyOne',
                ),
              ),
            ),
            Positioned(
              top: 12.h,
              left: 6.0.w,
              child: ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  itemCount: tab.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Text(
                          tab[index],
                          style: TextStyle(fontSize: 5.h),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
