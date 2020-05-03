import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {

  final _textcontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sehir Seç"),),
      body: Form(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textcontroller,
                  decoration: InputDecoration(
                    labelText: "Sehir",
                    hintText: "Sehir seçiniz",
                      border: OutlineInputBorder()
                  ),

                ),
              ),
            ),
            IconButton(icon: Icon(Icons.location_searching), onPressed: (){
              Navigator.pop(context,_textcontroller.text);

            }),
          ],
        ),
      ),
    );
  }
}
