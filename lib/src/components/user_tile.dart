import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

ListTile userTile(AsyncSnapshot<List<dynamic>> snapshot, int index) {
  return ListTile(
    leading: const CircleAvatar(child: Icon(Icons.person)),
    title: Text(snapshot.data![index]['nome']),
    subtitle: Text(
      snapshot.data![index]['email'],
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 10,
      ),
    ),
    trailing: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    ),
  );
}
