import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'BB7B9513-8592-4672-98BD-31DE19068186';

class CoinData {
  //TODO: Create your getCoinData() method here.4
  Future getCoinData(String selectedCurrency) async {
    int serverStatus;

    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';

    http.Response response = await http.get(requestURL);
    serverStatus = response.statusCode;
    if (serverStatus == 200) {
      print("success");
      var decodeData = jsonDecode(response.body);

      var price = decodeData['rate'];
      return price;
    } else {
      print(serverStatus);
      throw 'Problem with the get request';
    }
  }
}
