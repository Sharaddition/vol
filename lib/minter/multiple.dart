import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../variables.dart';

class ImageFromGalleryEx extends StatefulWidget {
  static const String route = '/mutiple';

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState();
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59), child: Appbar(number)),
      body: DropScreen(),
      // body: Column(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 52,
      //     ),
      //     Center(
      //       child: GestureDetector(
      //         onTap: () async {
      //           var source = ImageSource.gallery;
      //           XFile image = await imagePicker.pickImage(
      //               source: source, imageQuality: 50);
      //           setState(() {
      //             _image = image.path;
      //           });
      //         },
      //         child: Container(
      //           width: 200,
      //           height: 200,
      //           decoration: BoxDecoration(color: Colors.red[200]),
      //           child: _image != null
      //               ? Image.network(
      //                   _image,
      //                   width: 200.0,
      //                   height: 200.0,
      //                   fit: BoxFit.cover,
      //                 )
      //               : Container(
      //                   decoration: BoxDecoration(color: Colors.red[200]),
      //                   width: 200,
      //                   height: 200,
      //                   child: Icon(
      //                     Icons.camera_alt,
      //                     color: Colors.grey[800],
      //                   ),
      //                 ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class DropScreen extends StatefulWidget {
  @override
  State<DropScreen> createState() => _DropScreenState();
}

class _DropScreenState extends State<DropScreen> {
  int _currentStep = 0;
  int _maxStep = 4;
  StepperType stepperType = StepperType.horizontal;
  String? file = "File Name";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.symmetric(vertical: 16, horizontal: _size.width * 0.15),
        child: Column(
          children: [
            Text(
              "Multiple Mint",
              style: GoogleFonts.epilogue(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Fill in the required fileds, choose minting fees, fractional shares & KaBoom!",
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Stepper(
                type: stepperType,
                elevation: 0,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: Text(
                      "Drop Details",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    content: StartDrop(),
                    isActive: _currentStep >= 0,
                    state: iconState(0),
                  ),
                  Step(
                    title: new Text('Create Drop'),
                    content: ImageLayers(),
                    isActive: _currentStep >= 0,
                    state: iconState(1),
                  ),
                  Step(
                    title: new Text('Collabs & Royality'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: iconState(2),
                  ),
                  Step(
                    title: new Text('Run Engine'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: iconState(3),
                  ),
                  Step(
                    title: new Text('Finish DROP'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: iconState(3),
                  ),
                ],
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
    _currentStep < _maxStep ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

class StartDrop extends StatelessWidget {
  const StartDrop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        labelText('Drop Name *'),
        textField('Ex - Solamas, Degen Ape'),
        labelText('Description'),
        hintText(
            'Sweet short description that would be showcased along all NFT\'s in this drop'),
        textField('Collection of 5000+ metaverse degen apes...'),
        labelText("Cover Art"),
        hintText(
            "Upload cover image for your collection, cover images may be used to promote your drop"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Image(
            image: AssetImage("assets/elements/upload.jpg"),
          ),
        ),
      ],
    );
  }
}

class ImageLayers extends StatelessWidget {
  const ImageLayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          labelText('Base Layer'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image(
                image: AssetImage("assets/elements/upload.jpg"),
              )),
              labelText('Layer #1'),
              Row(children: <Widget>[
                SizedBox(width:205,child:textField('Layer Name')),
                SizedBox(width: 35),
                SizedBox(width:205,child:textField('Rarity %'))
              ],)
        ],
      ),
    );
  }
}
