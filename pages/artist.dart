import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/variables.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ArtistPage extends StatelessWidget {
  static const String route = '/artist';

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: Container(
          color: Colors.white,
          width: _size.width,
          height: _size.height,
          child: Stack(children: [
            CoverArt(size: _size),
            Positioned(
                top: _size.height * 0.36,
                left: _size.width * 0.335,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CollectionTab(),
                          CollectionCard(
                              name: 'Slum Doge', collection: dogeColl),
                          SizedBox(
                            height: 1,
                            width: _size.width * 0.45,
                            child: Divider(
                              color: Colors.grey[200],
                            ),
                          ),
                          CollectionCard(
                              name: 'Wicked Skulls', collection: skullColl),
                          SizedBox(
                            height: 1,
                            width: _size.width * 0.55,
                            child: Divider(
                              color: Colors.grey[200],
                            ),
                          ),
                          CollectionCard(
                              name: 'Pudgy Penguins', collection: pudgyColl),
                        ])))),
            Positioned(
                top: _size.height * 0.20,
                left: _size.width * 0.07,
                child: ProfileCard(
                  size: _size,
                ))
          ])),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String name;
  final List<String> collection;
  const CollectionCard({Key? key, required this.name, required this.collection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.58,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 150,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(collection[0]),
          ),
          SizedBox(width: 20),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[850], fontSize: 18),
                ),
                Text(
                  rnm.nextInt(100).toString() + " Followers",
                  style:
                      GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 7),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Follow'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[700],
                        textStyle: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 14))),
              ]),
          SizedBox(width: 50),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              InkWell(
                onTap: (){},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          height: 110,
                          width: 140,
                          image: NetworkImage(collection[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          height: 110,
                          width: 140,
                          image: NetworkImage(collection[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          height: 110,
                          width: 140,
                          image: NetworkImage(collection[3]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white.withOpacity(0.0), Colors.white],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Size size;
  ProfileCard({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.68,
      width: size.width * 0.20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.purple.withOpacity(0.2),
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 1)
          ]),
      padding: EdgeInsets.only(bottom: 18, right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AvatarGlow(
            glowColor: Colors.purple,
            endRadius: 105.0,
            duration: Duration(milliseconds: 1800),
            repeat: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                foregroundImage: AssetImage(selectedUser),
                radius: 75.0,
              ),
            ),
          ),
          Spacer(flex: 1),
          Text(
            "Enrique Iglesias",
            maxLines: 1,
            style: GoogleFonts.montserrat(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'slpbc1qxy2kgdygjrsqtzq2n0yrf2493',
            maxLines: 1,
            style: GoogleFonts.montserrat(
                color: Colors.grey[800],
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          Spacer(flex: 2),
          Text(
            "Good boy bad boy, more description that can be entered yo yo. Tadaaa!",
            maxLines: 2,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.montserrat(color: Colors.grey[600], fontSize: 12),
          ),
          Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.globe,
                color: Colors.purple[900],
                size: 16,
              ),
              SizedBox(width: 6),
              Text(
                'volatile.market/',
                style: GoogleFonts.epilogue(
                    color: Colors.purple[900],
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(flex: 3),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton(
                onPressed: () {},
                child: Text('Follow'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[700],
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14))),
            RoundButton(
                icon: Icons.share,
                color: Colors.grey[700]!,
                borderColor: Colors.grey[800]!),
            RoundButton(
                icon: Icons.more_horiz,
                color: Colors.grey[700]!,
                borderColor: Colors.grey[800]!)
          ]),
          Spacer(flex: 4),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FaIcon(FontAwesomeIcons.facebook, color: Colors.grey),
                FaIcon(FontAwesomeIcons.instagram, color: Colors.grey),
                FaIcon(FontAwesomeIcons.twitter, color: Colors.grey),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(),
          ),
          Text(
            "Joined on 15 May 2021",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.montserrat(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CoverArt extends StatelessWidget {
  final Size size;
  CoverArt({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.32,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://res.cloudinary.com/vol/image/upload/c_scale,h_700/v1632763275/assets/futuristic-background-with-colorful-glowing-abstract-neon-lights_fzafqf.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CollectionTab extends StatefulWidget {
  @override
  _CollectionTabState createState() => _CollectionTabState();
}

class _CollectionTabState extends State<CollectionTab>
    with SingleTickerProviderStateMixin {
  late final _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * 0.40,
      margin: EdgeInsets.only(bottom: 8),
      child: new TabBar(
        controller: _controller,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.purpleAccent, Colors.purple]),
            borderRadius: BorderRadius.circular(15),
            color: Colors.indigo),
        tabs: [
          Tab(
            height: 24,
            child: Text(
              "Collections",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            height: 24,
            child: Text(
              "On Sale",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            height: 24,
            child: Text(
              "Following",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            height: 24,
            child: Text(
              "Likes",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            height: 24,
            child: Text(
              "Recents",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
