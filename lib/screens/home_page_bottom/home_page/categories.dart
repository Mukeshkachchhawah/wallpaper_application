import 'package:flutter/material.dart';

import '../../wallpaper_home/categor_wallpaper.dart';
import '../../../image_List/image_list.dart';

class Categories extends StatelessWidget {
  var data = Constants.result;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
       return SizedBox(
      height: 750,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 16 / 9),
        itemCount: data.length,
        itemBuilder: (context, index) {
         
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categori_Wallpaper(
                   
                    query: data[index]['name'],
                       ),
                  ));
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${data[index]["img"]}"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("${data[index]["name"]}", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ),
          );
        },
      ),
    );
  }
}
