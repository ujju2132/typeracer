import 'package:flutter/material.dart';
import 'package:typeracer/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create/Join a room to play!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      text: 'Create',
                      ontap: () => Navigator.pushNamed(context, '/create-room'),
                      isHome: true),
                  CustomButton(
                      text: 'Join',
                      ontap: () => Navigator.pushNamed(context, '/join-room'),
                      isHome: true)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
