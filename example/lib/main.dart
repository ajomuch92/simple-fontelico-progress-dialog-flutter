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
                _showDialog(context, SimpleFontelicoProgressDialogType.normal);
              }, 
              child: Text('Normal'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.threelines);
              }, 
              child: Text('Three Lines'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.multilines);
              }, 
              child: Text('Multilines'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.refresh);
              }, 
              child: Text('Refresh'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.phoenix);
              }, 
              child: Text('Phoenix'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.hurricane);
              }, 
              child: Text('Hurricane'),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: (){
                _showDialog(context, SimpleFontelicoProgressDialogType.iphone);
              }, 
              child: Text('Iphone'),
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showDialog(BuildContext context, SimpleFontelicoProgressDialogType type) async{
    if(_dialog == null) {
      _dialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable:  false);
    }
    _dialog.show(message: 'Loading...', type: type);
    await Future.delayed(Duration(seconds: 1));
    _dialog.hide();
  }
}
