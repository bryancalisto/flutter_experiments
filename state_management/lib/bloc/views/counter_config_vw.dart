import 'package:flutter/material.dart';
import 'package:state_management/get_it/models/counter.dart';
import 'package:state_management/get_it/services/counter_svc.dart';
import 'package:state_management/get_it/services/locator.dart';

class CounterConfigVw extends StatefulWidget {
  static const route = 'CounterConfigVw';

  const CounterConfigVw({Key? key}) : super(key: key);

  @override
  _CounterConfigVwState createState() => _CounterConfigVwState();
}

class _CounterConfigVwState extends State<CounterConfigVw> {
  bool saved = true;
  var startCtl = TextEditingController();
  var endCtl = TextEditingController();
  var stepCtl = TextEditingController();

  @override
  void initState() {
    /*Start text inputs values with the global counter instance values*/
    startCtl.text = '0';
    endCtl.text = '0';
    stepCtl.text = '0';
    super.initState();
  }

  void setSavedFalse() {
    setState(() => saved = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Start'),
                NumberInput(ctl: startCtl, onTap: setSavedFalse),
                const SizedBox(height: 10),
                const Text('End'),
                NumberInput(ctl: endCtl, onTap: setSavedFalse),
                const SizedBox(height: 10),
                const Text('Step'),
                NumberInput(ctl: stepCtl, onTap: setSavedFalse),
                const SizedBox(height: 10),
                const Text('Save'),
                ElevatedButton(
                  onPressed: () {
                    /*Save the current configuration*/
                    setState(() => saved = true);
                  },
                  child: const Icon(Icons.save, size: 40),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Column(
              children: [
                const Text('Saved?'),
                const SizedBox(height: 10),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: saved ? Colors.greenAccent : Colors.redAccent,
                    border: Border.all(width: 2),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NumberInput extends StatefulWidget {
  final TextEditingController ctl;
  final VoidCallback? onTap;
  const NumberInput({Key? key, required this.ctl, this.onTap}) : super(key: key);

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 30),
              controller: widget.ctl,
              readOnly: true,
            ),
          ),
          Column(
            children: [
              GestureDetector(
                child: const Icon(Icons.arrow_drop_up, size: 30),
                onTap: () {
                  setState(() {
                    var current = int.tryParse(widget.ctl.text) ?? -1;
                    widget.ctl.text = (++current).toString();
                  });

                  if (widget.onTap != null) {
                    widget.onTap!();
                  }
                },
              ),
              GestureDetector(
                child: const Icon(Icons.arrow_drop_down, size: 30),
                onTap: () {
                  setState(() {
                    var current = int.tryParse(widget.ctl.text) ?? 1;
                    widget.ctl.text = (--current).toString();
                  });

                  if (widget.onTap != null) {
                    widget.onTap!();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
