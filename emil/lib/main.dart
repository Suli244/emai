import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Ho(),
    );
  }

}

class Ho extends StatefulWidget {
  const Ho({
    Key? key,

  }) : super(key: key);

  @override
  State<Ho> createState() => _HoState();
}

class _HoState extends State<Ho> {
      TextEditingController controllerToName = TextEditingController();
  TextEditingController controllerFromName = TextEditingController();
  TextEditingController controllerMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: controllerToName,
                decoration: const InputDecoration(
                  hintText: 'To Name',
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: controllerFromName,
                decoration: const InputDecoration(
                  hintText: 'From Name',
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: controllerMessage,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'message',
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                  onPressed: sendMessage,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  child: const Text('Send'),
                ),
              ),
            ],
          ),
        );
      },
      ),
    ); 
  }
    void sendMessage() async {
    final dio = Dio();
    final response =
        await dio.post('https://api.emailjs.com/api/v1.0/email/send', data: {
      "service_id": "service_n04zh74",
      "template_id": "template_od2u54i",
      "user_id": "Pr-QyPJ4-g8wt8bDs",
      "accessToken": "3foQLhddJfoUOkFpqYuPx",
      "template_params": {
        "to_name": controllerToName.text,
        "from_name": controllerFromName.text,
        "message": controllerMessage.text
      }
    });
    if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
          content: Text(
            'asdf',
          ),
        ),
      );
    } else if (response.statusCode! >= 200) {
      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
          content: Text(
            'asdasdfasf',
          ),
        ),
      );
    }
  }
}
