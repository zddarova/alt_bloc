import 'package:alt_bloc/alt_bloc.dart';
import 'package:flutter/material.dart';

import 'counter_bloc.dart';


class CounterLayout extends StatelessWidget {

  CounterLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, num>(
                    builder: (_, status) {
                      return Text(
                        '${status ?? 0}',
                        style: Theme.of(context).textTheme.display1,
                      );
                    }),
              ],
            ),
          ),
          Center(
            child: BlocBuilder<CounterBloc, bool>(
              builder: (_, inProgress) {
                return inProgress ? CircularProgressIndicator() : Container();
              }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<CounterBloc>(context).increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
