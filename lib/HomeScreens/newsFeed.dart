import 'package:flutter/material.dart';
import 'package:flutter_reactive_button/flutter_reactive_button.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/HomeScreens/postItem.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  String facebook;
  List<ReactiveIconDefinition> _facebook = <ReactiveIconDefinition>[
    ReactiveIconDefinition(
      assetIcon: 'assets/images/like.gif',
      code: 'like',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/images/haha.gif',
      code: 'haha',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/images/love.gif',
      code: 'love',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/images/sad.gif',
      code: 'sad',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/images/wow.gif',
      code: 'wow',
    ),
    ReactiveIconDefinition(
      assetIcon: 'assets/images/angry.gif',
      code: 'angry',
    ),
  ];
  Widget newsFeedItem() {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 0.5),
      child: GestureDetector(
        onTap: () {},
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: FadeAnimation(
        1.2,
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Container(
                height: SizeConfig.heightMultiplier * 10,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 1),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Image.asset(
                          'assets/planting4.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostItem(),
                              ),
                            );
                          },
                          child: Container(
                            height: SizeConfig.heightMultiplier * 7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Center(
                                child: Text(
                              'Post New Item',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.heightMultiplier * 2.6,
                                  color: Colors.grey[700]),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return newsFeedItem();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
