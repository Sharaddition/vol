import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/json/js_util.dart';
import 'package:volatile/pages/explore.dart';

var rnm = new Random();
var rnCol = Colors.primaries.length;

//Solana Realtime Price
String solAPI = 'https://api.binance.com/api/v3/ticker/price?symbol=SOLUSDT';
double solUSDT = 150.0;

//Wallet Status
bool isWallet = false;

class Wallet {
  IconData icon = isWallet ? FontAwesomeIcons.check : FontAwesomeIcons.wallet;
  String status = isWallet ? 'Connected' : 'Connect Wallet';
  String smallSts = isWallet ? myWallet : 'Connect';
}

//time for auctions
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 11200;
int endTime2 = DateTime.now().millisecondsSinceEpoch + 1000 * 8578;

var mktTitle = <String>[
  "Earned by Artists",
  "Aftermarket Sales",
  "Avg Wallet Balance"
];
var mktIcon = <IconData>[
  FontAwesomeIcons.draftingCompass,
  FontAwesomeIcons.moneyBillAlt,
  FontAwesomeIcons.handHoldingUsd
];

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

var boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    offset: Offset(0.0, 6.0), //(x,y)
    blurRadius: 10.0,
    spreadRadius: 2.5);

int ranRange(min, max) {
  return min + rnm.nextInt(max - min);
}

ButtonStyle iconButtonStyle = ElevatedButton.styleFrom(
    fixedSize: Size(120, 35), textStyle: GoogleFonts.montserrat(fontSize: 16));

var catgTitle = <String>[
  "Collectibles",
  "Trading Cards",
  "Dynamic",
  "Metaverse Assets",
];

categoryTitle(int _pos) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Text(
      catgTitle[_pos],
      style: TextStyle(color: Colors.grey[800], fontSize: 16),
    ),
  );
}

var textCol = Colors.black;

//Cards Page
var rnmFav = <IconData>[Icons.favorite, Icons.favorite_border];
var rnmCmnt = <IconData>[
  FontAwesomeIcons.solidCommentDots,
  FontAwesomeIcons.commentDots
];

var names = <String>[
  'Sharad',
  'Metahawk',
  'Klarens',
  'volatle.sol',
  'Reanu Keeves',
  'SolKitty',
  'Melon Musk',
  'Degen Bets',
  'raj.sol',
  'Nakamoto',
  'Shishir',
];

var recent = <String>['Purchased by you', 'Earning updated', 'NFT sold by you'];
var recent2 = <String>[
  'Started following you',
  'Liked your NFT',
  'Folowed your collection'
];

var bidTypes = <String>["⏳ Fix Price", "🔥 Highest Bid"];

class NFTMeta {
  late String imgNFT;
  late String imgCreator;
  late String title;
  late String category;
  late String bidType;
  late int price;
  late Size size;
  late String hero;
  NFTMeta({imgNFT, imgCreator, size, title, category, bidType, price, hero});
}

var nftMeta = NFTMeta();

Color butTextColor = Colors.tealAccent[400]!;
Color butIconColor = Colors.tealAccent[400]!;

///////////////////////
///Form ELements GLobal
///////////////////////

labelText(String _input) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    child: Text(
      _input,
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

hintText(String _input) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
    child: Text(
      _input,
      style: GoogleFonts.epilogue(
        color: Colors.grey,
        fontSize: 12,
      ),
    ),
  );
}

textField(String _input) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: _input,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final IconData icon;
  late Color? color = Colors.grey[800]!;
  Color? borderColor = Colors.white;
  RoundButton({required this.icon, this.color, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(
        icon,
        color: color,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(14),
        shape: CircleBorder(side: BorderSide(color: borderColor!)),
      ),
    );
  }
}

// Gradient Color

LinearGradient PurpleGradient =
    LinearGradient(colors: [Colors.purpleAccent, Colors.purple]);
LinearGradient tealGradient =
    LinearGradient(colors: [Colors.tealAccent, Colors.tealAccent[400]!]);

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double width;
  final double height;
  final double radius;
  final Function? onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.radius = 4,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Color(0XFFC1FFD7),
              offset: Offset(0.0, 0.5),
              blurRadius: 0.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onPressed!;
          },
          child: Center(
            child: child,
          ),
          hoverColor: Colors.teal[300],
        ),
      ),
    );
  }
}

