import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/PageExtensions/bottom.dart';
import 'package:volatile/PageExtensions/exploreEXT.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../variables.dart';

class ExplorePage extends StatelessWidget {
  static const String route = '/explore';

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEDFFEC),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      extendBodyBehindAppBar: true,
      body: ListView(children: [
        Container(
          width: _size.width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FilterTab(),
                Spacer(),
                NFTSection(),
                Spacer()
              ]),
        ),
        BottomMenu(size: _size)
      ]),
    );
  }
}

// Filter Menu Design

class FilterTab extends StatelessWidget {
  const FilterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //required variables & functions
    var _size = MediaQuery.of(context).size;
    var filterCategory = <Widget>[];

    for (var i = 0; i < catgTitle.length; i++) {
      filterCategory.add(categoryTitle(i));
    }

    //elements rendering
    return Container(
      width: _size.width * 0.22,
      height: _size.height + 48,
      decoration: BoxDecoration(
        color: Color(0xffEDFFEC),
        boxShadow: [
          BoxShadow(
              color: Colors.tealAccent[400]!.withOpacity(0.3),
              offset: Offset(3, 0),
              blurRadius: 20,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
        // border: Border(
        //   right: BorderSide(
        //       color: Colors.purpleAccent.withOpacity(0.25), width: 1.5),
        // )
      ),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 60,
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.stream),
                    SizedBox(width: 8),
                    Text("Filters",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w500)),
                    Spacer(),
                    Icon(Icons.arrow_left_rounded, size: 35)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterItems(),
              ),
            ]),
      ),
    );
  }
}

class NFTSection extends StatelessWidget {
  const NFTSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _cardsList = <ExploreCard>[];
    for (var i = 0; i <= 5; i++) {
      int _rdn = ranRange(0, allNFT.length);
      _cardsList.add(ExploreCard(
        imgNFT: allNFT[_rdn],
        imgCreator: "assets/faces/face" + (rnm.nextInt(12)).toString() + ".jpg",
        title: titleList[_rdn],
        category: catgTitle[rnm.nextInt(catgTitle.length)],
        bidType: bidTypes[rnm.nextInt(2)],
        price: ranRange(50, 250),
        size: _size,
        royality: ranRange(0, 20),
        likes: rnm.nextInt(2),
        hero: i.toString(),
      ));
    }

    return Container(
      width: _size.width * 0.7,
      color: Color(0xffEDFFEC),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Column(children: [
          SortTab(),
          Center(
              child: Wrap(
            runSpacing: 30.0,
            spacing: 5.0,
            children: _cardsList,
          )),
          ProgressLoadMore(text: 'Loading NFTs')
        ]),
      ),
    );
  }
}

