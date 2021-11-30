import 'package:rxdart/rxdart.dart';
import 'package:state_management/bloc/models/is_even_data.dart';
import 'package:state_management/bloc/resources/is_even_repository.dart';

class IsEvenBloc {
  final _repository = IsEvenRepository();
  final _isEvenApiAgent = PublishSubject<IsEvenData>();
  Stream<IsEvenData> get isEvenProcessing => _isEvenApiAgent.stream;

  chkIsEven(int num) async {
    final isEvenResult = await _repository.isEvenApiProvider.chkEvenness(num);
    _isEvenApiAgent.sink.add(isEvenResult);
  }

  dispose() {
    _isEvenApiAgent.close();
  }
}

final bloc = IsEvenBloc();
