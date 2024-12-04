import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text("Thong tin quoc gia"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ten quoc gia: "),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: ctrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: ctrl.text);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [Icon(Icons.search), Text("Tim kiem")],
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