class ProgressLoadMore extends StatelessWidget {
  final String text;
  const ProgressLoadMore({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.tealAccent[100]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 22),
            Text(
              text,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

//Required Elements Functions

class FilterItems extends StatefulWidget {
  const FilterItems({Key? key}) : super(key: key);

  @override
  _FilterItemsState createState() => _FilterItemsState();
}

bool _isStatusExpand = false;
bool _isPriceExpand = true;
bool _isCatgExpanded = false;
bool _isAttrExpanded = false;
RangeValues _currentRangeValues = const RangeValues(50, 250);

class _FilterItemsState extends State<FilterItems> {
  @override
  Widget build(BuildContext context) {
    var filterCategory = <Widget>[];
    var filters = <Widget>[];
    var ticks = <bool>[true, false];

    String dropdownvalue = 'Lowest Price';
    var items = [
      'Lowest Price',
      'Highest Price',
      'Popular',
      'Rrending',
      'Relevence',
      'I\'m feeling lucky'
    ];

    filters.add(checkBoxBuilder('All', true));

    for (var i = 0; i < catgTitle.length; i++) {
      filterCategory.add(categoryTitle(i));
      filters.add(checkBoxBuilder(catgTitle[i], false));
    }

    return ExpansionPanelList(
      elevation: 1,
      animationDuration: Duration(milliseconds: 200),
      dividerColor: Colors.tealAccent,
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: _isStatusExpand,
          backgroundColor: Color(0XFFC1FFD7),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.shapes,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    " Status",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Wrap(
                runSpacing: 15.0,
                spacing: 8.0,
                children: <Widget>[
                  buttonBuilder('Buy Now'),
                  buttonBuilder('On Auction'),
                  buttonBuilder('New'),
                  buttonBuilder('Has Offers'),
                ],
              )),
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Color(0XFFC1FFD7),
          isExpanded: _isPriceExpand,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.price_change),
                  Text(
                    " Price",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RangeSlider(
                  values: _currentRangeValues,
                  min: 0,
                  max: 500,
                  divisions: 10,
                  inactiveColor: Color(0xff88FFF7),
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          initialValue: 50.toString(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            suffixText: "SOL",
                            border: OutlineInputBorder(),
                            hintText: 'Min',
                          ),
                        ),
                      ),
                      Flexible(flex: 1, child: Text(" to ")),
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          initialValue: 250.toString(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            suffixText: "SOL",
                            border: OutlineInputBorder(),
                            hintText: 'Max',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0XFFC1FFD7),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue.toString();
                        });
                      },
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Clear'),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                primary: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.grey)),
                                textStyle: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 14))),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Apply',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black87, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            primary: Color(0XFFC1FFD7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.teal),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: _isCatgExpanded,
          backgroundColor: Color(0XFFC1FFD7),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              color: Colors.white10,
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.filter_alt_rounded),
                  Text(
                    " Categories",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                children: filters,
              )),
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: _isAttrExpanded,
          backgroundColor: Color(0XFFC1FFD7),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.hatWizard, size: 20),
                  SizedBox(width: 4),
                  Text(
                    " Attributes",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                filterCategory[0],
                filterCategory[1],
                filterCategory[2],
              ],
            ),
          ),
        ),
      ],
      expansionCallback: (int item, bool status) {
        setState(() {
          switch (item) {
            case 0:
              {
                _isStatusExpand = !_isStatusExpand;
              }
              break;
            case 1:
              {
                _isPriceExpand = !_isPriceExpand;
              }
              break;
            case 2:
              {
                _isCatgExpanded = !_isCatgExpanded;
              }
              break;
            case 3:
              {
                _isAttrExpanded = !_isAttrExpanded;
              }
              break;
            default:
              print(item);
          }
        });
      },
    );
  }

  buttonBuilder(String _buttText) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          _buttText,
          style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          fixedSize: Size(110, 40),
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 18),
          side: BorderSide(color: Colors.tealAccent),
        ));
  }
}

class SortTab extends StatefulWidget {
  const SortTab({Key? key}) : super(key: key);

  @override
  _SortTabState createState() => _SortTabState();
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

class _SortTabState extends State<SortTab> {
  String dropdownvalue = 'Lowest Price';
  String _defValue = 'Rarity Asc';
  var raritySort = ['Rarity Asc', 'Rarity Desc'];
  var items = [
    'Lowest Price',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Row(children: <Widget>[
          Text(rnm.nextInt(25000).toString() + ' NFT found'),
          Spacer(),
          SizedBox(
            width: 320,
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search_rounded,
                  size: 20,
                  color: Colors.tealAccent,
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 17),
                labelText: 'Search',
                labelStyle: TextStyle(fontSize: 14, color: Colors.teal[400]),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 6,
                  borderSide:
                      BorderSide(color: Colors.tealAccent[400]!, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                border: OutlineInputBorder(
                  gapPadding: 6,
                  borderSide: BorderSide(color: Color(0XFFC1FFD7), width: 0.6),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: FlutterSwitch(
              value: isSwitched,
              activeColor: Color(0XFFC1FFD7),
              activeText: 'NSFW',
              inactiveText: 'Off',
              showOnOff: true,
              activeToggleColor: Colors.grey[800],
              toggleSize: 20,
              borderRadius: 12,
              padding: 8,
              height: 45,
              width: 110,
              activeTextColor: Colors.grey[800]!,
              onToggle: (value) {
                print("VALUE : $value");
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
          dropDownCustom(raritySort)
        ]));
  }

  dropDownCustom(List<String> _listItem) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0XFFC1FFD7),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _defValue,
          isDense: true,
          icon: Icon(Icons.keyboard_arrow_down),
          items: _listItem.map((String items) {
            return DropdownMenuItem(value: items, child: Text(items));
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _defValue = newValue.toString();
            });
          },
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey[800],
              fontSize: 16),
        ),
      ),
    );
  }
}
