import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/variables.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class MintPage extends StatelessWidget {
  static const String route = '/mint';

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Stack(children: [
          BlurHash(hash: r"LOGxTqHi93NLCz~PRT9yt5S_bsxq"),
          Positioned(
            top: _size.height * 0.11,
            left: _size.width * 0.24,
            child: Column(
              children: [
                Text(
                  'Mint Creation',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 8),
                Text(
                  'Choose from given variety of mintable art forms. Each mint type is stored on-chain\nand isn\'t editabe once uploaded',
                  style: GoogleFonts.epilogue(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    MintCard(
                      title: "Single \nCollection",
                      img:
                          "https://res.cloudinary.com/vol/image/upload/v1632755422/assets/painter_hhmky9.jpg",
                      desc: "Mint a single Art.",
                      route: '/single',
                      buttonBgCol: Colors.blueAccent[700],
                      descCol: Colors.grey[700],
                      buttonTextCol: Colors.white,
                    ),
                    MintCard(
                      title: "Fractionalize \nYour Art",
                      img:
                          "https://res.cloudinary.com/vol/image/upload/v1632755414/assets/fractional_xbfqrr.jpg",
                      desc: "Mint shares/fractions of your Collectible or Art",
                      titleCol: Colors.white,
                      route: '',
                      descCol: Colors.grey[200],
                      buttonBgCol: Colors.white,
                      buttonTextCol: Colors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MintCard(
                      title: "Dynamic \nCollecibles",
                      img:
                          "https://res.cloudinary.com/vol/image/upload/v1632755425/assets/dynamic_zgwmop.jpg",
                      desc:
                          "Enables minting of HTML powered by JS & CSS, that can change on external oracles.",
                      titleCol: Colors.white,
                      route: '',
                      descCol: Colors.grey[200],
                      buttonBgCol: Colors.white,
                      buttonTextCol: Colors.black,
                    ),
                    MintCard(
                      title: "Drop \nCollection",
                      img:
                          "https://res.cloudinary.com/vol/image/upload/v1632755419/assets/multiple_rdrsat.jpg",
                      desc:
                          'Drop collectible with unique properties formed of layered images.',
                      route: '/mutiple',
                      buttonBgCol: Colors.blueAccent[700],
                      descCol: Colors.grey[700],
                      buttonTextCol: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class MintCard extends StatefulWidget {
  final String title;
  final String desc;
  final String img;
  final String route;
  late Color? titleCol = Colors.grey[850]!;
  late Color? descCol;
  late Color? buttonBgCol;
  late Color? buttonTextCol = Colors.grey[600]!;
  MintCard(
      {required this.title,
      required this.img,
      required this.desc,
      required this.route,
      this.titleCol,
      this.descCol = const Color(0xFF6b6b6b),
      this.buttonBgCol,
      this.buttonTextCol});

  @override
  _MintCardState createState() => _MintCardState(
      title: title,
      image: img,
      headCol: titleCol,
      desc: desc,
      route:route,
      descCol: descCol,
      buttonTextCol: buttonTextCol,
      buttonBgCol: buttonBgCol);
}

class _MintCardState extends State<MintCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final String title;
  final String image;
  final String desc;
  final String route;
  late Color? headCol = Colors.grey[850]!;
  late Color? descCol = const Color(0xababab);
  late Color? buttonBgCol;
  late Color? buttonTextCol = Colors.grey[600]!;
  bool isHovering = false;
  _MintCardState(
      {required this.title,
      required this.image,
      required this.desc,
      required this.route,
      this.headCol,
      this.descCol,
      this.buttonBgCol,
      this.buttonTextCol});

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
    var _size = MediaQuery.of(context).size;

    return InkWell(
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        height: 200,
        width: _size.width * 0.25,
        transform: isHovering
            ? (Matrix4.identity()..translate(0, _animation.value, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$image'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.blueAccent.shade700
                      .withOpacity(isHovering ? 0.4 : 0.2),
                  offset: Offset(2, 3),
                  blurRadius: 8,
                  spreadRadius: isHovering ? 5 : 0)
            ]),
        child: Padding(
          padding: EdgeInsets.only(
              top: 10, left: 10, bottom: 10, right: _size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: GoogleFonts.montserrat(
                    color: headCol, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: descCol,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {},
                child: Text('Create',
                    style: GoogleFonts.montserrat(
                        color: buttonTextCol, fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(130, 32),
                  primary: buttonBgCol,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
