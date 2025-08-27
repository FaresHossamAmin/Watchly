import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchly/core/utils/extensions.dart';

class SeeMoreComponent extends StatelessWidget {
  final String text;
  final Function() seeMore;
  const SeeMoreComponent({
    super.key,
    required this.text,
    required this.seeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: () {
              seeMore();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('See More'),
                  5.sbw,
                  Icon(Icons.arrow_forward_ios, size: 12.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
