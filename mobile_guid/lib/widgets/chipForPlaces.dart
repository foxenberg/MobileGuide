import 'package:flutter/material.dart';

Widget chipForPlace(String label, Color color){
    return ActionChip(labelPadding: EdgeInsets.all(8.0),
    
    
    label: Text(label, style: TextStyle(
      color: Colors.white
        
      
    )
    ),
    onPressed: () {
      
    },
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey,
    padding: EdgeInsets.all(10.0),
    
    );
  }