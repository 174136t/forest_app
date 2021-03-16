import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';



class PostItem extends StatefulWidget {
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  FocusNode focusNode = FocusNode();
  // SharedPreferences prefs;
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
  // String hintText = "Choose plant";

  bool loading = false;

  // bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  Widget phoneNoField() {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Select plant type',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      Container(
        width: SizeConfig.widthMultiplier*80,
        // height: SizeConfig.heightMultiplier*7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black)
        ),
          child: Center(child: ExpansionTile(
              title: Text(
                "Choose plant",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
              
                ListTile(
                  title: Text(
                    'nadun'
                  ),
                ),
                 ListTile(
                  title: Text(
                    'burutha'
                  ),
                )
              ],
            ),)),
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
            'Description',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Container(
              child: TextFormField(
            maxLines: 3,
            style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.w800,
                fontSize: 18),
            controller: fullNameController,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                hintText: 'Enter Description...'),
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

  Widget nicNoField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                hintText: 'where activity take place...'),
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

  Widget _categoryThumbnail1() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      alignment: FractionalOffset.topCenter,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.08,
          backgroundImage: AssetImage('assets/planting3.png'),
        ),
      ),
    );
  }

  Widget photoUpload() {
    return Container(
      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      height: SizeConfig.heightMultiplier * 5,
      width: SizeConfig.widthMultiplier * 80,
      // alignment: FractionalOffset.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.camera,
            color: Colors.black,
          ),
          Text(
            ' Add photos',
            style: GoogleFonts.montserrat(
                fontSize: SizeConfig.heightMultiplier * 2.2),
          )
        ],
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
                          Center(
                            child: Container(
                              // height: size.height * 0.6,
                              width: size.width * 0.9,
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
                                      height: size.height * 0.05,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Post New Item",
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
                                    SizedBox(height: size.height * 0.015),
                                    phoneNoField(),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    fullnameField(),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    nicNoField(),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    photoUpload(),
                                    SizedBox(
                                      height: size.height * 0.05,
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
                                          onPressed: () {},
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 30,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(
                                            'Post',
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
                        ),
                        SizedBox(
                          height: size.height * 0.03,
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
