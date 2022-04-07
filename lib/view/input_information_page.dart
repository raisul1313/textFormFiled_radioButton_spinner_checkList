import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owner_information/custom_ui/custom_button.dart';
import 'package:owner_information/custom_ui/custom_text_form_field.dart';
import 'package:owner_information/owner.dart';
import 'package:owner_information/utils/color_utils.dart';
import 'package:owner_information/utils/utils.dart';
import 'package:owner_information/view/show_infomation_page.dart';

class InputInformationPage extends StatefulWidget {
  const InputInformationPage({Key? key}) : super(key: key);

  @override
  State<InputInformationPage> createState() => _InputInformationPageState();
}

class _InputInformationPageState extends State<InputInformationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Owner _owner;
  int _radioGroupValue = 1;
  String _selectedGender = " ";
  late List<String> _selectOwnerType;
  late bool _bikeVal, _carVal, _truckVal, _houseVal;
  bool _autoValidate = false;

  @override
  void initState() {
    _bikeVal = false;
    _carVal = false;
    _truckVal = false;
    _houseVal = false;
    _selectOwnerType = [];
    _owner = Owner();
    //_selectedGender = "baal";
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
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: _autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "*All fields are required.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFormField(
                          label: "Name",
                          hint: "Enter Name",
                          borderRadius: 5,
                          prefixIcon: Icon(Icons.person),
                          validator: FormValidator.validateTextForm,
                          onSaved: _onNameSaved,
                          inputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFormField(
                          label: "Email",
                          hint: "Enter Email",
                          borderRadius: 5,
                          prefixIcon: Icon(Icons.email_rounded),
                          validator: FormValidator.validateEmailForm,
                          onSaved: _onEmailSaved,
                          inputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFormField(
                          label: "Phone",
                          hint: "Enter Phone Number",
                          prefixText: "+88 ",
                          borderRadius: 5,
                          prefixIcon: Icon(Icons.phone_android),
                          validator: FormValidator.validatePhoneForm,
                          onSaved: _onPhoneSaved,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.phone,
                          textinputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                label: "Age",
                                hint: "Enter Age",
                                borderRadius: 5,
                                prefixIcon: Icon(Icons.accessibility_new),
                                validator: FormValidator.validateAgeForm,
                                onSaved: _onAgeSaved,
                                textInputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                textinputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                label: "Height",
                                hint: "Enter Height",
                                borderRadius: 5,
                                prefixIcon: Icon(Icons.height),
                                validator: FormValidator.validateHeightForm,
                                onSaved: _onHeightSaved,
                                textInputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                textinputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                ],
                              ),
                            ),
                          ],
                        ),

                        /*
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
                                    onChanged: _handleRadioValue),
                                Text("Male"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: _radioGroupValue,
                                    onChanged: _handleRadioValue),
                                Text("Female"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: _radioGroupValue,
                                    onChanged: _handleRadioValue),
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
                        ),*/
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                            buttonName: "Submit",
                            onButtonPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _owner.genderText = _selectedGender;
                                _owner.ownerTypeText = _selectOwnerType;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowInformationPage(
                                      owner: _owner,
                                    ),
                                  ),
                                );
                              }
                              setState(() {
                                _autoValidate = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onNameSaved(name) => _owner.name = name;

  _onEmailSaved(email) => _owner.email = email;

  _onPhoneSaved(phone) => _owner.phone = phone;

  _onAgeSaved(age) => _owner.age = age;

  _onHeightSaved(height) => _owner.height = height;

  _handleRadioValue(value) {
    switch (value) {
      case 1:
        setState(() {
          _radioGroupValue = value;
          _selectedGender = "Male";
        });

        break;
      case 2:
        setState(() {
          _radioGroupValue = value;
          _selectedGender = "Female";
        });
        break;
      case 3:
        setState(() {
          _radioGroupValue = value;
          _selectedGender = "Other";
        });
        break;
      default:
        _selectedGender = "Male";
        break;
    }
  }
}
