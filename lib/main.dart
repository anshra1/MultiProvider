import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Number())], // provider
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<Number>(context).counter; // provider

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.forward,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SecondPage();
          }));
        },
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            child: Text(
              itemCount.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Provider.of<Number>(context, listen: false) // provider
                        .increaseCounter();
                  },
                  child: const Text('Add')),
              TextButton(
                  onPressed: () {
                    Provider.of<Number>(context, listen: false) // provider
                        .decreaseCounter();
                  },
                  child: const Text('Delete'))
            ],
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<Number>(context).counter;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            child: Text(
              '$itemCount',
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Provider.of<Number>(context, listen: false) // provider
                        .increaseCounter();
                  },
                  child: const Text('Add')),
              TextButton(
                  onPressed: () {
                    Provider.of<Number>(context).decreaseCounter(); // provider
                  },
                  child: const Text('Delete'))
            ],
          )
        ],
      ),
    );
  }
}

class Number extends ChangeNotifier {
  // provider // provider// provider// provider// provider
  int count = 0;

  int get counter {
    return count;
  }

  void increaseCounter() {
    count++;
    notifyListeners();
  }

  void decreaseCounter() {
    count--;
    notifyListeners();
  }
}
