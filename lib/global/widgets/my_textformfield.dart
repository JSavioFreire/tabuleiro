import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabuleiro/provider/auth/auth_provider.dart';

class MyTextFormField extends StatelessWidget {
  final Icon icon;
  final String hint;
  final TextInputType keyboard;
  final TextEditingController controller;
  final Color? color;
  final dynamic validator;
  const MyTextFormField(
      {super.key,
      this.color,
      required this.validator,
      required this.icon,
      required this.hint,
      required this.controller,
      required this.keyboard});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
          style: const TextStyle(color: Colors.white),
          validator: validator,
          controller: controller,
          obscureText: keyboard == TextInputType.visiblePassword
              ? authProvider.iconVisibility
                  ? true
                  : false
              : false,
          keyboardType: keyboard,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: color ?? Colors.black54,
              iconColor: Colors.white,
              prefixIconColor: Colors.white,
              suffixIconColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.white),
              hintText: hint,
              prefixIcon: icon,
              suffixIcon: keyboard == TextInputType.visiblePassword
                  ? IconButton(
                      icon: authProvider.iconVisibility
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        authProvider.changeToVisibility();
                      },
                    )
                  : null,
              border: const UnderlineInputBorder())),
    );
  }
}
