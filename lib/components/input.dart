import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputComp extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool pass;

  const InputComp({
    Key? key,
    required this.label,
    this.placeholder = '',
    this.controller,
    this.obscureText = false,
    this.validator,
    this.pass = false, // Menggunakan pass sebagai input password
  }) : super(key: key);

  @override
  State<InputComp> createState() => _InputCompState();
}

class _InputCompState extends State<InputComp> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.pass;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            textAlign: TextAlign.left,
            style: GoogleFonts.jost(
              color: const Color(0xFF555555),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.28,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(width: 1, color: Color(0xFFB6B6B6)),
              ),
            ),
            child: TextFormField(
              validator: widget.validator ??
                  (value) {
                    if (value!.isEmpty) {
                      return "Field Harus Terisi";
                    }
                    return null;
                  },
              controller: widget.controller,
              obscureText: _isObscured,
              obscuringCharacter: "*",
              style: GoogleFonts.jost(
                color: const Color(0xFF333333),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.28,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: GoogleFonts.jost(
                  color: const Color(0xFF7E7E7E),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.28,
                ),
                border: InputBorder.none,
                suffixIcon: widget.pass
                    ? IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF7E7E7E),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
