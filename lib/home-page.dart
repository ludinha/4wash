//import de components da google no caso ios seria cupertino
import 'package:flutter/material.dart';
import 'models/enum-washtypes.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final loginTextController = TextEditingController();
  SingingCharacter _character = SingingCharacter.lavagem1;
//build desenha a tela
  @override
  Widget build(BuildContext context) {
    final searchAddressbox = TextFormField(
      controller: loginTextController,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Adress',
        contentPadding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final roundbox1 = ListTile(
      title: const Text('Ducha Simples',style: TextStyle(fontSize: 18)),
      leading: Radio(
        value: SingingCharacter.lavagem1,
        groupValue: _character,
        onChanged: (SingingCharacter value) {
          // setState(() {
          //   _character = value;
          // });
        },
      ),
    );
    final roundbox2 = ListTile(
      title: const Text('Lavagem Completa',style: TextStyle(fontSize: 18)),
      leading: Radio(
        value: SingingCharacter.lavagem2,
        groupValue: _character,
        onChanged: (SingingCharacter value) {
          // setState(() {
          //   _character = value;
          // });
        },
      ),
    );

    final roundbox3 = ListTile(
      title: const Text('Lavagem Completa Com Cera',style: TextStyle(fontSize: 18)),
      leading: Radio(
        value: SingingCharacter.lavagem2,
        groupValue: _character,
        onChanged: (SingingCharacter value) {
          // setState(() {
          //   _character = value;
          // });
        },
      ),
    );

    final searchButton =  Align(
      alignment: Alignment.bottomCenter,     
        child: RaisedButton(
            onPressed: () {
            },
            padding: EdgeInsets.all(12.0),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12.0)),
            color: Colors.blueAccent,
            child: Text('Vamos la!', style: TextStyle(color: Colors.white))));

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.lightBlue[900], Colors.blue])),
      child: Column(
        //adiciona aqui embaixo novos widgets
        children: <Widget>[
          searchAddressbox,
          SizedBox(height: 48.0),
          roundbox1,
          SizedBox(height: 15.0),
          roundbox2, 
          SizedBox(height: 15.0),
          roundbox3,
          SizedBox(height: 150.0),
          searchButton          
          ],
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('4wash' ,style: TextStyle(fontSize: 30)),
      ),
      body: body,
      );
  }
}
