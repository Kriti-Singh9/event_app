import 'package:event_app/NavDrawer/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Usefull/Colors.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();


class homeScreen extends StatefulWidget {
  Map data;
  homeScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  bool isHide = false;
  int _index = 0;
  List bottomItems = [];


  @override
  void initState() {
    // testApi();
    setState(() {
      bottomItems = [
        Column(),
        Column(),
        Column(),
        Column(),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: bgColor,
      drawer: navigationDrawer(allData:{}),
      appBar: AppBar(
        backgroundColor: transparent_overlay,
        elevation: 0.0,
        leading: Row(
          children: [
            SizedBox(
            ),
            IconButton(onPressed: (){
              _key.currentState!.openDrawer();
            }, icon: Icon(Iconsax.menu_1))
          ],
        ),
        centerTitle: true,
        title: Row(
          children: [
            // Icon(Iconsax.car),
            SizedBox(width: 3.0,),
          ],
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Iconsax.notification))
        ],
      ),

      bottomNavigationBar: Container(
        color: mainColor,
        child: SalomonBottomBar(
          currentIndex: _index,
          unselectedItemColor: bgColor,
          selectedItemColor: Colors.white,
          onTap: (i){
            setState(() {
              _index = i;
            });
          },
          items: [
            SalomonBottomBarItem(icon: Icon(Iconsax.home,),
                title: mainText("Home", Colors.white, 10.0, FontWeight.normal, 1)),

            SalomonBottomBarItem(icon: Icon(Iconsax.box,),
                title: mainText("Children", Colors.white, 10.0, FontWeight.normal, 1)),

            SalomonBottomBarItem(icon: Icon(Iconsax.add_circle,),
                title: mainText("Profile", Colors.white, 10.0, FontWeight.normal, 1)),

            SalomonBottomBarItem(icon: Icon(Iconsax.user,),
                title: mainText("Profile", Colors.white, 10.0, FontWeight.normal, 1)),

          ],
        ),
      ),

      body:bottomItems.elementAt(_index),
    );
  }
}
