import 'package:flutter/material.dart';
import 'package:owner_information/owner.dart';
import 'package:owner_information/view/input_information_page.dart';

class ShowInformationPage extends StatelessWidget {
   final Owner owner;
  const ShowInformationPage({Key? key, required this.owner}) : super(key: key);

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
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      owner.name??"",    // (?? " ") if the data is empty
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Email : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      owner.email??"",
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Phone : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      owner.phone??"",
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Age : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      owner.age.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Height (feet-inch) : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      owner.height.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Gender : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      owner.genderText!,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Owner Type : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 24,
                      width: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: owner.ownerTypeText?.length,
                        itemBuilder: (BuildContext context, int index) => Text(
                          "${owner.ownerTypeText![index]} "
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
