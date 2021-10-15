// ignore_for_file: avoid_web_libraries_in_flutter

@JS()
library app;

import 'package:js/js.dart';

import 'dart:js_util';
import 'dart:convert';
import 'package:http/http.dart';
import '../variables.dart';
import 'dart:js' as js;


class HttpService {
  Future getPrice() async {
    Response res = await get(Uri.parse(solAPI));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      solUSDT = double.parse(body['price']);
      return solUSDT;
    } else {
      throw 'Can\'t get price';
    }
  }
}

@JS()
external getAccount();

class Phantom{
  Future connect() async{
    var phan = await promiseToFuture(getAccount());
    print(phan);
    return phan;
  }

  disconnect() async {
    await js.context.callMethod('disconnectAccount');
    isWallet = false;
  }
}

class PriceJson {
  final String ticker;
  final int price;
  PriceJson({
    required this.ticker,
    required this.price,
  });

  factory PriceJson.fromJson(Map<String, dynamic> json) {
    return PriceJson(
      ticker: json['symbol'] as String,
      price: json['price'] as int,
    );
  }
}