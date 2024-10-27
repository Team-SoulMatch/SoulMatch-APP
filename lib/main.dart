import 'package:flutter/material.dart';
import 'pages/entrypoint.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => const Entrypoint()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: MediaQuery(
        data: MediaQuery.of(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: SizedBox(
            height : MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 300,
                  height: 300
                ),
                SizedBox(height: screenHeight*0.0625)
              ]
            )
          )
        ))
      )
    );
  }
}