import 'dart:convert';
import 'package:http/http.dart' as http;


const url = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = '0C2BD771-FF9B-4AE0-B601-66DF6B4DE5D8';

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

class CoinData {
  int coinIndex = 0;
  Future getCurrencyData(String selectedCurrency) async {
    Map<String, String> coindata = {};
    for(String crypto in cryptoList){
      http.Response response = await http.get(Uri.parse('$url/$crypto/$selectedCurrency?apikey=$apikey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodeData = jsonDecode(data);
        double lastData = decodeData['rate'];
        coindata[crypto] = lastData.toStringAsFixed(0);
      }
      else
      {
        throw('Problem with get request');
      }
    }
    return coindata;

  }

}
