import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/theme_provider.dart';
import 'package:to_do/shared/styles/colors.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Card(
      color: provider.mode == ThemeMode.light
          ? Colors.white
          : MyColors.bottomAppBarDark,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: MyColors.appBarColor, width: 5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Play Basketball",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: MyColors.appBarColor,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: MyColors.lighterBlack,
                        ),
                        Text("10:30 AM",
                            style: Theme.of(context).textTheme.bodySmall)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: MyColors.appBarColor,
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(right: 16),
                    padding:
                    EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
