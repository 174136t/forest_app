import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/HomeScreens/barcode_generator.dart';
import 'package:forest_app/HomeScreens/barcode_reader.dart';
import 'package:forest_app/HomeScreens/newsFeed.dart';
import 'package:forest_app/HomeScreens/profile.dart';
import 'package:forest_app/utils/constants.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:forest_app/widgets/hero_text.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  int currentIndex;

  bool isDrawerOpen = false;
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Th',
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: SizeConfig.heightMultiplier * 3,
            fontWeight: FontWeight.w900,
            color: isDrawerOpen ? Colors.deepPurple[800] : Colors.orange[800],
          ),
          children: [
            TextSpan(
              text: 'u',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'r',
              style: TextStyle(
                color:
                    isDrawerOpen ? Colors.deepPurple[800] : Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'u A',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'pp',
              style: TextStyle(
                color:
                    isDrawerOpen ? Colors.deepPurple[800] : Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
    );
  }

  Future<bool> _onWillPop() {
    // DateTime now = DateTime.now();

    return showDialog(
      context: context,
      builder: (context) => new Theme(
        data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.white),
        child: AlertDialog(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit from this App?'),
          actions: <Widget>[
            new FlatButton(
              color: Colors.red[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => exit(0),
              child: new Text('Yes'),
            ),
            new FlatButton(
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
          ],
        ),
      ),
    );
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);
    });
  }

  Widget newsFeedItem() {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 0.5),
      child: GestureDetector(
        onTap: () {
          isDrawerOpen
              ? setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                })
              : null;
        },
        child: Container(
          height: SizeConfig.heightMultiplier * 58,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),

            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.0, 5.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.8),
            child: Column(
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: SizeConfig.heightMultiplier * 5,
                      //   width: SizeConfig.heightMultiplier * 15,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(100)),
                      //     image: DecorationImage(
                      //       image: const AssetImage('assets/boy.png'),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Image.asset(
                          'assets/planting4.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      SizedBox(width: SizeConfig.widthMultiplier * 2),
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lahiru Neranjan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.heightMultiplier * 2.3),
                              ),
                              Container(
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          color: Colors.grey[700],
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 1.5,
                                        ),
                                        Text(
                                          '6 min  ',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.grey[700],
                                              fontSize:
                                                  SizeConfig.heightMultiplier *
                                                      2),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_city,
                                          color: Colors.grey[700],
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 1.5,
                                        ),
                                        Text(
                                          'at Rathnapura',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.grey[700],
                                              fontSize:
                                                  SizeConfig.heightMultiplier *
                                                      2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      // Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  // color: Colors.red,
                  height: SizeConfig.heightMultiplier * 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Plant 5 trees\ntoday in our garden..',
                        style: GoogleFonts.montserrat(
                            fontSize: SizeConfig.heightMultiplier * 1.9),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 0.5,
                ),
                Image.asset(
                  'assets/planting2.png',
                  height: SizeConfig.heightMultiplier * 37,
                  width: SizeConfig.widthMultiplier * 95,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ReactiveButton(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         // border: Border.all(
                      //         //   color: Colors.black,
                      //         //   width: 1.0,
                      //         // ),
                      //         // color: Colors.red,
                      //         ),
                      //     // width: SizeConfig.widthMultiplier * 30,
                      //     height: SizeConfig.heightMultiplier * 5,
                      //     child: Center(
                      //       child: facebook == null
                      //           ? Row(
                      //               children: [
                      //                 Icon(
                      //                   Icons.thumb_up,
                      //                   size: SizeConfig.heightMultiplier * 1.8,
                      //                 ),
                      //                 Text(
                      //                   ' like',
                      //                   style: TextStyle(
                      //                       fontSize:
                      //                           SizeConfig.heightMultiplier *
                      //                               1.6),
                      //                 ),
                      //               ],
                      //             )
                      //           : Image.asset(
                      //               'assets/images/$facebook.png',
                      //               width: 32.0,
                      //               height: 32.0,
                      //             ),
                      //     ),
                      //   ),
                      //   icons: _facebook, //_flags,
                      //   onTap: () {
                      //     print('TAP');
                      //   },
                      //   onSelected: (ReactiveIconDefinition button) {
                      //     setState(() {
                      //       facebook = button.code;
                      //     });
                      //   },
                      //   iconWidth: 32.0,
                      // ),
                      Container(
                        // width: SizeConfig.widthMultiplier * 40,
                        //  color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: SizeConfig.heightMultiplier * 1.8,
                            ),
                            Text(
                              ' Like',
                              style: TextStyle(
                                  fontSize: SizeConfig.heightMultiplier * 1.6),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // width: SizeConfig.widthMultiplier * 40,
                        //  color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.comment,
                              size: SizeConfig.heightMultiplier * 1.8,
                            ),
                            Text(
                              ' Comment',
                              style: TextStyle(
                                  fontSize: SizeConfig.heightMultiplier * 1.6),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // width: SizeConfig.widthMultiplier * 25,
                        //  color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.offline_share,
                              size: SizeConfig.heightMultiplier * 1.8,
                            ),
                            Text(
                              ' Share',
                              style: TextStyle(
                                  fontSize: SizeConfig.heightMultiplier * 1.6),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   height: SizeConfig.heightMultiplier*37,
                //   color: Colors.blue,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // ignore: todo
    super.initState();
    currentIndex = 2;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: <Widget>[
          GestureDetector(
              onTap: () {
                isDrawerOpen
                    ? setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      })
                    : null;
              },
              child: BarCodeReader()),
          GestureDetector(
              onTap: () {
                isDrawerOpen
                    ? setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      })
                    : null;
              },
              child: BarcodeGeneratorScreen()),
          GestureDetector(
            onTap: () {
              isDrawerOpen
                  ? setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    })
                  : null;
            },
            child: SingleChildScrollView(
              child: FadeAnimation(
                1.2,
                Container(
                  height: SizeConfig.heightMultiplier * 100,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: SizeConfig.heightMultiplier * 25,
                              decoration: BoxDecoration(
                                  color: isDrawerOpen
                                      ? Colors.orange[800]
                                      : Colors.green[800],
                                  borderRadius: BorderRadius.only(

                                      // topLeft: Radius.circular(isDrawerOpen ? 40 : 0),

                                      // bottomLeft:

                                      //     Radius.circular(isDrawerOpen ? 0 : 40),

                                      // bottomRight:

                                      //     Radius.circular(isDrawerOpen ? 0 : 40),

                                      )),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 3.5,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        isDrawerOpen
                                            ? IconButton(
                                                icon: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    xOffset = 0;

                                                    yOffset = 0;

                                                    scaleFactor = 1;

                                                    isDrawerOpen = false;
                                                  });
                                                },
                                              )
                                            : IconButton(
                                                icon: Icon(
                                                  Icons.menu,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    xOffset = 230;

                                                    yOffset = 150;

                                                    scaleFactor = 0.6;

                                                    isDrawerOpen = true;
                                                  });
                                                }),
                                        Column(
                                          children: [_title()],
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Image.asset(
                                            'assets/planting4.png',
                                            filterQuality: FilterQuality.high,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(20.0),

                              child: Center(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.heightMultiplier * 12),
                                    height: SizeConfig.heightMultiplier * 25,
                                    width: SizeConfig.widthMultiplier * 90,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,

                                            offset: Offset(0.0, 5.0), //(x,y)

                                            blurRadius: 6.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Carousel(
                                      images: [
                                        NetworkImage(
                                            'https://image.freepik.com/free-photo/front-view-male-hands-holding-soil-plant_23-2148814121.jpg'),
                                        NetworkImage(
                                            'https://image.freepik.com/free-photo/close-up-picture-hand-watering-sapling-plant_1150-28357.jpg'),
                                        NetworkImage(
                                            'https://image.freepik.com/free-photo/close-up-picture-hand-holding-planting-sapling-plant_1150-28360.jpg'),
                                        NetworkImage(
                                            'https://image.freepik.com/free-photo/family-with-with-little-sons-are-planting-tree-yard_1157-37430.jpg'),
                                      ],
                                      borderRadius: true,
                                      boxFit: BoxFit.fill,
                                      dotBgColor: Colors.transparent,
                                      dotPosition: DotPosition.bottomCenter,
                                      dotColor: Colors.white,
                                      dotIncreasedColor: Colors.orange,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            Container(
                              height: SizeConfig.heightMultiplier * 7,
                              width: SizeConfig.widthMultiplier * 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],

                                    offset: Offset(0.0, 5.0), //(x,y)

                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.tree),  Icon(FontAwesomeIcons.tree),
                                  Text('  No of Trees : ',
                                  style: GoogleFonts.montserrat(
                                    fontSize: SizeConfig.heightMultiplier*2.4,
                                    fontWeight: FontWeight.w600
                                  ),),
                                  HeroText1(
                                    animationDelay: 0,
                                    heroText: ['2021 '],
                                    heroTextSize:
                                        SizeConfig.heightMultiplier * 2.5,
                                  ),  Icon(FontAwesomeIcons.tree),  Icon(FontAwesomeIcons.tree),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isDrawerOpen
                                        ? setState(() {
                                            xOffset = 0;
                                            yOffset = 0;
                                            scaleFactor = 1;
                                            isDrawerOpen = false;
                                          })
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BarCodeReader(),
                                            ),
                                          );
                                  },
                                  child: Container(
                                    height: SizeConfig.heightMultiplier * 5,
                                    width: SizeConfig.widthMultiplier * 45,
                                    decoration: BoxDecoration(
                                      gradient: greenGradient2,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,

                                          offset: Offset(0.0, 5.0), //(x,y)

                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Barcode Reader",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.heightMultiplier *
                                                    2),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isDrawerOpen
                                        ? setState(() {
                                            xOffset = 0;
                                            yOffset = 0;
                                            scaleFactor = 1;
                                            isDrawerOpen = false;
                                          })
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BarcodeGeneratorScreen(),
                                            ),
                                          );
                                  },
                                  child: Container(
                                    height: SizeConfig.heightMultiplier * 5,
                                    width: SizeConfig.widthMultiplier * 45,
                                    decoration: BoxDecoration(
                                      gradient: greenGradient1,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,

                                          offset: Offset(0.0, 5.0), //(x,y)

                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Barcode Generator",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.heightMultiplier *
                                                    2),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: SizeConfig.heightMultiplier * 1,
                            // ),
                            ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return newsFeedItem();
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 0.5,
                            ),
                            GestureDetector(
                              onTap: () {
                                isDrawerOpen
                                    ? setState(() {
                                        xOffset = 0;
                                        yOffset = 0;
                                        scaleFactor = 1;
                                        isDrawerOpen = false;
                                      })
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsFeed(),
                                        ),
                                      );
                              },
                              child: Container(
                                height: SizeConfig.heightMultiplier * 7,
                                width: SizeConfig.widthMultiplier * 65,
                                decoration: BoxDecoration(
                                    color: Colors.orange[700],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'See All!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize:
                                            SizeConfig.heightMultiplier * 2.5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                isDrawerOpen
                    ? setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      })
                    : null;
              },
              child: NewsFeed()),
          GestureDetector(
              onTap: () {
                isDrawerOpen
                    ? setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      })
                    : null;
              },
              child: Profile()),
        ][currentIndex],
        bottomNavigationBar: FloatingNavbar(
          onTap: changePage,
          currentIndex: currentIndex,
          backgroundColor:
              isDrawerOpen ? Colors.green[700] : Colors.deepPurple[700],
          items: [
            FloatingNavbarItem(icon: Icons.scanner, title: 'Scan'),
            FloatingNavbarItem(icon: Icons.read_more, title: 'Generate'),
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.explore, title: 'Posts'),
            FloatingNavbarItem(icon: Icons.account_circle, title: 'Profile'),
          ],
        ),
      ),
    );
  }
}
