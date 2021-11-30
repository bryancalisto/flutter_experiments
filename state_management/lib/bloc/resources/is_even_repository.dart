import 'package:state_management/bloc/models/is_even_data.dart';
import 'package:state_management/bloc/resources/is_even_api_provider.dart';

class IsEvenRepository {
  final isEvenApiProvider = IsEvenApiProvider();
  Future<IsEvenData> chkEvenness(int num) => isEvenApiProvider.chkEvenness(num);
}
