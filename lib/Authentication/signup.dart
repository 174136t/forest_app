import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/Authentication/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
   FocusNode focusNode = FocusNode();
  SharedPreferences prefs;
  // List<UploadValidaation> _validationDataUpload = List<UploadValidaation>();

  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String password;
  String phoneNo;
  String fullName;
  String email;
  String nicNo;
  String hintText = "+94 712345678";

  bool loading = false;

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
        hintText = '+94 712345678';
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

  Widget fullnameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full name',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: fullNameController,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.2),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(15.0),
                // ),

                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                hintText: 'John Doe'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return 'Full name can\'t be empty';
              }
            },
            onSaved: (String value) {
              this.fullName = value;
            },
          )),
        ],
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: emailController,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.2),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(15.0),
                // ),

                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                hintText: 'john.doe@gmail.com'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty ||
                  !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                return 'Please enter a valid email';
              }
            },
            onSaved: (String value) {
              this.email = value;
            },
          )),
        ],
      ),
    );
  }

  Widget nicNoField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: nicController,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.2),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(15.0),
                // ),

                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                hintText: 'No, street, city'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a valid NIC number';
              }
            },
            onSaved: (String value) {
              this.nicNo = value;
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
                   fillColor: Colors.white.withOpacity(0.2),),
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
Widget _categoryThumbnail1() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
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
        backgroundColor: Colors.green[100],
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                 
                 
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.1),
                      
                        FadeAnimation(
                          1.5,
                          Container(
                            // height: size.height * 0.6,
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.15),
                                  Container(
                                    height: size.height * 0.08,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Create account",
                                          style: GoogleFonts.portLligatSans(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // phoneNoField(),
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  fullnameField(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  emailField(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  passwordField(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  nicNoField(),
                                  SizedBox(
                                    height: size.height * 0.03,
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
                                         

                                        
                                        },
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                ],
                              ),
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
                                "Already have an account? ",
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
                                      builder: (context) => SigninScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
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
