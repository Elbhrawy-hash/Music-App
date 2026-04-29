import 'package:flutter/material.dart';
import 'package:music_app/core/resource/font_manger.dart';

class CoustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;

  const CoustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      onChanged: onChanged,

      textInputAction: TextInputAction.search,

      onSubmitted: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      style: const TextStyle(
        color: Colors.white,
        fontFamily: FontManger.fontOrbitron,
        fontSize: 12,
      ),

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),

        filled: true,
        fillColor: const Color(0xffB1AFE9),

        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),

        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  controller.clear();

                  onChanged?.call("");

                  FocusManager.instance.primaryFocus?.unfocus();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            : null,

        hintText: "Search Song",

        hintStyle: const TextStyle(
          fontFamily: FontManger.fontOrbitron,
          color: Colors.white,
          fontSize: 12,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}