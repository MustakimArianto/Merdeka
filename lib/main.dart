import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merdeka',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Merdeka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Sejarah Kemerdekaan Indonesia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Nov 20, 2019',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Text(
        '''Proklamasi Kemerdekaan Indonesia dilaksanakan pada hari Jumat, 17 Agustus 1945 tahun Masehi, atau tanggal 17 Agustus 2605 menurut tahun Jepang, yang dibacakan oleh Soekarno dengan didampingi oleh Drs. Mohammad Hatta bertempat di Jalan Pegangsaan Timur 56, Jakarta Pusat.\n\nKata-kata dan deklarasi proklamasi tersebut harus menyeimbangkan kepentingan-kepentingan internal Indonesia dan Jepang yang saling bertentangan pada saat itu. Proklamasi tersebut menandai dimulainya perlawanan diplomatik dan bersenjata dari Revolusi Nasional Indonesia, yang berperang melawan pasukan Belanda dan warga sipil pro-Belanda, hingga Belanda secara resmi mengakui kemerdekaan Indonesia pada tahun 1949.Pada tahun 2005, Belanda menyatakan bahwa mereka telah memutuskan untuk menerima secara de facto tanggal 17 Agustus 1945 sebagai tanggal kemerdekaan Indonesia...''',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.red, Colors.orange])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.white, Icons.add_comment, 'COMMENT'),
          _buildButtonColumn(Colors.white, Icons.share, 'SHARE'),
        ],
      ),
    );
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(widget.title),
        backgroundColorStart: Colors.red,
        backgroundColorEnd: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/img.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          textSection,
          buttonSection,
        ]
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

}
