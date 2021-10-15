import 'package:flutter/material.dart';
import 'package:volatile/PageExtensions/singleMintEXT.dart';
import 'package:volatile/minter/multiple.dart';
import 'package:volatile/minter/single.dart';
import 'package:volatile/pages/artist.dart';
import 'package:volatile/pages/explore.dart';
import 'package:volatile/pages/nft-preview.dart';
import 'package:volatile/pages/mintPage.dart';
import 'package:volatile/pages/showcase.dart';
import 'package:volatile/start.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vOl',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xffC1FFD7),
      ),
      routes: {
        ArtistPage.route: (context) => ArtistPage(),
        PreviewNFT.route: (context) => PreviewNFT(),
        ExplorePage.route: (context) => ExplorePage(),
        MintPage.route: (context) => MintPage(),
        SingleMint.route: (context) => SingleMint(),
        ImageFromGalleryEx.route: (context) => ImageFromGalleryEx(),
        ShowcaseNFT.route:(context)=>ShowcaseNFT(),
        NFTMinted.route:(context)=>NFTMinted(),
      },
      home: Start(),
    );
  }
}