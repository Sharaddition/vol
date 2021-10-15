import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/variables.dart';

class BottomMenu extends StatelessWidget {
  final Size size;
  const BottomMenu({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253.45,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.teal.withOpacity(0.15),
              offset: Offset(0.0, 0.0), //(x,y)
              blurRadius: 15.0,
              spreadRadius: 1.5)
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      margin: EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[SiteInfo(), CategoryTiles(), Newsletter()],
      ),
    );
  }
}

class SiteInfo extends StatelessWidget {
  const SiteInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image(
            width: 135,
            image: NetworkImage(
                'https://res.cloudinary.com/vol/image/upload/v1633029616/assets/vol-liquid_imi2jl.png'),
            fit: BoxFit.fitWidth,
          ),
          // Text(
          //   'The Creative \nEconomy',
          //   style: TextStyle(
          //       fontSize: 17,
          //       color: Colors.grey[800],
          //       fontWeight: FontWeight.w600),
          // )
        ],
      ),
    );
  }
}

class CategoryTiles extends StatelessWidget {
  const CategoryTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _titles = <Widget>[];
    _titles.add(Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        '  Category',
        style: GoogleFonts.montserrat(
            fontSize: 22, color: Colors.grey[850], fontWeight: FontWeight.w700),
      ),
    ));

    for (var item in catgTitle) {
      _titles.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.1),
          child: TextButton(
            onPressed: () {},
            child: Text(
              item,
              style: GoogleFonts.epilogue(
                  fontSize: 17,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      );
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _titles,
      ),
    );
  }
}

class Newsletter extends StatelessWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Get handpicked NFTs',
              style: GoogleFonts.montserrat(
                  fontSize: 21,
                  color: Colors.grey[850],
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'Join our newsletter and get trending NFTs in your mailbox',
            style: GoogleFonts.epilogue(
                fontSize: 17,
                color: Colors.grey[800],
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 22),
          TextFormField(
            initialValue: 'hello@volatile.market',
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
