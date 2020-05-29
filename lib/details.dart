import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String image;
  final String tag;

  const DetailsPage({Key key, this.image, this.tag}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          flexibleSpace: Hero(
            tag: widget.tag,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Book title",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    borderSide:
                        BorderSide(width: 3, color: Colors.blue.shade300),
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blue.shade300,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Text("Author name",
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                  Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                  Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                  Icon(Icons.star, color: Colors.orange.shade700, size: 20),
                  Icon(Icons.star, color: Colors.grey, size: 20),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.0",
                    style: TextStyle(
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(2460)",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "22",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      " Likes",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.message),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "14",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(" Comments",
                        style: TextStyle(fontSize: 15, color: Colors.black54)),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.share),
                    Text("  Share",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ))
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "About the book",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet, ea sed quis utinam invidunt, nec no tantas aeterno, at quot insolens mea. Dicta menandri per te, vim ad summo antiopam imperdiet, eu nostro repudiare cum. Ex aliquando eloquentiam quo, at mea quem phaedrum convenire. Eu vel legendos assentior repudiandae, vix te case accumsan suscipit.Tale etiam indoctum vel ei. Cu nam velit altera delectus. Graeci detraxit vix ad, an pri solum summo vivendo. Eu liber dolore intellegebat vis. Vis facilis suavitate instructior ut, et ullum periculis hendrerit vim. Te sonet albucius legendos mel, simul labores an vel.",
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  createButton(
                      icon: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      color: Colors.blue,
                      text: "READ NOW"),
                  createButton(
                    icon: Icon(Icons.shopping_basket, color: Colors.white),
                    text: "PURCHASE",
                    color: Colors.pink,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createButton({icon, color, text}) {
    return ButtonTheme(
      minWidth: 160,
      height: 45,
      child: FlatButton.icon(
        onPressed: () {},
        icon: icon,
        label: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
