import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class new_text extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  const new_text({Key? key,required this.text,this.color,this.size}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(
      text,style: GoogleFonts.ptSans(
        color: color,
        fontSize: size,
      )
    );
  }
}