////////
///Elements for Filtering Explore Page
////////

checkBoxBuilder(String _title, bool _isTicked) {
  return CheckboxListTile(
    title: Text(_title),
    value: _isTicked,
    onChanged: (newValue) {},
    controlAffinity: ListTileControlAffinity.leading,
  );
}

String myWallet = 'A9L...pGk';

royality(int _royality) {
  Color _color = Colors.black87;
  String _message = 'Royality <5%';
  if (_royality > 5 && _royality < 10) {
    _message = "Med Royality\nMore than >5%";
    _color = Colors.yellow.withOpacity(0.70);
  } else if (_royality > 10) {
    _message = "High Royality\nMore than >10%";
    _color = Colors.red.withOpacity(0.70);
  } else {
    _message = "Low Royality\nLess than <5%";
    _color = Colors.green[300]!.withOpacity(0.70);
  }
  return Tooltip(
    message: _message,
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: _color, borderRadius: BorderRadius.circular(50)),
      child: Text('💎'),
    ),
  );
}

String selectedUser = "assets/faces/face0.jpg";
var dogeColl = <String>[
  'https://res.cloudinary.com/vol/image/upload/v1632942983/assets/collections/doge-gif_qgnk6t.gif',
  'https://lh3.googleusercontent.com/pST2vXUGGwf6bx7DH38in_nHhphWUfB5IF-xhH1wTjRI0-akf2Qy2PKg9f07c8wWw9ChGtkDE_8Mv8BXZAWjDDpQVw7UEyNP90wI=w305',
  'https://lh3.googleusercontent.com/UpkTRUqadKJN47C1-a_-VjIGK-V_NSB-RkeuH6D9-8ISqgsQRAdkt-Aye4i0YEcCOewLVdFCmcLa93zS23syAin6ggB-3m-pHxaLuw=w305',
  'https://lh3.googleusercontent.com/UVw1Y0t8exMYCkbeuZgQCsDFJU0adRPHnkOcgvPzZWbziKJVhW-2a9IUQsxBxzJbWsLaV5SAZzCVrPAmna2EeuvN2BQvRzl6oGyTKA=w305'
];

var skullColl = <String>[
  'https://lh3.googleusercontent.com/e5s2WcnoPKpVZ4MxRA6v1IYPcCmC_3LSDCTI-Cp_pAxu_J81v0iQUiOByr5gLdQjM083RHQZd_izPmTeB1w2P9r8YmjxHNJNRi4RRw=s130',
  'https://lh3.googleusercontent.com/epX7iG3ErTtO6IL6YUhwP2sOxLkypOgbsoJyglGpJMETZiL-cKuhz3b1KjDN_yMORZ4dyfBY6GSA9IHzq1D5N1nABz1wY1ZOLv75=w305',
  'https://lh3.googleusercontent.com/dHmOEseIjL6tytwnAxWZkDC0Opq-8t5rj251-I8927FA4kLKWWw9c7vmv3ttmo-ChToqvIXO4SldqYtQTB2_F5PaCJAxhiQYa2HjHfI=w305',
  'https://lh3.googleusercontent.com/KYcqtO1AifxqOgQCSRXs_4ur7M4hyUlcEx40m5zKszl_goTAcfjW3emiwCbZyZa0yeaqHOCVeTcGuFAlgpR2LMgorivQqUPx3ljD9w=w305',
];

var pudgyColl = <String>[
  'https://res.cloudinary.com/vol/image/upload/v1632944513/assets/collections/pudgy_penguins_dfrvdq.gif',
  'https://lh3.googleusercontent.com/jclBBnYCyhMZ0ASBQdsTFasJ0ZNIpa7sfCSf9zMfiEnurDT6xcCVZMselDoQuKg-O1q8_W4M2DSs5dIwPVW7k3AxMkdzql6Nq55pAfA=w305',
  'https://lh3.googleusercontent.com/ZFkup5ySWJZZ2CJRSPg8rcv3mbEy-qIMDwtoWJuYHAgtJd3xMu3ljiXNz8LfEaqqf3FKmLVgFS4eg0P5FSFHKAPvIrToUlUnLdG4Fw=w305',
  'https://lh3.googleusercontent.com/sMxo2QK1oYG2qO53kac-MF4pBiUbLpic0HXX8kWFgoHDYGltegam8GJqqiRR7XS6-8Lpb2PdOeGgRpdlKChkFF-LO9IT9XQUV95Z=w305',
];

