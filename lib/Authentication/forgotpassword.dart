import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/Authentication/signin.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
 FocusNode focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

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

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black))
          ],
        ),
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
            'New Password',
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
 Widget confirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Confirm New Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: confirmPasswordController,
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
              if (passwordController.text != confirmPasswordController.text) {
                return 'Passwords doesn\'t match';
              }
            },
           
          )),
        ],
      ),
    );
  }

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
                        SizedBox(height: size.height * 0.2),
                        
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
                                          "Forgot Password",
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
                                  passwordField(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  confirmPasswordField(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                    
                                  FadeAnimation(
                                    1.6,
                                    Container(
                                      height: size.height * 0.07,
                                      width: size.width * 0.6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: MaterialButton(
                                        color: Colors.greenAccent[700],
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         RegisterScreen2(
                                            //       phoneNo: phoneController.text,
                                            //     ),
                                            //   ),
                                            // );
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
                                          'submit',
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
                                "Go back to ",
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