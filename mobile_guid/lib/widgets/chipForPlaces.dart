import 'package:flutter/material.dart';

Widget chipForPlace(String label, Color color){
    return Chip(labelPadding: EdgeInsets.all(8.0),
    
    avatar: CircleAvatar(
      backgroundColor: Colors.deepPurple[200],
      child: Text('O'),
    ),
    label: Text(label, style: TextStyle(
      color:Colors.white
        
      
    )
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey,
    padding: EdgeInsets.all(10.0),
    );
  }