import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/variables.dart';

class TopCreatorCard extends StatelessWidget {
  const TopCreatorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height * 0.55,
      width: _size.width,
      color: Colors.white70,
      padding: EdgeInsets.symmetric(horizontal: 34, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ' Popular\n',
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                      text: " Creators",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32))
                ],
              ),
            )
          ]),
          SizedBox(height: 40),
          Row(
            children: <Widget>[
              TopCreatorNesting(
                cardNo: 1,
                name: names[rnm.nextInt(names.length)],
                width: _size.width,
                userImg:
                    "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg",
                sales: rnm.nextInt(99).toString() +
                    ' sales for ' +
                    rnm.nextInt(250).toString() +
                    'SOL',
              ),
              TopCreatorNesting(
                cardNo: 2,
                name: names[rnm.nextInt(names.length)],
                width: _size.width,
                userImg:
                    "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg",
                sales: rnm.nextInt(99).toString() +
                    ' sales for ' +
                    rnm.nextInt(250).toString() +
                    'SOL',
              ),
              TopCreatorNesting(
                cardNo: 3,
                name: names[rnm.nextInt(names.length)],
                width: _size.width,
                userImg:
                    "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg",
                sales: rnm.nextInt(99).toString() +
                    ' sales for ' +
                    rnm.nextInt(250).toString() +
                    'SOL',
              ),
              TopCreatorNesting(
                cardNo: 4,
                name: names[rnm.nextInt(names.length)],
                width: _size.width,
                userImg:
                    "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg",
                sales: rnm.nextInt(99).toString() +
                    ' sales for ' +
                    rnm.nextInt(250).toString() +
                    'SOL',
              )
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TopCreatorNesting extends StatefulWidget {
  final int? cardNo;
  final String name;
  late String? sales;
  final String userImg;
  final double? width;
  TopCreatorNesting(
      {Key? key,
      required this.cardNo,
      required this.name,
      this.sales,
      this.width,
      required this.userImg})
      : super(key: key);

  @override
  _TopCreatorNestingState createState() => _TopCreatorNestingState();
}

class _TopCreatorNestingState extends State<TopCreatorNesting> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      child: Row(
        children: <Widget>[
          Text(widget.cardNo.toString() + '.',
              style: GoogleFonts.montserrat(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          Container(
            width: widget.width! * 0.19,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 12, right: 32),
            transform: isHovering
                ? (Matrix4.identity()..translate(0, -8, 0))
                : Matrix4.identity(),
            decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(width: 1.5, color: Colors.tealAccent),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color:
                          Color(0XFFC1FFD7).withOpacity(isHovering ? 0.8 : 0.2),
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      spreadRadius: isHovering ? 5 : 0)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(widget.userImg),
                ),
                SizedBox(height: 12),
                Text(widget.name,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Text(widget.sales!,
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FollowUs extends StatelessWidget {
  const FollowUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: 380,
      padding:
          EdgeInsets.symmetric(horizontal: _size.width * 0.10, vertical: 50),
      margin: EdgeInsets.symmetric(vertical: 35),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://res.cloudinary.com/vol/image/upload/v1632755406/assets/mesh_tt77oa.png'),
              fit: BoxFit.fill)),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Text("Join our community of new\nCreative Economy",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  )),
              SizedBox(height: 8),
              Text(
                  "We are bringing digital creators, crypto fanatics & art collectors\ntogether to move the culture forward.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  )),
              SizedBox(height: 28),
              // ElevatedButton(
              //     onPressed: () {},
              //     child: Text('Join Now ->',
              //         style: GoogleFonts.montserrat(
              //             color: Colors.black,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w500)),
              //     style: ElevatedButton.styleFrom(
              //       fixedSize: Size(150, 40),
              //       primary: Colors.tealAccent[400],
              //     )),
              SizedBox(
                width: 144,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smi(SocialIcons().twitter),
                    smi(SocialIcons().reddit),
                    smi(SocialIcons().discord)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  smi(String _icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Image.network(
        _icon,
        height: 34,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class PopularCategory extends StatelessWidget {
  const PopularCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: _size.height * 0.63,
      padding: EdgeInsets.only(left: 40, top: 8, bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Trending\n',
                          style: GoogleFonts.montserrat(
                              color: Colors.grey[800],
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                            text: "Categories",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 32))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(right: 50),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal, width: 0.8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.teal,
                    size: 24,
                  ))
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              PopularCatgTiles(
                  img:
                      'https://res.cloudinary.com/vol/image/upload/c_scale,h_831/v1632931039/assets/categories/ART-min_i8tf4w.jpg',
                  catg: 'Art',
                  items: rnm.nextInt(5000),
                  size: _size),
              PopularCatgTiles(
                  img:
                      'https://res.cloudinary.com/vol/image/upload/c_scale,h_856/v1632931199/assets/categories/music-min_oq5gzl.jpg',
                  catg: 'Music',
                  items: rnm.nextInt(5000),
                  size: _size),
              PopularCatgTiles(
                  img:
                      'https://res.cloudinary.com/vol/image/upload/c_scale,h_881/v1632931282/assets/categories/domain_twa918.jpg',
                  catg: 'Domains',
                  items: rnm.nextInt(5000),
                  size: _size),
            ],
          )
        ],
      ),
    );
  }
}

class PopularCatgTiles extends StatefulWidget {
  final String img;
  final String catg;
  final int items;
  final Size size;
  const PopularCatgTiles(
      {Key? key,
      required this.img,
      required this.catg,
      required this.items,
      required this.size})
      : super(key: key);

  @override
  _PopCategoryState createState() => _PopCategoryState();
}

class _PopCategoryState extends State<PopularCatgTiles> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      child: Container(
        height: 250,
        width: widget.size.width * 0.29,
        margin: EdgeInsets.only(right: 45),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.img), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Color(0XFFC1FFD7).withOpacity(isHovering ? 1.0 : 0.6),
                offset: Offset(0, 3),
                blurRadius: 5,
                spreadRadius: isHovering ? 5 : 1)
          ],
        ),
        transform: isHovering
            ? (Matrix4.identity()..translate(0, -8, 0))
            : Matrix4.identity(),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: Container(
                height: 70,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.catg,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(widget.items.toString() + ' items',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                        ]),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        size: 22,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
