import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple[500],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _index = 0, _index1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        actions: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: new EdgeInsets.all(10.0),
              // Expanded(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // flex=1,
                  Container(
                    child:
                        Icon(Icons.arrow_back, size: 30, color: Colors.white),
                  ),
                  Container(
                    child: Text(
                      'Brief Bio: e-Health',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  maxHeight: 220.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[500],
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              height: 140.0,
                              child: DecoratedBox(
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: new NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwJ3l9A0r8essrrrjv2RNEQPxQ_pMqHWLf0g4OMZo8RxJRzEmm&usqp=CAU")))),
                            ),
                            // margin: new EdgeInsets.all(30.0),
                            Expanded(
                              child: Container(
                                width: 180,
                                margin:
                                    new EdgeInsets.only(top: 50.0, left: 20),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Text(
                                      'David Mesko, MD',
                                      // textAlign: TextAlign.right,

                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Health IT Expert',

                                      // textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Washington D.C.',

                                      //  textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildContainer('Current Pojects', '3', getProjects),
              buildContainer('Past Experience', '3', getPast),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Interests',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          Text('2',
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                    // Flexible(child:
                    Container(
                      margin: new EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.white,
                            child: Text('Machine Learning'),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          FlatButton(
                            color: Colors.white,
                            child: Text('Machine Learning'),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(String title, String number, dynamic func) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(number,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
          Container(
            child: SizedBox(
              height: 200, // card height
              child: PageView.builder(
                itemCount: 3,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index1 = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index1 ? 1 : 0.9,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: func(_index1),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          //card scroll
        ],
      ),
    );
  }
}

getProjects(int i) {
  if (i == 0)
    return project('COVID-19', 'Website',
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTVcACOCd8vdM55Deo3NL2s-Cdl8NNJDFgItIIHZ8R_cbeaMdmX&usqp=CAU");
  if (i == 1)
    return project('Lost Person Tracker', 'Python Application',
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTwpw1_XWNB150j45ab9fzsBMVU8ltzSrBXpWatq1RMmvgrC_a&usqp=CAU");
  if (i == 2)
    return project('Drowsy Driver Monitoring', 'Raspberry Pi Hardware',
        "https://webstockreview.net/images/driver-clipart-drowsy-driving.png");
}

Column project(String name, String tech, String image) {
  return Column(
    children: <Widget>[
      Container(
        margin: new EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // image: new DecoratedBox(decoration: null),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(tech, style: TextStyle(fontSize: 16)),
              ],
            )),
            Container(
              width: 70.0,
              height: 70.0,
              child: DecoratedBox(
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.cover, image: new NetworkImage(image)))),
            ),
          ],
        ),
      ),
      Flexible(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Hardware that can be easily be fitted in any vehical and can be used to alam the driver if he is sleepy.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    ],
  );
}

getPast(int i) {
  if (i == 1)
    return pastEx(
        "https://www.pngkey.com/png/detail/50-506039_iit-bombay-logo-png.png",
        "SDE-Intern",
        "IIT Bombay");
  if (i == 0)
    return pastEx(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQutO7-USXRhKjHdfzsS7uIp_P8zIoc1tYj5EkNEEfFyF91_XGX&usqp=CAU",
        "SDE-Intern",
        "Innovaccer");

  if (i == 2)
    return pastEx(
        "https://pbs.twimg.com/profile_images/1138375574726955008/1fNUyEdv.png",
        "Technical Content Writer",
        "GeeksforGeeks");
}

Container pastEx(String image, String post, String place) {
  return Container(
    margin: new EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 110.0,
          height: 110.0,
          child: DecoratedBox(
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                      fit: BoxFit.cover, image: new NetworkImage(image)))),
        ),
        Flexible(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(post,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(place, style: TextStyle(fontSize: 16)),
          ],
        )),
      ],
    ),
  );
}
