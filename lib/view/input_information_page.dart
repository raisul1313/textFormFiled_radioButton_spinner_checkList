import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owner_information/custom_ui/custom_button.dart';
import 'package:owner_information/custom_ui/custom_header.dart';
import 'package:owner_information/custom_ui/custom_text_form_field.dart';
import 'package:owner_information/owner.dart';
import 'package:owner_information/utils/page_utils.dart';
import 'package:owner_information/utils/validations_utils.dart';
import 'package:owner_information/view/show_infomation_page.dart';

class InputInformationPage extends StatefulWidget {
  const InputInformationPage({Key? key}) : super(key: key);

  @override
  State<InputInformationPage> createState() => _InputInformationPageState();
}

class _InputInformationPageState extends State<InputInformationPage> {
  late double _pageHeight;
  late double _pageWidth;
  final _formKey = GlobalKey<FormState>();
  final _checkboxFormGlobalKey = GlobalKey<FormState>();
  late Owner _owner;
  late List<String> _ownerType;
  bool _autoValidate = false;
  int _radioValue = 0;
  String _genderType = 'Male';
  bool _isBikeChecked = false;
  bool _isCarChecked = false;
  bool _isTruckChecked = false;
  bool _isHouseChecked = false;

  @override
  void initState() {
    _ownerType = [];
    _owner = Owner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pageHeight = MediaQuery.of(context).size.height;
    _pageWidth = PageUtils.getPageWidth(context);
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
          height: _pageHeight,
          width: _pageWidth,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Gender: ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: _pageWidth * .02,
                            ),
                            _radioButtons(),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        _getCheckboxWidget(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                            buttonName: "Submit",
                            onButtonPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  _checkboxFormGlobalKey.currentState!
                                      .validate()) {
                                _formKey.currentState!.save();
                                _checkboxFormGlobalKey.currentState!.save();
                                _owner.genderText = _genderType;
                                _owner.ownerTypeText = _ownerType;
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

  _radioButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: 0,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        Text(
          'Male',
          style: new TextStyle(color: Colors.black),
        ),
        SizedBox(
          width: _pageWidth * .02,
        ),
        Radio(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: 1,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        Text(
          'Female',
          style: new TextStyle(color: Colors.black),
        ),
        SizedBox(
          width: _pageWidth * .02,
        ),
        Radio(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: 2,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        Text(
          'Other',
          style: new TextStyle(color: Colors.black
              //fontSize: 16.0,
              ),
        )
      ],
    );
  }

  _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;
      switch (_radioValue) {
        case 0:
          setState(() {
            _genderType = 'Male';
          });
          break;
        case 1:
          setState(() {
            _genderType = 'Female';
          });
          break;
        case 2:
          setState(() {
            _genderType = 'Other';
          });
          break;
      }
    });
  }

  Widget _getCheckboxWidget() {
    return Form(
      key: _checkboxFormGlobalKey,
      autovalidateMode:
          _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: FormField<bool>(
        //output from validation will be displayed in state.errorText (down)
        validator: (value) {
          if (value != true) {
            return "";
          } else {
            return null;
          }
        },
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomHeader(
                    headerName: 'Owner Type. ',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 5.0),
                  Text(state.errorText ?? ""),
                  state.errorText == null
                      ? Text("")
                      : Text(
                          '*Select One',
                          style: TextStyle(
                              color: Colors.red.shade700, fontSize: 11.5),
                        ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                        child: Checkbox(
                          value: _isBikeChecked,
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          onChanged: (value) {
                            _isBikeChecked = value!;
                            if (value) {
                              _ownerType.add('Bike');
                              state.didChange(value);
                            } else {
                              _ownerType.remove('Bike');
                            }

                            if (_ownerType.isEmpty) {
                              state.didChange(false);
                            }

                            setState(() {});
                          },
                        ),
                      ),
                      Text(
                        'Bike',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.0,
                        child: Checkbox(
                          value: _isCarChecked,
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          onChanged: (value) {
                            _isCarChecked = value!;
                            if (value) {
                              _ownerType.add('Car');
                              state.didChange(value);
                            } else {
                              _ownerType.remove('Car');
                            }

                            if (_ownerType.isEmpty) {
                              state.didChange(false);
                            }

                            setState(() {});
                          },
                        ),
                      ),
                      Text(
                        'Car',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.0,
                        child: Checkbox(
                          value: _isTruckChecked,
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          onChanged: (value) {
                            _isTruckChecked = value!;
                            if (value) {
                              _ownerType.add('Truck');
                              state.didChange(value);
                            } else {
                              _ownerType.remove('Truck');
                            }
                            if (_ownerType.isEmpty) {
                              state.didChange(false);
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Text(
                        'Truck',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.0,
                        child: Checkbox(
                          value: _isHouseChecked,
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          onChanged: (value) {
                            _isHouseChecked = value!;
                            if (value) {
                              _ownerType.add('House');
                              state.didChange(value);
                            } else {
                              _ownerType.remove('House');
                            }
                            if (_ownerType.isEmpty) {
                              state.didChange(false);
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Text(
                        'House',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
