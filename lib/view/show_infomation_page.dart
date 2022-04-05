import 'package:flutter/material.dart';
import 'package:owner_information/view/input_information_page.dart';

class ShowInformationPage extends StatelessWidget {
  final String name, email, genderText;
  final List<String> ownerTypeText;

  final int phone, age;
  final double height;

  const ShowInformationPage(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.age,
      required this.height,
      required this.genderText,
      required this.ownerTypeText})
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
          //automaticallyImplyLeading: false
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white30,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Name : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                          fontSize: 20),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                          fontSize: 20),
                    ),
                    Text(
                      phone.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                          fontSize: 20),
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                          fontSize: 20),
                    ),
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                          fontSize: 20),
                    ),
                    Text(
                      genderText,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Owner Type : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    Container(
                      height: 24,
                      width: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ownerTypeText.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Text(
                              "${ownerTypeText[index]} ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                      ),
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
                        builder: (context) => InputInformationPage(),
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
