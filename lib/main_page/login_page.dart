import 'package:country/country.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mychat/utily/assets_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   Country selectedCountry =CountryPickerUtils.getCountryByPhoneCode('90');
    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Column(
         children: [ SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset(AssetsManager.logon),
        ),
        SizedBox(
          height: 20,),
          Text('My Chat Pro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text('Add your phone number to login or register', style: TextStyle(fontSize: 15, color: Colors.grey)), 
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Phone Number',
              prefixIcon: Icon(Icons.phone_android),
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            
            keyboardType: TextInputType.phone,

          ),

         ],
        )
      )
    );
  }
}