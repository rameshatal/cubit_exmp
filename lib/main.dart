import 'package:cubit_exmp/cubit/counter_state.dart';
import 'package:cubit_exmp/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit'),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child:
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return Center(
              child: Text(
                state.errorMsg,
                style: TextStyle(fontSize: 25),
              ),
            );
          } else {
            return state.arrData.isNotEmpty
                ? ListView.builder(
                    itemCount: state.arrData.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: Text('${index + 1}'),
                        title: Text('${state.arrData[index]['title']}'),
                        subtitle: Text('${state.arrData[index]['desc']}'),
                        trailing: InkWell(
                            onTap: () {
                              context.read<CounterCubit>().deleteData(index);
                              //BlocProvider.of<CounterCubit>(context).deleteData(index);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      );
                    })
                : Center(
                    child: Text('No Data Fuond!!'),
                  );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().addData({
            'title': "Hallo",
            'desc': "How are you",
          });

          /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ));*/
        },
        tooltip: 'Next Page',
        child: const Icon(Icons.add),
      ),
    );
  }
}