var allNFT = <String>[
  'https://res.cloudinary.com/vol/image/upload/v1632997008/assets/collections/Head.gif',
  'https://res.cloudinary.com/vol/image/upload/v1632997093/assets/collections/Solpass.gif',
  'https://lh3.googleusercontent.com/D20ZlgF9PbdzE-tGsRCjsl_H3X4B1JI4iInTxnmuelYGd4ydzsrLEuBzJ3irSwb1L_tre49X8Zf5rvcI7VLCiVTf7U1sjdCPHR-fdg=w305',
  'https://lh3.googleusercontent.com/n-ylwsSZG_xSds8mY_A7AodErzflLd_cVb_6yDJTcsDIkCfg4qArMF0VLuLH2TXkMxplILTLj1ilQAg-SYNkdAd0XULty8KCfUJJbQ=w305',
  'https://res.cloudinary.com/vol/image/upload/v1632944513/assets/collections/pudgy_penguins_dfrvdq.gif',
  'https://lh3.googleusercontent.com/gx74IlwkQmEC5ikMwLpv5vYGPG0QClZCyq_e7qPHZHqC-cktF_qmnTNkvmXAt5vxlHRdVDg4dcj-UWNceOf8Ieu5w-sfZ0Xfxk-MoQ=w305',
  'https://lh3.googleusercontent.com/QupTFNGorBxDFw1jEsHiej9SAY-TVZcH7FDf7VIq_wq743vkgYL9-D5ocGwYEDYhe-blVBVlYgU1d9nW9hpbUEmN19-OBVyVwNtBLQ=s130',
  'https://lh3.googleusercontent.com/6XcjJ1SC3MKzQivMN-A6IzO1zPawMLU5ur3fdQCpCcu8mDzD7T6UBJMmoYhMlxPqi2UJP86FpW9YWWmGgJ00jUdwACf0hpUFhGuzMQ=w305',
  'https://res.cloudinary.com/vol/image/upload/v1633013439/assets/collections/bd6c4f72cbeb68f1105099f58ad27dfe_wn3o7j.png',
  'https://lh3.googleusercontent.com/sMxo2QK1oYG2qO53kac-MF4pBiUbLpic0HXX8kWFgoHDYGltegam8GJqqiRR7XS6-8Lpb2PdOeGgRpdlKChkFF-LO9IT9XQUV95Z=w305',
  'https://lh3.googleusercontent.com/GNUhSLGru6UXy-T9ksfCBK_6mSzTVf92uvxN41kZ5lO5Rn25ERr-XS4Jnw8ClaPQaDLUfnXOU3Jb4HBaPP7Gx4C9CGoNA_vsAdEPA2M=w305',
  'https://res.cloudinary.com/vol/image/upload/v1632942983/assets/collections/doge-gif_qgnk6t.gif',
  'https://lh3.googleusercontent.com/bYxp_WTp8MUpKQjBn2ZtSgmsNWyMq89A0hV0L502nwSA0SrKgB4YgkIPb39uvLH56SZfMAdhMhaljL3hYtjwQ8ZsD95-OFyH56b6=w305',
  'https://lh3.googleusercontent.com/HoZIUT6cq4eVqvxZQiF20Y_w0KHmo7DhXH0iQk63MK0lXUXzk_M5M62d_O3efqlnyDnDJxFzMsdRrd-1eUFLN-7fpOYO937UA3gs=w305',
  'https://res.cloudinary.com/vol/image/upload/v1633013361/assets/collections/e155e7ff0b13d9f2c5fadae06013d2a0_y9junh.webp',
  'https://lh3.googleusercontent.com/BeOFbkaj4sROfGe9kpvlW_YccfkyTZoobBDirhjb-84vtOPil1ULJIMb0T2BH4RBD0isrk36B53-1GRMduTTk0WQZ5PeSZzxMVJUFA=w305',
  'https://lh3.googleusercontent.com/_IrRzkhKw8enzf5gN4q15SCyVQMiTctbWLHmWf2EdwxjOtZ1NLO1y_oai1kARdE_HiWk3uLyfncYDquYFtW7tTQjca--AK3XdPGQBgk=w305',
  'https://lh3.googleusercontent.com/YYDM26Oyjk11vCXVqFuvtRIuqQq4TVwQ47DUAc7mOGXEQiajTl1YAEx1vwBploXI_AbFg7K34fEWshTeRf0J7WJNYroE86hocxJF75I=s130',
  'https://lh3.googleusercontent.com/j0OR_c7vuZK8960qy_TyfNnhGglCJpDIjRvCb-uJe11q13_4NLp67tJo9fceg8OtM0uT2YZyKaeyLW859wPUJESvw9upz3QFxfYUsA=w305',
];

