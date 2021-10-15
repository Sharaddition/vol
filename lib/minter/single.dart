import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volatile/PageExtensions/singleMintEXT.dart';
import 'package:volatile/variables.dart';
import 'package:image_picker/image_picker.dart';

class SingleMint extends StatefulWidget {
  static const String route = '/single';

  @override
  State<SingleMint> createState() => _SingleMintState();
}

class _SingleMintState extends State<SingleMint> {
  int _currentStep = 0;
  int _maxStep = 3;
  StepperType stepperType = StepperType.vertical;
  String? file = "File Name";

  

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 16, horizontal: _size.width * 0.15),
        child: Column(
          children: [
            Text(
              "Single Mint",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Fill in the required fileds, choose minting fees, fractional shares & KaBoom!",
                style: GoogleFonts.epilogue(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context)
                    .copyWith(scrollbars: false),
                child: Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: Text(
                        "Create new item",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      content: UploadImage(),
                      isActive: _currentStep >= 0,
                      state: iconState(0),
                    ),
                    Step(
                      title: Text('Supply & Collab'),
                      content: RoyalityStep(),
                      isActive: _currentStep >= 0,
                      state: iconState(1),
                    ),
                    Step(
                      title: new Text('Mint & List'),
                      content: ListNFT(),
                      isActive: _currentStep >= 0,
                      state: iconState(2),
                    ),
                    // Step(
                    //   title: new Text('Sponsored Listing'),
                    //   content: Column(
                    //     children: <Widget>[
                    //       TextFormField(
                    //         decoration:
                    //             InputDecoration(labelText: 'Mobile Number'),
                    //       ),
                    //     ],
                    //   ),
                    //   isActive: _currentStep >= 0,
                    //   state: iconState(3),
                    // ),
                    Step(
                      title: new Text('Publish'),
                      content: PublishNFT(),
                      isActive: _currentStep >= 0,
                      state: iconState(3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  iconState(int step) {
    if (_currentStep == step) {
      return StepState.editing;
    }
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.disabled;
    }
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < _maxStep ? setState(() => _currentStep += 1) : finish();
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  finish() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 8), () {
          print('5 Seconds Elapsed');
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(NFTMinted.route);
        });
        return MintDialog();
      },
    );
  }
}

//Widgets

