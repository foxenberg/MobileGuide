import 'package:flutter/material.dart';
import 'package:mobile_guid/widgets/customClipper.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(        
          children: <Widget>[
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
               color: Colors.pink,
                ),
              ),
              InkWell(
                onTap: () {},
                              child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/images/routes.png")),
              ),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.green,)
                ),
                InkWell(
                  onTap: (){},
                                  child: Container(
                    margin: EdgeInsets.all(5),
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/routes.png"),
                  ),
                )
              
          ],
          
      ),
    );
  }
}


