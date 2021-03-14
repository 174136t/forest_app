import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/Authentication/signin.dart';
import 'package:forest_app/Authentication/signup.dart';
import 'package:forest_app/utils/constants.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:forest_app/widgets/curved_widget.dart';
import 'package:forest_app/widgets/hero_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rect_getter/rect_getter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          title: 'Forest App',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MyHomePage(),
          debugShowCheckedModeBanner: false,
        );
      });
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;

  void _onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: NewPage()))
        .then((_) => setState(() => rect = null));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Th',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 60,
            fontWeight: FontWeight.w900,
            color: Colors.green[700],
          ),
          children: [
            TextSpan(
              text: 'u',
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 60,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'r',
              style: TextStyle(
                color: Colors.green[700],
                fontSize: 60,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'u',
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 60,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.7),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.green[900],
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Stack(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    // FadeAnimation(
                    //   1,
                    //   Image.asset(
                    //     'assets/path.png',
                    //     width: MediaQuery.of(context).size.width,
                    //     // height: MediaQuery.of(context).size.height,
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),
                    // FadeAnimation(
                    //     1,
                    //     // Positioned.fill(
                    //     //     // width: MediaQuery.of(context).size.width*100,
                    //     //     // height: MediaQuery.of(context).size.height*100,
                    //     //   // margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*10),
                    //     //   // top: SizeConfig.heightMultiplier*100,
                    //     //   child: Image.asset('assets/aloevera.jpg',
                    //     //   // height:SizeConfig.heightMultiplier*50,
                    //     //   fit: BoxFit.fitWidth,
                    //     //   alignment: Alignment.bottomRight,),

                    //     Container(
                    //       margin: EdgeInsets.only(
                    //           top: SizeConfig.heightMultiplier * 50),
                    //           height: SizeConfig.heightMultiplier * 150,
                    //       color: Colors.red,
                    //       child: Image.asset('assets/aloevera.jpg',
                    //       height:SizeConfig.heightMultiplier*150,
                    //       fit: BoxFit.fitHeight,
                    //      ),
                    //     )),
                    // FadeAnimation(
                    //                   1.6, Center(
                    //     child: Container(
                    //       margin: EdgeInsets.only(top: SizeConfig.heightMultiplier*90),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(25),
                    //           topRight: Radius.circular(25)
                    //         ),
                    //         // color: Colors.red
                    //         gradient: blueSexyGradient
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: CurvedWidget(
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.heightMultiplier * 50,
                          decoration: (BoxDecoration(
                            // color: Colors.green[800],
                            gradient: greenGradient
                          )),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.8,
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier * 15),
                          height: SizeConfig.heightMultiplier * 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey[300],

                            //     offset: Offset(0.0, 5.0), //(x,y)

                            //     blurRadius: 6.0,
                            //   ),
                            // ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Welcome to,',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.04)),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 2,
                                ),
                                // _title()
                                Container(
                                  height: SizeConfig.heightMultiplier * 10,
                                  child: HeroText(
                                    animationDelay: 1.2,
                                    heroText: ['Thuru App'],
                                    heroTextSize:
                                        SizeConfig.heightMultiplier * 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                        1.8,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 40,
                            ),
                            Center(
                              child: Image.asset(
                                'assets/planting3.png',
                                height: SizeConfig.heightMultiplier * 30,
                                filterQuality: FilterQuality.low,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: _onTap,
                                child: Container(
                                  child: AvatarGlow(
                                    glowColor: Colors.greenAccent[700],
                                    endRadius: SizeConfig.heightMultiplier * 15,
                                    duration: Duration(milliseconds: 2000),
                                    repeat: true,
                                    showTwoGlows: true,
                                    repeatPauseDuration:
                                        Duration(milliseconds: 100),
                                    child: RectGetter(
                                      key: rectGetterKey,
                                      child: Center(
                                        child: Container(
                                            height:
                                                SizeConfig.heightMultiplier * 7,
                                            // color: Colors.green[700],
                                            decoration: BoxDecoration(
                                              color: Colors.greenAccent[700],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey[400],

                                                  offset:
                                                      Offset(0.0, 5.0), //(x,y)

                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            ),
                                            // onPressed: _onTap,
                                            //  width: SizeConfig.widthMultiplier*85,
                                            child: Center(
                                                child: Text(
                                              'Get Started!',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: SizeConfig
                                                          .heightMultiplier *
                                                      2.5),
                                            ))
                                            // Icon(Icons.arrow_forward),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ]),
            ),
          ),
          // floatingActionButton: FadeAnimation(
          //   1.8,
          //   AvatarGlow(
          //     glowColor: Colors.green[700],
          //     endRadius: 100.0,
          //     duration: Duration(milliseconds: 2000),
          //     repeat: true,
          //     showTwoGlows: true,
          //     repeatPauseDuration: Duration(milliseconds: 100),
          //     child: RectGetter(
          //       key: rectGetterKey,
          //       child: FloatingActionButton.extended(
          //           backgroundColor: Colors.green[800],
          //           onPressed: _onTap,
          //           label: Text('Get Started!')
          //           // Icon(Icons.arrow_forward),
          //           ),
          //     ),
          //   ),
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
        ),
        _ripple(),
      ],
    );
  }

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
      ),
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}

class NewPage extends StatelessWidget {
  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.7),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
          1.2,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Text(
                'Let\'s plant with us',
                style: GoogleFonts.montserrat(
                    fontSize: SizeConfig.heightMultiplier * 4.7,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Text(
                'make the country green again',
                style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: SizeConfig.heightMultiplier * 2.7,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Image.asset(
                'assets/planting2.png',
                height: SizeConfig.heightMultiplier * 50,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninScreen()),
                  );
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 7,
                  width: SizeConfig.widthMultiplier * 75,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[700],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],

                        offset: Offset(0.0, 5.0), //(x,y)

                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.heightMultiplier * 2.5),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: SizeConfig.heightMultiplier * 2,
              // ),
              _divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 5,
                  width: SizeConfig.widthMultiplier * 75,
                  child: Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.heightMultiplier * 2.7),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
