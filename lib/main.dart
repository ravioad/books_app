import 'package:book_apps/details.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(offset: Offset(3, 3), blurRadius: 10),
                        ]),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/pic1.jpg"),
                    ),
                  ),
                  GradientText(
                    "BOOKS",
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.orange, Colors.pink],
                    ),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10),
                children: <Widget>[
                  makeItem(image: "images/pic1.jpg"),
                  makeItem(image: "images/pic2.jpg"),
                  makeItem(image: "images/pic3.jpg"),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Popular",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          borderSide:
                              BorderSide(width: 3, color: Colors.blue.shade300),
                          child: Text(
                            "View All",
                            style: TextStyle(color: Colors.blue.shade300),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return listItem(
                              image: "images/pic$index.jpg", tag: "tag$index");
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 20,
                            color: Colors.black26,
                          );
                        },
                        itemCount: 4),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem({image, tag}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailsPage(
                  image: image,
                  tag: tag,
                ),
                type: PageTransitionType.fade));
      },
      child: Container(
        height: 100,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: tag,
              child: Container(
                height: 100,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(offset: Offset(5, 5), blurRadius: 10),
                    ]),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Book title",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Author name",
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.orange.shade700,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.0",
                        style: TextStyle(
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeItem({image}) {
    return Container(
      width: 330,
      margin: EdgeInsets.only(right: 20, bottom: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(offset: Offset(5, 5), blurRadius: 10),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Author name",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2)),
            SizedBox(
              height: 10,
            ),
            Text(
              "234 Books",
              style: TextStyle(
                  color: Colors.white, fontSize: 15, letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
