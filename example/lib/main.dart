import 'package:flutter/material.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Fontellico Progress Dialog Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SimpleFontelicoProgressDialog _dialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Fontellico Progress Dialog Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.normal, 'Normal');
              }, 
              child: Text('Normal'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.threelines, 'Three Lines');
              }, 
              child: Text('Three Lines'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.multilines, 'Multilines');
              }, 
              child: Text('Multilines'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.refresh, 'Refresh');
              }, 
              child: Text('Refresh'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.phoenix, 'Phoenix');
              }, 
              child: Text('Phoenix'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.hurricane, 'Hurricane');
              }, 
              child: Text('Hurricane'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.iphone, 'Iphone');
              }, 
              child: Text('Iphone'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.custom, 'Custom');
              }, 
              child: Text('Custom'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.spinner, 'Spinner');
              }, 
              child: Text('Spinner'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.cog, 'Cog');
              }, 
              child: Text('Cog'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.redo, 'Redo');
              }, 
              child: Text('Redo'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.notch, 'Notch');
              }, 
              child: Text('Notch'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.bullets, 'Bullets');
              }, 
              child: Text('Bullets'),
            ),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.multiHurricane, 'MultiHurricane');
              }, 
              child: Text('MultiHurricane'),
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showDialog(BuildContext context, SimpleFontelicoProgressDialogType type, String text) async{
    if(_dialog == null) {
      _dialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable:  false);
    }
    if(type == SimpleFontelicoProgressDialogType.custom) {
      _dialog.show(message: text, type: type, width: 150.0, height: 75.0, loadingIndicator: Text('C', style: TextStyle(fontSize: 24.0),));
    } else {
      _dialog.show(message: text, type: type, horizontal: true, width: 150.0, height: 75.0, hideText: true, indicatorColor: Colors.red);
    }
    await Future.delayed(Duration(seconds: 1));
    _dialog.hide();
  }
}
