import 'package:cubit_exmp/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class SecondPage extends StatelessWidget {
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit'),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                 border: OutlineInputBorder()),
              controller: titleController,
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()),
              controller: descController,
            ),
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
                onPressed: () {
                  var title = titleController.text.toString();
                  var desc = descController.text.toString();
                  if (title != "" && desc != "") ;
                  context.read<CounterCubit>().addData({
                    'title': title,
                    'desc': desc,
                  });
                },
                child: Text('Add')),
          ],
        ),
      ),
    );
  }
}
