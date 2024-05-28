import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  //const UserProductItem({ Key? key }) : super(key: key);
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(246, 246, 246, 1),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl, scale: 2),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: FittedBox(
              //width: 50,
              child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
                color: Colors.redAccent,
              )
            ],
          )),
        ),
      ),
    );
  }
}
