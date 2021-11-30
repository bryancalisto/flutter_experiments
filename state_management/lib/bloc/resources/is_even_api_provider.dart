import 'dart:convert';

import 'package:state_management/bloc/models/is_even_data.dart';
import 'package:http/http.dart' as http;

class IsEvenApiProvider {
  Future<IsEvenData> chkEvenness(int num) async {
    final response = await http.get(Uri.https('api.isevenapi.xyz', '/api/iseven/$num/'));
    if (response.statusCode == 200) {
      return IsEvenData.fromJson(json.decode(response.body));
    } else {
      print('API ERROR. HTTP ${response.statusCode}');
      throw Error();
    }
  }
}
