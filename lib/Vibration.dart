import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:vibration/vibration.dart";
bool? is_vibrator_there = true;
bool? open = false;
class Vibration_Page extends StatefulWidget {
  Vibration_Page({super.key});

  @override
  State<Vibration_Page> createState() => _Vibration_PageState();
}

class _Vibration_PageState extends State<Vibration_Page> {
  

  @override
  void initState(){
    super.initState();
    vibrationcheck();
  }
  void vibrationcheck()async{
    return Vibration.hasVibrator().then((value) => is_vibrator_there=value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Vibration Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),),

      body: Center(child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Clipboard.setData((new ClipboardData(text: "the text is selected"))).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:Text("copied the text to clip borad"))));
              },
              child: Icon(Icons.copy_all_outlined),),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
              
                onTap:(){
                  //this will colse the code widget in 
                  open = false;
                  setState(() {
                    
                  });
                  // and only when the open is fasle and ther eis vibrator in the device the vibration will work
                  if (is_vibrator_there! & open!){
                    print("viobration avaiable in the device");
                      Vibration.vibrate(duration:1000);
                  }
                  
              
                },
                onLongPress: (){
                  //this is used to open the code the vibration 
                  open = true;
                  setState(() {
                    print(open);
                  });
                 
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:Colors.black,width:2)),
                  child: Padding(
                    padding:  EdgeInsets.all(3.0),
                    child: open!? 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(''' Vibration.vibrate(duration:1000);'''),
                        )
                       
                         : Text("vibe for 1000"),
                  ),
                ),
              ),
            ),
        
        
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
              
                onTap:(){
                
                  Vibration.vibrate(
                          pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                        );
              
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:Colors.black,width:2)),
                  child: Padding(
                    padding:  EdgeInsets.all(3.0),
                    child: Text("vibe for pattern"),
                  ),
                ),
              ),
            ),
        
            
        
        
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
              
                onTap:(){
                  Vibration.vibrate(
                          pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                          intensities: [0, 128, 0, 255, 0, 64, 0, 255],
                        );
              
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:Colors.black,width:2)),
                  child: Padding(
                    padding:  EdgeInsets.all(3.0),
                    child: Text("vibe with pattern and intensity"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
        
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
              
                onTap:(){
                  Vibration.cancel();
              
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:Colors.black,width:2)),
                  child: Padding(
                    padding:  EdgeInsets.all(3.0),
                    child: Text("vibe cancel"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),),

    );
  }
}
