
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sec_2_3/auth/data/repository/show_error.dart';
import 'package:sec_2_3/auth/data/repository/supabace.dart';
import 'package:sec_2_3/auth/presentation/pages/sign_in_page.dart';
import 'package:sec_2_3/auth/presentation/widgets/text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Sign_up_Page extends StatefulWidget {
  const Sign_up_Page({super.key});

  @override
  State<Sign_up_Page> createState() => _Sign_up_PageState();
}

class _Sign_up_PageState extends State<Sign_up_Page> {
  var name_controller = TextEditingController();
  var phone_controller = MaskedTextController(mask: "+0(000)000-00-00");
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var confirm_password_controller = TextEditingController();
  bool check = false;
  bool button = false;
  bool is_obscure_password = true;
  bool is_obscure_confirmpassword = true;
  void is_valid(){
    setState(() {
      button = name_controller.text.isNotEmpty && phone_controller.text.isNotEmpty && email_controller.text.isNotEmpty && password_controller.text.isNotEmpty && confirm_password_controller.text.isNotEmpty && check;
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
              SizedBox(height: 40,),
              Text("Create an account",
              style: Theme.of(context).textTheme.labelLarge,),
              SizedBox(height: 4,),
              Text("Complete the sign up process to get started",
              style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: 33,),
              Custom_Field_Text(label: "Full name", hint: "Ivanov Ivan", controller: name_controller, on_change: (new_text){is_valid();}),
              SizedBox(height: 24,),
              Custom_Field_Text(label: "Phone Number", hint: "+7(999)999-99-99", controller: phone_controller, on_change: (new_text){is_valid();}),
              SizedBox(height: 24,),
              Custom_Field_Text(label: "Email Address", hint: "***********@mail.com", controller: email_controller, on_change: (new_text){is_valid();}),
              SizedBox(height: 24,),
              Custom_Field_Text(label: "Password", hint: "**********", controller: password_controller, on_change: (new_text){is_valid();}, is_obscure: is_obscure_password, onTapSuffix: (){is_obscure_password = !is_obscure_password;},),
              SizedBox(height: 24,),
              Custom_Field_Text(label: "Confirm Password", hint: "**********", controller: confirm_password_controller, on_change: (new_text){is_valid();}, is_obscure: is_obscure_confirmpassword, onTapSuffix: (){is_obscure_confirmpassword = !is_obscure_confirmpassword;},),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14,
                    width: 14,
                    child: Checkbox(
                        value: check,
                        side: BorderSide(color: Color.fromARGB(255, 0, 108, 236), width: 1),
                        activeColor: Color.fromARGB(255, 0, 108, 236),
                        onChanged: (bool? val){
                          check = val!;
                          is_valid();
                        }),
                  ),
                  SizedBox(width: 15,),
                  RichText(
                      text: TextSpan(
                        text: "By ticking this box, you agree to our ",
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(text: "Terms and \nconditions and private policy", style: TextStyle(color: Color.fromARGB(255, 235, 188, 46)))
                        ]
                      ))
                ],
              ),
              SizedBox(height: 64,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                      onPressed: (button) ? () async {
                      signUp(email: email_controller.text,
                          password: password_controller.text,
                          confirm_password: confirm_password_controller.text,
                          full_name: name_controller.text,
                          phone_number: phone_controller.text,
                          onResponse: (AuthResponse response){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));},
                          onError: (String e) {showError(context, e);});}: null,
                      child: Text(
                        "Sign Up",
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                    },
                    child: Text('Sign in',
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
                      Text("or sign in using",
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
