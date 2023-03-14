import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFild extends StatefulWidget {
  final TextEditingController? textController;
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter> inputFormatters;

  CustomTextFild({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    required this.inputFormatters,
    this.textController,
  });

  @override
  State<CustomTextFild> createState() => _CustomTextFildState();
}

class _CustomTextFildState extends State<CustomTextFild> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.textController,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off))
              : null,
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
