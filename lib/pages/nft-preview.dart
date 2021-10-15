import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/variables.dart';

class PreviewNFT extends StatelessWidget {
  static const String route = '/preview';

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: Container(
          height: _size.height,
          width: _size.width,
          padding: EdgeInsets.all(28),
          margin: EdgeInsets.all(15),
          child: NFT(meta: nftMeta)),
    );
  }
}

class NFT extends StatelessWidget {
  final NFTMeta meta;
  NFT({required this.meta});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Hero(
              tag: "NFT" + nftMeta.hero,
              child: SizedBox(
                  width: meta.size.width / 2.2,
                  child: Image.network(meta.imgNFT, fit: BoxFit.cover)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[NFTInfo(), MenuIcons()],
          ),
        ),
      ],
    );
  }
}

class NFTInfo extends StatefulWidget {
  @override
  _NFTInfoState createState() => new _NFTInfoState();
}

class _NFTInfoState extends State<NFTInfo> with SingleTickerProviderStateMixin {
  late final _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width / 2.5,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  nftMeta.title + "    ",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  label: Text(
                    nftMeta.title == 'Solpasss'?'Trading Cards':
                    nftMeta.category,
                    style: TextStyle(color: Colors.tealAccent[400], fontSize: 11),
                  ),
                  side: BorderSide(color: Colors.tealAccent[700]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
              ],
            ),

            //Views & Rarity Icons

            QuickInfo(),
            SizedBox(height: 15),
            Text(
              nftMeta.title == 'Solpasss'?"Sol Passes were minted to raise funding for vol NFT marketplace in return of equity to their owners...":
              "Digital marketplace for crypto NFT and collectibles you might be intrested, some more details about the brand...",
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w300,
                color: Colors.grey[500],
                fontSize: 17,
              ),
            ),

            //NFT Information Tabs

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: PagerTitles(
                cont: _controller,
                size: _size,
              ),
            ),

            //Black Bid Card

            Spacer(),
            Center(child: PlaceBid(size: _size)),
          ]),
    );
  }
}

// ignore: must_be_immutable
class PagerTitles extends StatelessWidget {
  TabController cont;
  final Size size;
  PagerTitles({required this.cont, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: new TabBar(
            controller: cont,
            unselectedLabelColor: Colors.black87,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                gradient: tealGradient,
                borderRadius: BorderRadius.circular(50),
                color: Colors.indigo),
            tabs: [
              tabTile('Bids'),
              tabTile('History'),
              tabTile('Authenticity'),
              tabTile('Details')
            ],
          ),
        ),
        Container(
          height: size.height / 3.2,
          margin: EdgeInsets.only(top: 13, left: 4, right: 4),
          child: TabBarView(
            controller: cont,
            children: <Widget>[
              ListView(
                children: [
                  BidDataCard(
                    price: 0,
                  ),
                  Divider(color: Colors.tealAccent, thickness: 0.4),
                  BidDataCard(
                    price: rnm.nextInt(45),
                  ),
                  Divider(color: Colors.tealAccent, thickness: 0.4),
                  BidDataCard(
                    price: rnm.nextInt(20),
                  ),
                  Divider(color: Colors.tealAccent, thickness: 0.4),
                ],
              ),
              Card(
                child: new ListTile(
                  leading: const Icon(Icons.location_on),
                  title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                  trailing: new IconButton(
                      icon: const Icon(Icons.my_location), onPressed: () {}),
                ),
              ),
              Card(
                child: new ListTile(
                  leading: const Icon(Icons.location_on),
                  title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                  trailing: new IconButton(
                      icon: const Icon(Icons.my_location), onPressed: () {}),
                ),
              ),
              Card(
                child: new ListTile(
                  leading: const Icon(Icons.location_on),
                  title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                  trailing: new IconButton(
                      icon: const Icon(Icons.my_location), onPressed: () {}),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  tabTile(String _title) {
    return Tab(
      height: 32,
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class BidDataCard extends StatelessWidget {
  final int price;
  const BidDataCard({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _ampm = <String>[' AM', ' PM'];
    nftMeta.price -= price;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(
                  "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg"),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: nftMeta.price.toString() + ' SOL',
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                      TextSpan(
                        text: '  by  ',
                        style: GoogleFonts.epilogue(
                          color: Colors.grey[800],
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: names[rnm.nextInt(names.length)],
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "8/" +
                      ranRange(25, 28).toString() +
                      "/2021, " +
                      ranRange(1, 13).toString() +
                      ':' +
                      ranRange(0, 60).toString() +
                      _ampm[rnm.nextInt(2)],
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class PlaceBid extends StatelessWidget {
  final Size size;
  PlaceBid({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.tealAccent[400]!.withOpacity(0.5),
                offset: Offset(0, 4),
                blurRadius: 7,
                spreadRadius: 2)
          ]),
      width: size.width / 3.5,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Ending in",
                      style: GoogleFonts.montserrat(
                          color: Colors.grey[700],
                          fontSize: 13,
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
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Current Bid",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[700],
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(nftMeta.price.toString() + " SOL",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 17,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PreviewNFT.route);
                  },
                  child: Text('Purchase'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(155, 38),
                    primary: Colors.black,
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PreviewNFT.route);
                  },
                  child: Text(
                    'Bid Higher',
                    style: GoogleFonts.montserrat(
                        color: Colors.black, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(155, 38),
                    primary: Colors.tealAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.white),
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

class MenuIcons extends StatelessWidget {
  const MenuIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.tealAccent[400],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.share, color: Colors.black),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: FaIcon(
            FontAwesomeIcons.solidTimesCircle,
            color: Colors.black,
          ),
        ),
      ]),
    );
  }
}

class QuickInfo extends StatelessWidget {
  const QuickInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        tileLabel(Icons.person, '1 Owner'),
        tileLabel(Icons.grid_view_rounded, '1 Total'),
        tileLabel(Icons.folder_special, '94% Rare'),
        tileLabel(Icons.remove_red_eye_sharp, '2.5K Views'),
      ]),
    );
  }

  tileLabel(IconData _icon, String _text) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Icon(
        _icon,
        color: Colors.grey,
      ),
      SizedBox(width: 8),
      Text('$_text', style: TextStyle(color: Colors.grey)),
      SizedBox(width: 16)
    ]);
  }
}
