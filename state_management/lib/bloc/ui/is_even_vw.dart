import 'package:flutter/material.dart';
import 'package:state_management/bloc/blocs/is_even_bloc.dart';
import 'package:state_management/bloc/models/is_even_data.dart';

class IsEvenVw extends StatefulWidget {
  const IsEvenVw({Key? key}) : super(key: key);

  @override
  State<IsEvenVw> createState() => _IsEvenVwState();
}

class _IsEvenVwState extends State<IsEvenVw> {
  final _numCtl = TextEditingController();

  @override
  void initState() {
    _numCtl.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.isEvenProcessing,
              builder: (context, AsyncSnapshot<IsEvenData> snapshot) {
                if (snapshot.hasData) {
                  return Text((snapshot.data!.isEven ? '${_numCtl.text} is even' : '${_numCtl.text} is odd'));
                }
                return const Text('IDLE...');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(controller: _numCtl),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => bloc.chkIsEven(int.parse(_numCtl.text)),
              child: const Text('Check if your number is even'),
            )
          ],
        ),
      ),
    );
  }
}
