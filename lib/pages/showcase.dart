import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowcaseNFT extends StatelessWidget {
  static const String route = '/showcase';
  const ShowcaseNFT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _size.height,
              width: _size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Colors.deepPurple[900]!, Color(0xff01003A)])),
              child: Stack(
                children: [
                  SizedBox(
                    height: _size.height * 0.5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Raj\nGokal",
                          style: GoogleFonts.montserrat(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/elements/ddegen.png',
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: _size.height * 0.38,
                  //   child: SizedBox(
                  //     width: _size.width,
                  //     child: Image.asset(
                  //       'assets/elements/seprate.png',
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: _size.height * 0.42,
                    child: Container(
                      height: 75,
                      width: _size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Color(0xff01003A)])),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: _size.height, color: Colors.red)
          ],
        ),
      ),
    );
  }
}
