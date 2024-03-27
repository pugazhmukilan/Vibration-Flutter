import 'package:flutter/material.dart';

class Codeinfo extends StatefulWidget {
   Codeinfo({super.key,required this.Code});
  String Code;

  @override
  State<Codeinfo> createState() => _CodeinfoState(Code:Code);
}

class _CodeinfoState extends State<Codeinfo>{
  String Code;
  _CodeinfoState({required this.Code});
    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color:Colors.black,width:2,),
      borderRadius: BorderRadius.circular(30),
      color:Colors.transparent),
      child:Text(Code),
    );
  }
}