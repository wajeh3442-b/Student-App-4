import 'package:flutter/material.dart';

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  final String imageUrl = "C:\Users\MC\Desktop\PIC\me.jpeg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Student App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Container(
          width: 320,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.network(
                imageUrl,
                height: 120,
              ),

              SizedBox(height: 20),

              Text(
                "wajeh ul hassan",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Flutter Learner",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: 25),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        imageUrl: imageUrl,
                      ),
                    ),
                  );
                },

                child: Text(
                  "View Details",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {

  final String imageUrl;

  DetailScreen({required this.imageUrl});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Container(
          width: 340,
          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.network(
                widget.imageUrl,
                height: 120,
              ),

              SizedBox(height: 20),

              infoText("Program", "BS Computer Science"),
              SizedBox(height: 10),

              infoText("Semester", "5th"),
              SizedBox(height: 10),

              infoText("Course", "Mobile App Development"),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),

                  SizedBox(width: 10),

                  Text(
                    "Likes: $likes",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    likes++;
                  });
                },

                icon: Icon(Icons.favorite),
                label: Text("Like"),
              ),

              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: Text("Go Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoText(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "$title: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        Flexible(
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}