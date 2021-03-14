import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/Authentication/forgotpassword.dart';
import 'package:forest_app/Authentication/signup.dart';
import 'package:forest_app/HomeScreens/home_configuration.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences prefs;
  // List<LoginModel> _notes = List<LoginModel>();

  bool loading = false;
  FocusNode focusNode = FocusNode();

  String phoneNo;
  String password = "";
  String hintText = "+94 712345678";
  bool showHint = true;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    initPreferences();
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = '+94 715676899';
      }
      setState(() {});
    });
  }

  initPreferences() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      loading = false;
    });
  }

 
  Widget phoneNoField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile number',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: phoneController,
            autofocus: false,
            focusNode: focusNode,
            decoration: InputDecoration(
                prefixText: '+94 ',
                prefixStyle: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
                fillColor: Colors.white.withOpacity(0.2),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(15.0),
                // ),

                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                hintText: hintText),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty || phoneController.text.length != 9) {
                return 'Please enter a valid phone number';
              }
            },
            onSaved: (String value) {
              this.phoneNo = value;
            },
          )),
        ],
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: passwordController,
            autofocus: false,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: _toggle,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: _obscureText == true
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              hintText: 'Password',
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
            ),
            validator: (value) {
              if (value.isEmpty || value.length < 6) {
                return 'Minimum password length is 6';
              }
            },
            onSaved: (String value) {
              this.password = value;
            },
          )),
        ],
      ),
    );
  }

  // Future<List<LoginModel>> fetchNotes() async {
  //   var url =
  //       'http://cloudx.smartwriters.lk/login_validation.php?mobile_number=' +
  //           phoneController.text +
  //           "&password="+passwordController.text;
  //   var response = await http.get(url);

  //   var notes = List<LoginModel>();

  //   if (response.statusCode == 200) {
  //     var notesJson = json.decode(response.body);
  //     for (var noteJson in notesJson) {
  //       notes.add(LoginModel.fromJson(noteJson));
  //     }
  //   }
  //   return notes;
  // }
  /*Future<List<LoginModel>> fetchNotes() async {
   var url =
        cloudx_url+'login_validation.php?mobile_number=' +
            phoneController.text +
            "&password=11" +
            password+"type=login";
    var response = await http.get(url);

    var notes = List<LoginModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(LoginModel.fromJson(noteJson));
      }
    }
    return notes; /**/
    setState(() {
      loading = true;
    });


  }
*/
 Widget _categoryThumbnail1() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
      alignment: FractionalOffset.topCenter,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.08,
          backgroundImage: AssetImage('assets/planting4.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[50],
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.2),
                          // FadeAnimation(
                          //   1.3,
                          //   Center(
                          //     child: ClipRRect(
                          //       child: Image.asset(
                          //         "assets/images/girl.png",
                          //         height: size.height * 0.15,
                          //         fit: BoxFit.fill,
                          //         filterQuality: FilterQuality.high,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          FadeAnimation(
                            1.5,
                            Container(
                              // height: size.height * 0.5,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300],

                                    offset: Offset(0.0, 5.0), //(x,y)

                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.15),
                                  Container(
                                    height: size.height * 0.1,
                                    child: Column(
                                      children: [
                                        // Text(
                                        //   "Welcome back",
                                        //   style: GoogleFonts.portLligatSans(
                                        //     textStyle: Theme.of(context)
                                        //         .textTheme
                                        //         .headline1,
                                        //     fontSize: 40,
                                        //     fontWeight: FontWeight.w900,
                                        //     color: Colors.black,
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          "Sign in to your account",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: SizeConfig.heightMultiplier*2.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  phoneNoField(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  passwordField(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, top: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Forgot your password?",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.07,
                                  ),
                                  FadeAnimation(
                                    1.6,
                                    Container(
                                      height: size.height * 0.07,
                                      width: size.width * 0.6,
                                      decoration: BoxDecoration(

                                          // gradient: redGradient,

                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: MaterialButton(
                                        color: Colors.greenAccent[700],
                                        onPressed: () {
                                          final form = _formKey.currentState;
                                          if (form.validate()) {
                                             Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeConfiguration(),
                                      ),
                                    );
                                          }
                                        },
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          'Sign in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FadeAnimation(
                            1.8,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Don\'t have an account? ",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    " Sign up",
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(1.5, _categoryThumbnail1())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
