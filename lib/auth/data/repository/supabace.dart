import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> signUp(
    {required String email,
      required String password,
      required String confirm_password,
      required String full_name,
      required String phone_number,
      required Function onResponse,
      required Function onError}) async {
  try {
    if (!EmailValidator.validate(email)){
      throw Exception("Incorrect email");
    }
    if (confirm_password != password) {
      throw Exception("Passwords don't match");
    } else {
      var result = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      await Supabase.instance.client.from('profiles').insert({
        "fullname": full_name,
        "id_user": result.user!.id,
        'phone': phone_number,
        'avatar': ''
      });
      onResponse(result);
    }
  } on AuthException catch (e) {
    onError(e.message);
  }
}

Future<void> signIn(
    {required String email,
    required String password,
    required Function onResponse,
    required Function onError}) async {
  try{
    var result = await Supabase.instance.client.auth.signInWithPassword(
      password: password,
      email: email
    );
    onResponse(result);
  } on AuthException catch(e){
    onError(e.message);
  }
}