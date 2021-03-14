import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:forest_app/utils/constants.dart';
import 'package:forest_app/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class BarCodeReader extends StatefulWidget {
  @override
  _BarCodeReaderState createState() => _BarCodeReaderState();
}

class _BarCodeReaderState extends State<BarCodeReader> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

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
                'Barcode Scanner',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.heightMultiplier * 3.5),
              ),
              Image.asset(
                'assets/barcode.jpg',
                height: SizeConfig.heightMultiplier * 50,
                width: SizeConfig.widthMultiplier * 100,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Click below button to scan the Barcode',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.heightMultiplier * 2.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),
              GestureDetector(
                onTap: () {
                  scanBarcodeNormal();
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
                          ' Scan',
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
