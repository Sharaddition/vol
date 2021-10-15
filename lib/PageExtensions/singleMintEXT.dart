import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

import '../variables.dart';

class Confetti extends StatefulWidget {
  final ConfettiController cont;
  final double dir;
  const Confetti({Key? key, required this.cont, required this.dir})
      : super(key: key);

  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: widget.cont,
      blastDirectionality: BlastDirectionality.directional,
      blastDirection: widget.dir,
      particleDrag: 0.05,
      emissionFrequency: 0.02,
      numberOfParticles: 15,
      gravity: 0.1,
      minBlastForce: 1,
      maxBlastForce: 18,
      shouldLoop: false,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.teal,
        Colors.orange,
        Colors.purple,
        Colors.tealAccent
      ], // manually specify the colors to be used
    );
  }
}

class MintDialog extends StatefulWidget {
  const MintDialog({Key? key}) : super(key: key);

  @override
  _MintDialogState createState() => _MintDialogState();
}

class _MintDialogState extends State<MintDialog> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        height: _size.height * 0.5,
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/elements/wait.json',
                height: _size.height * 0.25),
            SizedBox(height: 22),
            Text(
              "Minting your NFT",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18),
            Text(
              "This proccess may take up few minutes.",
              textAlign: TextAlign.center,
              style: GoogleFonts.epilogue(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Your creation will be uploaded to decentralized storage, and then NFT will be instantly listed for sale.",
              textAlign: TextAlign.center,
              style: GoogleFonts.epilogue(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NFTMinted extends StatefulWidget {
  NFTMinted({Key? key}) : super(key: key);
  static const String route = '/huray';

  @override
  State<NFTMinted> createState() => _NFTMintedState();
}

class _NFTMintedState extends State<NFTMinted> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 8));
    _controllerCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: _size.height,
              width: _size.width * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset('assets/elements/hurray.json',
                      height: _size.height * 0.3),
                  SizedBox(height: 22),
                  Text(
                    "Hurray!",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your NFT is listed with us.",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  // tokenMeta(),
                  SizedBox(height: 12),
                  shareButton(SocialIcons().twitter, 'Twitter'),
                  shareButton(SocialIcons().reddit, 'Reddit'),
                  shareButton(SocialIcons().discord, 'Discord'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      margin: EdgeInsets.only(top: 12),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              'https://res.cloudinary.com/vol/image/upload/v1633632106/assets/icons/idea_jsfhhk.png',
                              fit: BoxFit.fitHeight,
                              height: 38,
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 4),
                                  child: Text(
                                    'Pro Tip',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  child: Text(
                                    'Tag your post with #ExclusivelyVolatile to get a chance to be featured.',
                                    style: GoogleFonts.epilogue(
                                      color: Colors.grey[350],
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF000000).withAlpha(70),
                              blurRadius: 6.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                0.0,
                                3.0,
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Confetti(cont: _controllerCenter, dir: pi)),
          Align(
              alignment: Alignment.topLeft,
              child: Confetti(cont: _controllerCenter, dir: 0)),
        ],
      ),
    );
  }

  shareButton(String _icon, String _name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Image.network(
                _icon,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: 16),
              labelText(_name)
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: tealGradient,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

Widget tokenMeta() {
  return Container(
    margin: EdgeInsets.only(top: 12),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.chalkboardTeacher),
                label: Text("View in Account "),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(190, 38),
                    primary: Colors.grey[700],
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14))),
            ElevatedButton.icon(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.binoculars),
              label: Text("View on Explorer"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(190, 38),
                primary: Colors.grey[700],
                textStyle:
                    GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        )),
    decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withAlpha(70),
            blurRadius: 6.0,
            spreadRadius: 0.0,
            offset: Offset(
              0.0,
              3.0,
            ),
          ),
        ]),
  );
}
