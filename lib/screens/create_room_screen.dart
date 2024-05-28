import 'package:flutter/material.dart';
import 'package:typeracer/utils/socket_methods.dart';
import 'package:typeracer/widgets/custom_button.dart';
import 'package:typeracer/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  // final SocketClient _socketClient = SocketClient.instance;
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateGameListener(context);
    _socketMethods.notCorrectGameListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }

  // void testing() {
  //   if (_socketClient.socket!.connected) {
  //     print('Socket is connected');
  //     _socketClient.socket!.emit('test', 'This is working!');
  //   } else {
  //     print('Socket is not connected');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Create Room',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextfield(
                    controller: _nameController,
                    hintText: 'Enter your nickname'),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'Create',
                  ontap: () => _socketMethods.createGame(_nameController.text),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
