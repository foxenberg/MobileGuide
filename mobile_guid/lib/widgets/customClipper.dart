import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    
    
    path.close();
    return path;
  }

  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    
    

    path.close();
    return path;
  }

  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}