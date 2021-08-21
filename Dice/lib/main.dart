import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:calci()
  ));
}

class calci extends StatefulWidget {
  const calci({Key? key}) : super(key: key);

  @override
  _calciState createState() => _calciState();
}

class _calciState extends State<calci> {

  final controller =TextEditingController();

  List<bool>_selection=[true,false,false];

  late String tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if (tip!=null)
              Padding(
                  padding:EdgeInsets.all(8.0),
                child: Text(tip,style: TextStyle(fontSize: 20.0),),
              ),

            Text("Total Amount",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            SizedBox(width: 75.0,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "\$ 0.00"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ToggleButtons(
                  children: [Text("10%"),Text("20%"),Text("30%")],
                  isSelected: _selection,
                   onPressed: updateIndex,
              ),
            ),
            ElevatedButton(onPressed:calculateTip,
                child: Text("Calculate Tip"),
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.green)
              ),
            )
          ],
        ),
      ),
    );
  }
  void updateIndex(int selectIndex){
    setState(() {
      for(int i=0; i<_selection.length; i++){
        _selection[i]=selectIndex==[i];
      }
    });
    }

    void calculateTip(){

    final totalAmount=double .parse(controller.text);
    final selectIndex=_selection.where((element) => element);
    final tipPercentage=[0.1,0.15,0.2][selectIndex];

    final tipTotal=(totalAmount * tipPercentage).toStringAsPrecision(2);

    setState(() {
      tip="$tipTotal";
    });

    }
  }

