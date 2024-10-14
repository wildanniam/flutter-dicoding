import 'package:flutter/material.dart';

class BelajarFlutter extends StatefulWidget {
  const BelajarFlutter({super.key});

  @override
  State<BelajarFlutter> createState() => _BelajarFlutterState();
}

class _BelajarFlutterState extends State<BelajarFlutter> {
  String? language;
  String _name = "";
  TextEditingController _controller = TextEditingController();
  bool isLigthOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          // Container(
          //     margin: EdgeInsets.all(20),
          //     child: DropdownButton(
          //         items: const [
          //           DropdownMenuItem(
          //             child: Text("Dart"),
          //             value: "Dart",
          //           ),
          //           DropdownMenuItem(child: Text("Swift"), value: "Swift"),
          //           DropdownMenuItem(child: Text("Kotlin"), value: "Kotlin"),
          //         ],
          //         hint: const Text("Select your language"),
          //         value: language,
          //         onChanged: (String? value) {
          //           setState(() {
          //             language = value;
          //           });
          //         })),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Input your name",
                  labelText: "Name",
                  icon: Icon(Icons.people)),
              onSubmitted: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                            "Hello ${_controller.text}, you are $language Developer"),
                      );
                    });
                setState(() {
                  showSnackBar(context,
                      "Hello ${_controller.text}, you are $language Developer");
                });
              },
              child: Text("Submit")),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Switch(
                value: isLigthOn,
                onChanged: (bool? value) {
                  setState(() {
                    isLigthOn = value!;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Light is ${isLigthOn ? "On" : "Off"}"),
                    duration: Duration(seconds: 1),
                  ));
                }),
          ),
          ListTile(
            leading: Radio(
                value: "Dart",
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackBar(context, "$language selected");
                  });
                }),
            title: Text("Dart"),
          ),
          ListTile(
            leading: Radio(
                value: "kotlin",
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackBar(context, "$language selected");
                  });
                }),
            title: Text("kotlin"),
          ),
          ListTile(
            leading: Radio(
                value: "swift",
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackBar(context, "$language selected");
                  });
                }),
            title: Text("swift"),
          ),
        ],
      ),
    );
  }
}

class BelajarFont extends StatelessWidget {
  const BelajarFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Font"),
      ),
      body: Center(
        child: Text("Custom Font",
            style: TextStyle(
              fontFamily: "Oswald",
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  ));
}
