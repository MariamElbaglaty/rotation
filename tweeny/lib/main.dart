import 'package:flutter/material.dart';
import 'second.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Home(),
    );
  }}
  class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin
{
   
   late final AnimationController? control;
  Animation<double>? animation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     control=AnimationController(

      duration: Duration(seconds: 3),
      
      vsync: this)..repeat();
      //animation=CurvedAnimation(parent: control, curve: )
  

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    control!.dispose();

  }

  
  @override
  Widget build(BuildContext context) {
    return 
        Center(
          child: TweenAnimationBuilder<double>(
            onEnd: () {
              Future.delayed(Duration(seconds: 10));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Second()));
            },
            tween: Tween<double>(begin: 0, end: 200),
            duration: const Duration(seconds:20),
            builder: (BuildContext context, double s, child) {
              return  
                 RotationTransition(
                  turns: control!,
                  child: FlutterLogo(
                    size: s,
                             ),
                  );
              
                }),
        
    
    );
  
    
}
}