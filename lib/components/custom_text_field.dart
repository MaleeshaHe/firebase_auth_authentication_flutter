import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final bool isPassword;
  final String lable;
  final IconData prefixIcon;
  bool isObscure = false;
  TextInputType inputType;

  CustomTextField({
    required this.lable,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: SizedBox(
        height: 52,
        child: TextField(
          keyboardType: widget.inputType,
          controller: widget.controller,
          obscureText: widget.isPassword == true
              ? widget.isObscure == false
              : widget.isObscure == true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            label: Text(widget.lable),
            prefixIcon: Icon(
              widget.prefixIcon,
              size: 21,
            ),
            suffixIcon: widget.isPassword == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isObscure = !widget.isObscure;
                      });
                    },
                    child: Icon(
                      widget.isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
