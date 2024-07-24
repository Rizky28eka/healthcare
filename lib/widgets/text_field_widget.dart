import 'package:flutter/material.dart';

// Widget untuk TextFormField dengan validator
class TxtFieldWidget extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? cursorColor;
  final ValueChanged<String>? onChanged;
  final bool?
      obscureText; // Parameter opsional untuk mengatur apakah teks harus disembunyikan
  final String? Function(String?)? validator; // Fungsi validator

  const TxtFieldWidget({
    super.key,
    this.hintText,
    this.icon,
    this.controller,
    this.keyboardType,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.cursorColor,
    this.onChanged,
    this.obscureText = false, // Default ke false jika tidak disediakan
    this.validator, // Validator opsional
  });

  @override
  _TxtFieldWidgetState createState() => _TxtFieldWidgetState();
}

class _TxtFieldWidgetState extends State<TxtFieldWidget> {
  bool _obscureText = false; // State untuk obscureText

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.obscureText ?? false; // Mengatur nilai awal dari _obscureText
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _screenWidth * 0.9,
      child: TextFormField(
        controller: widget.controller,
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
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.withOpacity(0.7),
                    size: _screenWidth * 0.06,
                  ),
                  onPressed: _toggleObscureText,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: 2.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: _screenWidth * 0.03,
            horizontal: _screenWidth * 0.04,
          ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator, // Menggunakan validator dari parameter
      ),
    );
  }
}
