import 'package:comunai/ui/account_setuppage/user_self_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../color.dart';
import '../controller/signup_controller.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  SignupController _controller = Get.put(SignupController());
  late DateTime _selectedDate;
  final List<String> items = [
    'Male',
    'Female',
    'Other',
  ];
  final _formKey = GlobalKey<FormState>();
  String? selectedValue,datebirth,fullname,email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              children: [
                const ListTile(
                    title: Text(
                      "Tell us about you",
                      style:
                          TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text(
                        'Your data is safe with us.',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: AppColors.textColor, fontSize: 14.0),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 58.0,
                    child: TextFormField(
                      onSaved: (input) => fullname = input,
                       controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 16.0,
                        height: 1.0,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: const TextStyle(
                            color: AppColors.textColor// Adjust font size of the label
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 58,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400, width: 1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: DropdownButton(
                      hint: const Text(' select gender',
                      style: TextStyle(fontSize: 16),),
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      items: items.map((selectedValue) {
                        return DropdownMenuItem(
                            value: selectedValue, child: Text(selectedValue));
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 58,
                    child: TextFormField(
                      onSaved: (input) => datebirth = input,
                      decoration:  InputDecoration(
                        label:const Text('Birth Date'),
                        hintText: 'Date',
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          size: 36.0,
                        ),
                        labelStyle: const TextStyle(
                            color: AppColors.textColor// Adjust font size of the label
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));
                        if (pickedDate != null) {
                          dateController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 58.0,
                    child: TextFormField(
                      onSaved: (input) => email = input,
                       controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        height: 1.0,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email address',
                        labelStyle: const TextStyle(
                            fontSize: 16.0,
                            color: AppColors.textColor// Adjust font size of the label
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xfffffaeb),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/img/warning.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'You can choose to hide your details \n while sharing on the app.',
                            style: TextStyle(color: Colors.orange.shade600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.80,
                      height: 48,
                      color: AppColors.btnColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        if(nameController.text.isNotEmpty){
                          // _controller.verifyphonenumber(textEditingController.text);
                          _submit();
                        }else{
                          Get.snackbar("Error", "All Filed is Mandatory",backgroundColor: AppColors.textColor,colorText: Colors.white);
                        }
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.signup(fullname!,email!,datebirth! , selectedValue!);


      // Perform login with _email and _password
    }
  }
}
