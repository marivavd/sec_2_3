import 'package:flutter/material.dart';
import 'package:sec_2_3/auth/data/repository/supabace.dart';
import 'package:sec_2_3/auth/presentation/pages/sign_up_page.dart';
import 'package:sec_2_3/auth/presentation/widgets/text_field.dart';
import 'package:sec_2_3/home/presentation/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repository/show_error.dart';

class Sign_in_Page extends StatefulWidget {
  const Sign_in_Page({super.key});

  @override
  State<Sign_in_Page> createState() => _Sign_in_PageState();
}

class _Sign_in_PageState extends State<Sign_in_Page> {
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  bool check = false;
  bool button = false;
  bool is_obscure_password = true;
  void is_valid(){
    setState(() {
      button = email_controller.text.isNotEmpty && password_controller.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 130,),
              Text("Welcome Back",
                style: Theme.of(context).textTheme.labelLarge,),
              SizedBox(height: 4,),
              Text("Fill in your email and password to continue",
                style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 33,),
              Custom_Field_Text(label: "Email Address", hint: "***********@mail.com", controller: email_controller, on_change: (new_text){is_valid();}),
              SizedBox(height: 24,),
              Custom_Field_Text(label: "Password", hint: "**********", controller: password_controller, on_change: (new_text){is_valid();}, is_obscure: is_obscure_password, onTapSuffix: (){is_obscure_password = !is_obscure_password;},),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 14,
                            width: 14,
                            child: Checkbox(
                                value: check,
                                side: BorderSide(color: Color.fromARGB(255, 167, 167, 167), width: 1),
                                activeColor: Color.fromARGB(255, 0, 108, 236),
                                onChanged: (bool? val){
                                  check = val!;
                                }),
                          ),
                          SizedBox(width: 5,),
                          Text('Remember password',
                          style: Theme.of(context).textTheme.labelSmall,)
                        ],
                      )),
                  SizedBox(
                    child: InkWell(
                      onTap: (){
                      },
                      child: Text('Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 5, 96, 250)
                        ),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 180,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                      style: Theme.of(context).filledButtonTheme.style,
                      onPressed: (button) ? () async {
                        signIn(
                            email: email_controller.text,
                            password: password_controller.text,
                            onResponse: (AuthResponse response){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));},
                            onError: (String e) {showError(context, e);});
                      }: null,
                      child: Text(
                        "Log In",
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up_Page()));
                    },
                    child: Text('Sign Up',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("or log in using",
                        style: Theme.of(context).textTheme.titleMedium,),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset("assets/google.png"),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
