import 'package:care/utils/color.dart';
import 'package:flutter/material.dart';

class BtnTxtWidget extends StatefulWidget {
  final String? text;
  final Widget? icon;
  final TextInputType? keyboardType;
  final VoidCallback? onPressed;
  final bool isLoading; // Tambahkan parameter isLoading
  final ValueChanged<String>? onChanged; // Tambahkan parameter onChanged

  const BtnTxtWidget({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.isLoading = false, // Default value for isLoading
    this.onChanged,
    this.keyboardType,
  });

  @override
  _BtnTxtWidgetState createState() => _BtnTxtWidgetState();
}

class _BtnTxtWidgetState extends State<BtnTxtWidget> {
  late ValueNotifier<bool> _isEnabledNotifier;

  @override
  void initState() {
    super.initState();
    _isEnabledNotifier = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _isEnabledNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: deviceHeight * 0.05,
      width: deviceWidth * 0.9,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isEnabledNotifier,
        builder: (context, isEnabled, child) {
          return ElevatedButton(
            onPressed: !widget.isLoading && isEnabled ? widget.onPressed : null,
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              backgroundColor:
                  !widget.isLoading && isEnabled ? buttonColor : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Center(
              child: widget.isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : _buildButtonContent(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.icon != null && widget.text != null) {
      // Icon + Text
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon!,
          const SizedBox(width: 8.0),
          Text(
            widget.text!,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );
    } else if (widget.icon != null) {
      // Only Icon
      return widget.icon!;
    } else if (widget.text != null) {
      // Only Text
      return Text(
        widget.text!,
        style: const TextStyle(color: Colors.white),
      );
    } else {
      // Neither icon nor text
      return const SizedBox.shrink();
    }
  }
}
