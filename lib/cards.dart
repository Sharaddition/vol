import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/pages/nft-preview.dart';

import 'package:volatile/variables.dart';

import 'json/js_util.dart';

// Plane cards to showcase NFT
class PlaneCards extends StatelessWidget {
  final String img;
  const PlaneCards({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpService().getPrice();

    int rndPrice = rnm.nextInt(250);
    double solPrice = rndPrice * solUSDT;

    return Container(
      width: 250,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white70.withOpacity(0.9),
        border: Border.all(width: 1, color: Colors.black12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 6.0), //(x,y)
              blurRadius: 10.0,
              spreadRadius: 2.5)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: NetworkImage(img),
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Icon(rnmFav[rnm.nextInt(2)], color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 6, right: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage("assets/faces/face" +
                          (rnm.nextInt(12)).toString() +
                          ".jpg"),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.more_horiz,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 2),
                      child: Text(
                        names[rnm.nextInt(names.length)],
                        style: GoogleFonts.montserrat(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Last Bid: " + rndPrice.toString() + 'SOL',
                        style: TextStyle(color: Colors.grey[800], fontSize: 13),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  r"$" + solPrice.toStringAsFixed(2),
                  style: GoogleFonts.montserrat(
                      color: Colors.green[600],
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Place a bid',
                        style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 32),
                      primary: Colors.greenAccent,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.greenAccent, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bid History'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 32),
                    primary: Colors.grey[600],
                    padding: EdgeInsets.all(15),
                    elevation: 0,
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: Colors.grey[600]!,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Cards appear on the Recent activity
class RecentCard extends StatelessWidget {
  const RecentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _rndColor = Colors.primaries[rnm.nextInt(rnCol)];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
          color: _rndColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image(
              height: 45,
              width: 45,
              image: AssetImage(
                  "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  names[rnm.nextInt(names.length)],
                  style: TextStyle(fontSize: 18, color: Colors.grey[850]),
                ),
                Text(
                  recent[rnm.nextInt(recent.length)],
                  style: GoogleFonts.epilogue(
                      color: Colors.grey[600], fontSize: 14),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(13)),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                r"$" + rnm.nextInt(100).toString(),
                style: TextStyle(color: _rndColor.withOpacity(0.65)),
              ))
        ],
      ),
    );
  }
}

class LoadMore extends StatelessWidget {
  final String text;
  const LoadMore({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.blueGrey[100]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 17,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class RecentCard2 extends StatelessWidget {
  const RecentCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _rndColor = Colors.primaries[rnm.nextInt(rnCol)];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
          color: _rndColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image(
              height: 45,
              width: 45,
              image: AssetImage(
                  "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  names[rnm.nextInt(names.length)],
                  style: TextStyle(fontSize: 18, color: Colors.grey[850]),
                ),
                Text(
                  recent2[rnm.nextInt(recent2.length)],
                  style: GoogleFonts.epilogue(
                      color: Colors.grey[600], fontSize: 14),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(13)),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            margin: EdgeInsets.only(right: 8),
            child: Icon(Icons.trending_up_rounded,
                color: _rndColor.withOpacity(0.65)),
          )
        ],
      ),
    );
  }
}

class MarketStatsCard extends StatelessWidget {
  final int title;
  final int price;

  MarketStatsCard({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    var _rndColor = Colors.primaries[rnm.nextInt(rnCol)];
    int _rndPrice = price;
    double _solPrice = _rndPrice * solUSDT;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: _rndColor.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              FaIcon(mktIcon[title]),
              SizedBox(width: 8),
              Text(
                mktTitle[title],
                style: GoogleFonts.epilogue(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: _rndPrice.toString(),
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: " SOL",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[850],
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  )
                ])),
                SizedBox(width: 25),
                Container(
                  height: 70,
                  width: 140,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      chartData(_rndColor),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  r"$ " + _solPrice.toStringAsFixed(3) + " USD",
                  style: GoogleFonts.montserrat(
                      color: _rndColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "+" + (rnm.nextInt(15) / 3).toStringAsFixed(2),
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[800],
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ));
  }
}

LineChartData chartData(Color _color) {
  var flSpots = <FlSpot>[];
  var _xPos = <double>[
    0,
    2.2,
    4.9,
    6.8,
    8,
    9.5,
    11,
    12.2,
    14.6,
    15.5,
    17.3,
    19,
    21,
    22.3
  ];
  var _yPos = <double>[0];
  for (var i = 1; i < _xPos.length; i++) {
    _yPos.add(ranRange(1, 10).toDouble());
    flSpots.add(FlSpot(_xPos[i], _yPos[i]));
  }

  return LineChartData(
    gridData: FlGridData(show: false),
    backgroundColor: Colors.transparent,
    titlesData: FlTitlesData(show: false),
    borderData: FlBorderData(show: false),
    lineBarsData: [
      LineChartBarData(
          spots: flSpots,
          isCurved: true,
          colors: [_color],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false)),
    ],
  );
}

class CreatorCard extends StatelessWidget {
  final Size size;
  CreatorCard({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 225,
      width: size.width * 0.65,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              width: size.width * 0.65,
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://res.cloudinary.com/vol/image/upload/v1632755668/assets/bg-oil_ctzaav.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create your own \nExtraordinary NFT",
                      style: GoogleFonts.montserrat(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                      )),
                  SizedBox(height: 6),
                  Text(
                    "Discover limited-edition digital artwork, Create, Sell and collect yours now!",
                    style: GoogleFonts.epilogue(
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/mint');
                        },
                        icon: FaIcon(FontAwesomeIcons.magic),
                        label: Text('Create Now'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 35),
                          primary: Colors.black.withOpacity(0.8),
                          textStyle: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton.icon(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.leanpub,
                          color: Colors.pink[400],
                        ),
                        label: Text(
                          'Learn How',
                          style: TextStyle(color: Colors.pink),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 35),
                          textStyle: GoogleFonts.montserrat(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Image.network(
                "https://res.cloudinary.com/vol/image/upload/c_scale,h_400/v1632763646/assets/HumanFace_uosmhd.png",
                fit: BoxFit.fitHeight,
                height: 225,
              ),
            ),
          )
        ],
      ),
    );
  }
}
