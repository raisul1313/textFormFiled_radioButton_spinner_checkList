import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owner_information/view/show_infomation_page.dart';

class InputInformationPage extends StatefulWidget {
  const InputInformationPage({Key? key}) : super(key: key);

  @override
  State<InputInformationPage> createState() => _InputInformationPageState();
}

class _InputInformationPageState extends State<InputInformationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int _radioGroupValue;
  late String _selectedGender;
  late List <String> _selectOwnerType;

  late bool _bikeVal, _carVal, _truckVal, _houseVal;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void initState() {
    _radioGroupValue = 1;
    _selectedGender = "Male";
    _bikeVal = false;
    _carVal = false;
    _truckVal = false;
    _houseVal = false;
    _selectOwnerType = [];
    super.initState();
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
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          hintText: "Enter your name",
                          labelText: "Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          } else if (!RegExp(r'^[A-Za-z.-]+(\s*[A-Za-z.-]+)*$')
                              .hasMatch(value)) {
                            return "Type a valid name";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          //FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(50),
                        ],
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
                        controller: _emailController,
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
                        controller: _phoneController,
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
                                      color: Theme.of(context).primaryColor),
                                ),
                                hintText: "Age",
                                labelText: "Age",
                                prefixIcon: Icon(Icons.accessibility_new),
                              ),
                              controller: _ageController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                } else if (int.tryParse(value)! > 200) {
                                  return "Age between 0 to 200 ";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                                hintText: "Feet.Inch",
                                labelText: "Height",
                                prefixIcon: Icon(Icons.height),
                              ),
                              controller: _heightController,
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
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _radioGroupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioGroupValue = 1;
                                      _selectedGender = "Male";
                                    });
                                  }),
                              Text("Male"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _radioGroupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioGroupValue = 2;
                                      _selectedGender = "Female";
                                    });
                                  }),
                              Text("Female"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 3,
                                  groupValue: _radioGroupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioGroupValue = 3;
                                      _selectedGender = "Other";
                                    });
                                  }),
                              Text("Other"),
                            ],
                          ),
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
                                    value: _bikeVal,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        if (_bikeVal = newValue!) {
                                          _selectOwnerType.add("Bike");
                                        } else {
                                          _selectOwnerType.remove("Bike");
                                        }
                                      });
                                    },
                                  ),
                                  Text("Bike"),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _carVal,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          if (_carVal = newValue!) {
                                            _selectOwnerType.add("Car");
                                          } else {
                                            _selectOwnerType.remove("Car");
                                          }
                                        });
                                      }),
                                  Text("Car"),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _truckVal,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          if (_truckVal = newValue!) {
                                            _selectOwnerType.add("Truck");
                                          } else {
                                            _selectOwnerType.remove("Truck");
                                          }
                                        });
                                      }),
                                  Text("Truck"),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: _houseVal,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          if (_houseVal = newValue!) {
                                            _selectOwnerType.add("House");
                                          } else {
                                            _selectOwnerType.remove("House");
                                          }
                                        });
                                      }),
                                  Text("House"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowInformationPage(
                                    email: _emailController.text,
                                    height:
                                        double.parse(_heightController.text),
                                    name: _nameController.text,
                                    phone: int.parse(_phoneController.text),
                                    age: int.parse(_ageController.text),
                                    genderText: _selectedGender,
                                    ownerTypeText: _selectOwnerType,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text("Submit"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
