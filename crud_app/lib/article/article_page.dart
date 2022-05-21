// import 'package:crud_app/create_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_app/article/article_controller.dart';
import 'package:crud_app/article/create_page.dart';
import 'package:crud_app/article/update_page.dart';

class ArticlePage extends StatelessWidget {
  final controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Daftar Artikel')),
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.articleList.length, 
          separatorBuilder: (context, index) => Divider(), 
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.articleList[index].title.toString()),
              subtitle: Text(controller.articleList[index].content.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.to(UpdatePage(controller.articleList[index]));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.delete(controller.articleList[index].id!.toInt());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(CreatePage());
        },
      ),
    );
  }
}