var titleList = <String>[
  "Iridescent Skull",
  "Solpasss",
  'Wizard Snoop',
  'Loove Snoop',
  'Pudgie Pengus',
  'Broken Lady',
  'Coool Catts',
  'Pixel Frogs',
  'Pixarr Cat',
  "Degen MACD",
  "Degen Wendys",
  'Dogeshwarr',
  "Wen Lambo",
  "Abstract Degens",
  'Lofi Abstracts',
  "Wall St. Apes",
  "Moon Apes",
  "Red Heads",
  'Devil Heads',
  'Devil Heads #1246'
];

///////////////
//APPBAR Global
///////////////

final number = new ValueNotifier(0);

class Appbar extends StatelessWidget {
  final ValueListenable<int> number;
  Appbar(this.number);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.6),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Image.network(
              'https://res.cloudinary.com/vol/image/upload/c_scale,h_50/v1632758290/assets/vol_whfqta-removebg-preview_jsgpiv.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              margin: EdgeInsets.only(top: 10),
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 20,
                    color: Colors.teal[400],
                  ),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  labelText: 'Search collections, artists',
                  labelStyle: TextStyle(fontSize: 14, color: Colors.teal[400]),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 6,
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  border: OutlineInputBorder(
                    gapPadding: 6,
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 140),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(ExplorePage.route);
              },
              icon: Icon(
                Icons.explore_outlined,
                color: butIconColor,
              ),
              label: Text('Explore',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: butTextColor,
                  )),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.stacked_bar_chart_rounded,
                color: butIconColor,
              ),
              label: Text('Stats',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: butTextColor,
                  )),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/mint');
              },
              icon: Icon(
                Icons.maps_ugc_outlined,
                color: butIconColor,
              ),
              label: Text('Create',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: butTextColor,
                  )),
            ),
            InkWell(
              onTap: () {
                isWallet
                    ? Phantom().disconnect().then(isWallet = !isWallet)
                    : Phantom()
                        .connect()
                        .then((value) => myWallet = addressDresser(value))
                        .then(
                          (value) => (isWallet = !isWallet),
                        );
              },
              child: Container(
                height: 35,
                width: 120,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.teal[400]!.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // (number.value.toString() == 0.toString())
                    //     ? Icon(Icons.account_balance_wallet)
                    //     : SizedBox(width: 0),
                    Flexible(
                      child: Text(Wallet().smallSts,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Social Media Icons

class SocialIcons {
  var trending = 'https://res.cloudinary.com/vol/image/upload/q_100/v1634311827/assets/icons/trending_epo8ux.png';
  var twitter =
      'https://res.cloudinary.com/vol/image/upload/v1633632106/assets/icons/twitter_wugv66.png';
  var reddit =
      'https://res.cloudinary.com/vol/image/upload/v1633632106/assets/icons/reddit_kbsbvn.png';
  var discord =
      'https://res.cloudinary.com/vol/image/upload/v1633632106/assets/icons/discord_wxc355.png';
}

addressDresser(String _address) {
  int _len = _address.length;
  String _trimRaw1 = _address.substring(0, 3);
  String _trimRaw2 = _address.substring(_len - 3, _len);
  String _finalAdd = _trimRaw1 + '...' + _trimRaw2;
  return _finalAdd;
}
