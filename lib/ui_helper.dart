import 'package:flutter/material.dart';
class UiHelper {
  static customTextFeild(TextEditingController textEditingController,
      String text,bool toHigh){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: textEditingController,
        obscureText: toHigh,
        decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
  static customButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 320,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
