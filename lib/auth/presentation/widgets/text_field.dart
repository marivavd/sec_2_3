
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Custom_Field_Text extends StatelessWidget{
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool is_obscure;
  final Function(String?) on_change;
  final Function()? onTapSuffix;
  final MaskTextInputFormatter? formatter;

  const Custom_Field_Text({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.on_change,
    this.is_obscure = false,
    this.onTapSuffix,
    this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
        style: Theme.of(context).textTheme.labelMedium,),
        const SizedBox(height: 8,),
        TextField(
          onChanged: on_change,
          inputFormatters: (formatter != null) ? [formatter!] : [],
          obscureText: is_obscure,
          obscuringCharacter: "*",
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  width: 4,
                  style: BorderStyle.none,
                  color: Color.fromARGB(255, 167, 167, 167)
              ),
            ),
            hintStyle: Theme.of(context).textTheme.labelMedium,
            suffixIcon: (onTapSuffix != null)
                ? GestureDetector(
              onTap: onTapSuffix,
              child: Image.asset("assets/eye-slash.png"),
            )
                : null,
          ),
        )
      ],
    );
  }
}