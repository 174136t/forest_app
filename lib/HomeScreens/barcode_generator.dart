import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/utils/constants.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class BarcodeGeneratorScreen extends StatefulWidget {
  @override
  _BarcodeGeneratorScreenState createState() => _BarcodeGeneratorScreenState();
}

class _BarcodeGeneratorScreenState extends State<BarcodeGeneratorScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        1.2,
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Text(
                'Barcode Generator',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.heightMultiplier * 3.5),
              ),
             
             
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Center(
                child: BarcodeWidget(data: 'This is the data', barcode: Barcode.code128(),
                height: SizeConfig.heightMultiplier*30,
                width: SizeConfig.widthMultiplier*75,),
              ), SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Click below button to generate the Barcode scan the Barcode',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.heightMultiplier * 2.5),
                        textAlign: TextAlign.center,
                  ),
                ),
              ),
                SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              GestureDetector(
                onTap: () {
                  // scanBarcodeNormal();
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 7,
                  width: SizeConfig.widthMultiplier * 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: greenGradient,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],

                        offset: Offset(0.0, 5.0), //(x,y)

                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ),
                        Text(
                          ' Generate',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.heightMultiplier * 2.5),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
