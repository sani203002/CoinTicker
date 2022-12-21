import 'package:http/http.dart' as http;
import 'dart:convert';

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
const apiKey = '14E25DE6-9D27-4BB7-83FF-27BEA502691C';

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    // http.Response response =
    //     await http.get(Uri.parse('$coinAPIURL/BTC/USD?apikey=$apiKey'));
    http.Response response = await http
        .get(Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey'));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      var price = decodedData['rate'];
      return price;
    } else {
      print(response.statusCode);
      throw 'Problem with the get response';
    }
  }
}
