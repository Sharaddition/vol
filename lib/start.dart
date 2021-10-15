import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/PageExtensions/bottom.dart';
import 'package:volatile/PageExtensions/frontEXT.dart';
import 'package:volatile/cards.dart';
import 'package:volatile/json/js_util.dart';
import 'package:volatile/pages/explore.dart';
import 'package:volatile/responsive.dart';
import 'package:volatile/variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: HomeNew(),
    );
  }
}

class HomeNew extends StatelessWidget {
  const HomeNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      decoration: BoxDecoration(
        color: Color(0XFFC1FFD7).withOpacity(0.3),
      ),
      child: ListView(scrollDirection: Axis.vertical, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _size.width * 0.65,
              margin: EdgeInsets.only(top: 8, left: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlackBox(),
                    SizedBox(height: 45),
                    NFT(size: _size),
                    CreatorCard(size: _size),
                  ]),
            ),
            Responsive.isSmallScreen(context)
                ? SizedBox.shrink()
                : RightActivityTab()
          ],
        ),
        FollowUs(),
        TopCreatorCard(),
        PopularCategory(),
        BottomMenu(size: _size),
      ]),
    );
  }
}

class BlackBox extends StatelessWidget {
  const BlackBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: _size.width * 0.65,
          height: _size.height / 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: IntroLeftPane()),
              ),
              FeaturedBidPane()
            ],
          ),
        ),
      ],
    );
  }
}

class IntroLeftPane extends StatefulWidget {
  const IntroLeftPane({Key? key}) : super(key: key);

  @override
  State<IntroLeftPane> createState() => _IntroLeftPaneState();
}

class _IntroLeftPaneState extends State<IntroLeftPane> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text.rich(
              TextSpan(
                text: "Collect and Sell your extraordinary ",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.isSmallScreen(context) ? 18 : 40,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: "NFT",
                    style: GoogleFonts.montserrat(
                      color: Colors.greenAccent[400],
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.isSmallScreen(context) ? 18 : 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Crypto space for antique, historical artwork of future. Own a piece of inevitable creative economy today!",
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w200,
                color: Colors.white60,
                fontSize: Responsive.isSmallScreen(context) ? 12 : 14,
              ),
              maxLines: 2,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ExplorePage.route);
              },
              child: Text('Explore Now'),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 40),
                  primary: Colors.green,
                  textStyle: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 14))),
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("5K+  Artwork",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      Text("250+  Artist",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      Text("82K+  Auction",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: ElevatedButton.icon(
                              onPressed: () {
                                isWallet
                                    ? Phantom().disconnect().then(setState(() {
                                        isWallet = !isWallet;
                                        number.value--;
                                      }))
                                    : Phantom()
                                        .connect()
                                        .then((value) =>
                                            myWallet = addressDresser(value))
                                        .then((value) => setState(() {
                                              isWallet = !isWallet;
                                              number.value++;
                                              print("1---" + value);
                                            }));
                              },
                              icon: FaIcon(Wallet().icon),
                              label: Text(Wallet().status),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(175, 35),
                                  primary: Colors.grey[700],
                                  textStyle: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 14)))),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.balcony_outlined),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(42, 35),
                              primary: Colors.grey[850],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.manage_search),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(42, 35),
                              primary: Colors.grey[850],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.map_sharp),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(42, 35),
                              primary: Colors.grey[850],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]);
  }
}

class FeaturedBidPane extends StatelessWidget {
  const FeaturedBidPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                height: _size.height >= 767 ? 270 : 260,
                width: 400,
                image: NetworkImage(
                    "https://media3.giphy.com/media/ho0xXatV7b3Fo1ZRXN/giphy.gif?cid=ecf05e477e0gk6q358xp5w16t47apmj54sjuy137amvev7t9&rid=giphy.gif&ct=g"),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "Chain Of Command",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Responsive.isSmallScreen(context) ? 17 : 23,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Current Bid",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "111 SOL",
                        style: GoogleFonts.montserrat(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Auction Time",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CountdownTimer(
                        endTime: endTime,
                        widgetBuilder: (_, time) {
                          if (time == null) {
                            return Text('Auction over');
                          }
                          return Text(
                            '${time.hours}h : ${time.min}m : ${time.sec}s',
                            style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text("Place Bid",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey[50],
                                fontSize: 13,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text("View ArtWork",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey[100],
                                fontSize: 13,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (_size.height >= 767)
                ? Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 28,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "<",
                              style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "O ⚫ O",
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          height: 28,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              ">",
                              style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}

class RightActivityTab extends StatelessWidget {
  const RightActivityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.30,
      height: _size.height * 1.57,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topLeft: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.15),
              offset: Offset(-3, 0),
              blurRadius: 20,
              spreadRadius: 1)
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 1, top: 16),
              child: Text("Recent Activity",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.isSmallScreen(context) ? 18 : 32))),
          RecentCard2(),
          RecentCard(),
          RecentCard2(),
          RecentCard(),
          RecentCard(),
          LoadMore(text: 'Show more'),
          Padding(
              padding: const EdgeInsets.only(top: 58, bottom: 8),
              child: Text("Market Overview",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.isSmallScreen(context) ? 18 : 32))),
          MarketStatsCard(title: 0, price: rnm.nextInt(5000)),
          MarketStatsCard(title: 1, price: rnm.nextInt(5000)),
          (_size.height >= 767)
              ? MarketStatsCard(title: 2, price: ranRange(8, 25))
              : SizedBox.shrink(),
          SizedBox(height: 8),
          LoadMore(text: 'More stats')
        ],
      ),
    );
  }
}

class NFT extends StatelessWidget {
  final Size size;
  NFT({required this.size});

  @override
  Widget build(BuildContext context) {
    // var _cardsList = <PlaneCards>[];
    // for (var i = 0; i <= 2; i++) {
    //   _cardsList.add(PlaneCards(img: '',));
    // }

    return Container(
      width: size.width * 0.65,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xffCAB8FF).withOpacity(0.35),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  SocialIcons().trending,
                  width: 32,
                  fit: BoxFit.contain,
                ),
                Text(" Top NFT",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.isSmallScreen(context) ? 18 : 32)),
              ],
            ),
            Wrap(runSpacing: 30.0, spacing: 35.0, children: [
              PlaneCards(
                  img:
                      'https://i.giphy.com/media/IiuZjA4RQUKIf5TbMi/200w.webp'),
              PlaneCards(
                  img:
                      'https://i.giphy.com/media/jJB6GOY0sh4Iv2tRSV/200w.webp'),
              PlaneCards(
                  img:
                      'https://res.cloudinary.com/vol/image/upload/c_scale,h_180/v1633795082/assets/collections/holoface_xjxj1v.gif')
            ])
          ],
        ),
      ),
    );
  }
}
