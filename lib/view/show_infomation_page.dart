import 'package:flutter/material.dart';
import 'package:owner_information/view/input_information_page.dart';

class ShowInformationPage extends StatelessWidget {
  final String name, email;
  final int phone, age, gender;
  final double height;

  const ShowInformationPage(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.age,
      required this.height,
      required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Owner's Information",
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Name : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Email : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      email,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Phone : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      phone.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Age : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Height (feet-inch) : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      height.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Gender : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      gender.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputInformationFiled(),
                      ),
                    );
                  },
                  child: Text("Back"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
