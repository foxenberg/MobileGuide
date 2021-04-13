import 'package:flutter/material.dart';
import 'package:mobile_guid/screens/placesScreen.dart';
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
                
                child: InkWell(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesScreen()));
                    print("fdsfsd");
                  }),
               color: Colors.pink,
                ),
                
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/images/routes.png")),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.green,)
                ),
                InkWell(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesScreen()));
                  },
                                  child: Container(
                    margin: EdgeInsets.all(5),
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/routes.png"),
                  
                  ),
                  
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 100, bottom: 100),
                  child: ElevatedButton(
                    
                    child: Text("Routes"),
                    
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesScreen()));
                  },
                  ),
                ),
          ],
          
      ),
    );
  }
}


