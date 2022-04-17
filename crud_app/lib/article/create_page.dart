
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_app/article/article_controller.dart';
import 'package:http/http.dart' as http;

class CreatePage extends StatelessWidget {
  final controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller:controller.titleCont,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller:controller.contentCont,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Submit'), 
              onPressed: (){
                // print(controller.contentCont.text);

                // final response = http.post(Uri.parse('http://192.168.34.95:8000/api/article'), body: {
                //   'title': controller.titleCont.text,
                //   'content': controller.contentCont.text,
                // });

                
                controller.create();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}