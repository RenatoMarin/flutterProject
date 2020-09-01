import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de recados')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              'Hello',
              style: TextStyle(
                  color: Theme.of(context)
                      .primaryColor), //Se for trocado a cor primaria, será trocado a primaryColor também
            ),
            subtitle: Text('Editado em 21/2/2020'),
          );
        },
        itemCount: 30,
      ),
    );
  }
}