var optImage;
var optName;
var optPrice;

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  var _image;
  var _imageName;
  var imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                labelText("Image,Video,Audio,3D Model,Dynamic Art"),
                hintText(
                    "Supported file types are - JPG, PNG, SVG, etc, choose from any of the mentioned."),
                InkWell(
                  hoverColor: Colors.tealAccent,
                  splashColor: Colors.teal,
                  onTap: () async {
                    var source = ImageSource.gallery;
                    XFile image = await imagePicker.pickImage(
                        source: source, imageQuality: 50);
                    setState(() {
                      _image = image.path;
                      optImage = _image;
                      _imageName = image.name;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image(
                      image: AssetImage("assets/elements/upload.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            _image != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Container(
                        width: 1.5, height: 200, color: Colors.grey[350]),
                  )
                : SizedBox.shrink(),
            _image != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      labelText('🔗 Attachment'),
                      hintText('Selected files to be minted will appear here'),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        child: Text(
                          _imageName,
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                        width: 355,
                        decoration: BoxDecoration(
                          color: Colors.tealAccent[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
          ],
        ),
        labelText('Name *'),
        textField('Item Name'),
        labelText('External Link'),
        hintText(
            'NFT showcase pages will include a link to this URL on the item\'s details page'),
        textField('https://youtu.be/my-special-vid')
      ],
    );
  }
}

class RoyalityStep extends StatefulWidget {
  const RoyalityStep({Key? key}) : super(key: key);

  @override
  _RoyalityStepState createState() => _RoyalityStepState();
}

class _RoyalityStepState extends State<RoyalityStep> {
  int _currentRoyality = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        labelText('Maximum Supply'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            initialValue: 1.toString(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        labelText('Royality Percentage'),
        hintText('Royalties to be paid to creators on each secondary sale.'),
        // NumberPicker(
        //   value: _currentRoyality,
        //   minValue: 0,
        //   maxValue: 100,
        //   step: 5,
        //   itemHeight: 50,
        //   axis: Axis.horizontal,
        //   onChanged: (value) => setState(() => _currentRoyality = value),
        //   // decoration: BoxDecoration(
        //   //   borderRadius: BorderRadius.circular(12),
        //   //   border: Border.all(color: Colors.black26),
        //   // ),
        //   selectedTextStyle: GoogleFonts.montserrat(
        //     color: Colors.black,
        //     fontSize: 22,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: FaIcon(FontAwesomeIcons.percentage),
              labelText: 'Choose from 0 - 100',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        labelText('Creators Split'),
        hintText('Percentage of royality to be splitted amongst the creators.'),
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.solidPlusSquare, color: Colors.black),
                SizedBox(width: 16),
                labelText('Add creator')
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: tealGradient,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

enum SaleTime { instantly, speceficTime }

class ListNFT extends StatefulWidget {
  const ListNFT({Key? key}) : super(key: key);

  @override
  _ListNFTState createState() => _ListNFTState();
}

class _ListNFTState extends State<ListNFT> with SingleTickerProviderStateMixin {
  late final cont;

  void initState() {
    super.initState();
    cont = new TabController(length: 2, vsync: this);
  }

  final myController = TextEditingController();
  bool isSwitched = true;
  SaleTime _saleTime = SaleTime.instantly;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cont.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            labelText('Instantly List'),
            Spacer(),
            FlutterSwitch(
              height: 25,
              width: 55,
              value: isSwitched,
              activeColor: Colors.tealAccent,
              toggleColor: Colors.black87,
              onToggle: (value) {
                print("VALUE : $value");
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 13),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(6)),
          child: new TabBar(
            controller: cont,
            unselectedLabelColor: Colors.black87,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                gradient: tealGradient,
                borderRadius: BorderRadius.circular(6),
                color: Colors.indigo),
            tabs: [
              tabTile(FontAwesomeIcons.dotCircle, 'Fixed Sol'),
              tabTile(FontAwesomeIcons.gavel, 'Auction'),
            ],
          ),
        ),
        Container(
          height: 130,
          margin: EdgeInsets.only(top: 13),
          child: TabBarView(
            controller: cont,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('Price'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: myController,
                      onChanged: (value) {
                        setState(() {
                          optPrice = double.parse(myController.text);
                          print(optPrice);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Specify price in SOL',
                        suffixText: 'SOL',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    r'$' +
                        (int.parse(myController.text == ''
                                    ? '0'
                                    : myController.text) *
                                solUSDT)
                            .toStringAsFixed(2),
                    style: GoogleFonts.montserrat(
                        fontSize: 14, color: Colors.grey),
                  ),
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
            ],
          ),
        ),
        labelText('Time'),
        hintText('Specify time when your NFT goes for sale'),
        radioButt('Immediately', 'Collectors can buy as soon as it\'s listed',
            SaleTime.instantly),
        radioButt('On specific date',
            'Collectors can buy on specified duration', SaleTime.speceficTime)
      ],
    );
  }

  tabTile(IconData _icon, String _title) {
    return Tab(
      height: 60,
      icon: FaIcon(_icon),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  radioButt(String _title, String _sub, SaleTime _value) {
    return ListTile(
      title: Text(
        '$_title',
        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey[850]),
      ),
      subtitle: Text(
        _sub,
        style: GoogleFonts.epilogue(fontSize: 14, color: Colors.grey[400]),
      ),
      leading: Radio(
        value: _value,
        groupValue: _saleTime,
        onChanged: (SaleTime? value) {
          setState(() {
            _saleTime = value!;
          });
        },
      ),
    );
  }
}

class PublishNFT extends StatefulWidget {
  const PublishNFT({Key? key}) : super(key: key);

  @override
  _PublishNFTState createState() => _PublishNFTState();
}

class _PublishNFTState extends State<PublishNFT> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText2('Fees'),
            SizedBox(
              height: 30,
              width: 500,
              child: Row(
                children: [
                  subTitle('Minting Fees'),
                  Spacer(),
                  feesText('0.01 SOL')
                ],
              ),
            ),
            SizedBox(
              height: 30,
              width: 500,
              child: Row(
                children: [
                  subTitle('Platform Fees'),
                  Spacer(),
                  feesText('0.25 %')
                ],
              ),
            ),
            SizedBox(height: 14),
            labelText2('Total to pay'),
            SizedBox(
              height: 36,
              width: 500,
              child: Row(
                children: [
                  subTitle('Final fees in  SOL'),
                  Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Text(
                      (optPrice * 0.0025 + 0.01).toString() + ' SOL',
                      style: GoogleFonts.montserrat(
                        color: Colors.tealAccent[400],
                        fontSize: 22,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Container(width: 1.5, height: 235, color: Colors.grey[350]),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText('Preview'),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                optImage,
                width: 210.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
            )
          ],
        )
      ],
    );
  }

  subTitle(_input) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        _input,
        style: GoogleFonts.epilogue(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
    );
  }

  feesText(_input) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        _input,
        style: GoogleFonts.montserrat(
          color: Colors.grey[800],
          fontSize: 15,
        ),
      ),
    );
  }

  labelText2(String _input) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Text(
        _input,
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
