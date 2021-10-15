import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/pages/nft-preview.dart';

import '../variables.dart';

class ExploreCard extends StatefulWidget {
  final String imgNFT;
  final String imgCreator;
  final String title;
  final String category;
  final String bidType;
  final int price;
  final Size size;
  final String hero;
  final int royality;
  final int likes;
  ExploreCard(
      {required this.imgNFT,
      required this.imgCreator,
      required this.size,
      required this.title,
      required this.category,
      required this.bidType,
      required this.price,
      required this.royality,
      required this.likes,
      required this.hero});

  @override
  _ExploreCardState createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1250,
      ),
    );

    _animation = Tween<double>(begin: 0, end: -8).animate(_controller);
    _controller.forward();

    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nftMeta.imgNFT = widget.imgNFT;
        nftMeta.imgCreator = widget.imgCreator;
        nftMeta.size = widget.size;
        nftMeta.title = widget.title;
        nftMeta.category = widget.category;
        nftMeta.bidType = widget.bidType;
        nftMeta.price = widget.price;
        nftMeta.hero = widget.hero;
        Navigator.of(context).pushNamed(PreviewNFT.route);
      },
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      child: Container(
        width: widget.size.width * 0.21,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        transform: isHovering
            ? (Matrix4.identity()..translate(0, _animation.value, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.tealAccent, width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0XFFC1FFD7).withOpacity(isHovering ? 0.8 : 0.2),
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  spreadRadius: isHovering ? 5 : 0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Hero(
                  tag: "NFT" + widget.hero,
                  child: Container(
                    height: 165,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imgNFT),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: royality(widget.royality),
                    ),
                  )
                  // Image(
                  //   image: NetworkImage(widget.imgNFT),
                  //   width: double.infinity,
                  //   height: 165,
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedUser = widget.imgCreator;
                          Navigator.of(context).pushNamed('/artist');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundImage: AssetImage("${widget.imgCreator}"),
                        ),
                      ),
                      Icon(rnmFav[widget.likes], color: Colors.red),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      "${widget.title}",
                      style: GoogleFonts.montserrat(
                          color: Colors.grey[850],
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "${widget.category}",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                        color: textCol.withOpacity(0.7), thickness: 0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.bidType}",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("${widget.price}" + " SOL",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Color(0XFFC1FFD7), width: 2)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
