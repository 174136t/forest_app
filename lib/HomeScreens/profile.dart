import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/HomeScreens/editProfile.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: FadeAnimation(
        1.2,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Center(
                child: Text(
                  'My Profile',
                  style: GoogleFonts.montserrat(
                      fontSize: SizeConfig.heightMultiplier * 4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2),
                child: Container(
                  height: SizeConfig.heightMultiplier * 10,
                  // color: Colors.red,
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
                        radius: SizeConfig.heightMultiplier * 4.5,
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
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.heightMultiplier * 0.5),
                              ),
                              Container(
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.forum,
                                          color: Colors.grey[700],
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 1.5,
                                        ),
                                        Text(
                                          '4 posts  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
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
                                          Icons.emoji_emotions,
                                          color: Colors.grey[700],
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 1.5,
                                        ),
                                        Text(
                                          '174 Total likes',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[700],
                                              fontSize:
                                                  SizeConfig.heightMultiplier *
                                                      2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: SizeConfig.heightMultiplier * 0.5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfile(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: SizeConfig.heightMultiplier * 4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                    child: Center(
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.heightMultiplier *
                                                    3),
                                      ),
                                    ),
                                  ),
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
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_circle),
                          Text(
                            '  Lahiru Neranjan',
                            style: GoogleFonts.montserrat(
                                fontSize: SizeConfig.heightMultiplier * 2.5,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail),
                          Text(
                            '  lahiruneranjan123@gmail.com',
                            style: GoogleFonts.montserrat(
                                fontSize: SizeConfig.heightMultiplier * 2,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text(
                            '  No 19, Punsirigama, Kuruwita',
                            style: GoogleFonts.montserrat(
                                fontSize: SizeConfig.heightMultiplier * 2,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_city),
                          Text(
                            '  Rathnapura',
                            style: GoogleFonts.montserrat(
                                fontSize: SizeConfig.heightMultiplier * 2,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 10),
                child: Divider(),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2),
                child: Text(
                  'My Posts',
                  style: GoogleFonts.montserrat(
                      fontSize: SizeConfig.heightMultiplier * 2.7,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              ListView.builder(
                itemCount: 4,
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
