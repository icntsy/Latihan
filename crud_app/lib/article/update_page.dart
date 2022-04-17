import 'package:crud_app/article/article_controller.dart';
import 'package:crud_app/article/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UpdatePage extends StatelessWidget {
  final controller = Get.find<ArticleController>();

  final Article article;

  UpdatePage(this.article);

  @override
  Widget build(BuildContext context) {
    controller.titleCont.text = article.title!;
    controller.contentCont.text = article.content!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Article'),
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
                controller.updateArticle(article.id!.toInt());
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}