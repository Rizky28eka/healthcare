import 'package:care/utils/color.dart';
import 'package:flutter/material.dart';

class TxtFieldWidget extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? cursorColor;

  const TxtFieldWidget({
    super.key,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.cursorColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TxtFieldWidgetState createState() => _TxtFieldWidgetState();
}

class _TxtFieldWidgetState extends State<TxtFieldWidget> {
  late bool _obscureText;
  late double _screenWidth;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _screenWidth * 0.9,
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        style: TextStyle(
          color: widget.textColor ?? Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: _screenWidth * 0.03,
        ),
        cursorColor: widget.cursorColor ?? Colors.grey,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor ?? Colors.grey,
            fontSize: _screenWidth * 0.03,
          ),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: Colors.grey, size: _screenWidth * 0.06)
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.withOpacity(0.7),
                    size: _screenWidth * 0.06,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.borderColor ?? fourthColor,
              width: 2.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: _screenWidth * 0.03,
            horizontal: _screenWidth * 0.04,
          ),
        ),
      ),
    );
  }
}
