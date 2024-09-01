import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  final String BtnTitle;
  final String BtnDesc;

  const MenuButton({super.key, required this.BtnTitle, required this.BtnDesc});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 26),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          BtnTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jost(
                            color: Color(0xFFE9FC50),
                            fontSize: 18,
                            height: 0.4,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.32,
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            BtnDesc,
                            style: GoogleFonts.jost(
                              color: Color(0xFFE9FC50),
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Container(
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFFE9FC50),
                  ),
                )
              ],
            ),
          )),
    );
  }
}


// Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 26),
//         decoration: ShapeDecoration(
//           color: Color(0xFF0404B2),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(13),
//           ),
//         ),
//         child: ElevatedButton(
//           onPressed: () {},
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Container(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         BtnTitle,
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.jost(
//                           color: Color(0xFFE9FC50),
//                           fontSize: 18,
//                           height: 0.4,
//                           fontWeight: FontWeight.w400,
//                           letterSpacing: 0.32,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         child: Text(
//                           BtnDesc,
//                           style: GoogleFonts.jost(
//                             color: Color(0xFFE9FC50),
//                             fontSize: 12,
//                             height: 1.5,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 50),
//               Container(
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   color: Color(0xFFE9FC50),
//                 ),
//               )
//             ],
//           ),
//         ));