import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputInformationFiled extends StatefulWidget {
  const InputInformationFiled({Key? key}) : super(key: key);

  @override
  State<InputInformationFiled> createState() => _InputInformationFiledState();
}

class _InputInformationFiledState extends State<InputInformationFiled> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _groupValue = 1;
  bool _isValid = false;
  bool _isChecked = false;

  void _saveForm() {
    setState(() {
      _isValid = _formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Owner Information",
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white70,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "*All Fields Are Required.",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              hintText: "Enter Your Name",
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (!RegExp(
                                      r'^[A-Za-z.-]+(\s*[A-Za-z.-]+)*$')
                                  .hasMatch(value)) {
                                return "Type a valid name";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              hintText: "Enter Your Email Address",
                              labelText: "Email Address",
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              hintText: "Enter Your Phone Number",
                              labelText: "Phone Number",
                              prefixIcon: Icon(Icons.phone_android),
                              prefixText: "+88 ",
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(11),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (!RegExp(r'^01[3-9]\d{8}$')
                                  .hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    hintText: "Age",
                                    labelText: "Age",
                                    prefixIcon: Icon(Icons.accessibility_new),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else if (int.tryParse(value)! > 200) {
                                      return "Age between 0 to 200 ";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    hintText: "Enter Your Height",
                                    labelText: "Height (feet-inch)",
                                    prefixIcon: Icon(Icons.height),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else if (double.tryParse(value)! > 8.0) {
                                      return "Not more than 8 feet ";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    //FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Gender: ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio(
                                  value: 1,
                                  groupValue: _groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _groupValue = 1;
                                    });
                                  }),
                              Text("Male"),
                              Radio(
                                  value: 2,
                                  groupValue: _groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _groupValue = 2;
                                    });
                                  }),
                              Text("Female"),
                              Radio(
                                  value: 3,
                                  groupValue: _groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _groupValue = 3;
                                    });
                                  }),
                              Text("Other"),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Owner Type: ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: _isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isChecked = value!;
                                            });
                                          }),
                                      Text("Bike"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: _isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isChecked = value!;
                                            });
                                          }),
                                      Text("Car"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: _isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isChecked = value!;
                                            });
                                          }),
                                      Text("Truck"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),






                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: Text("Submit"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
