import 'package:flutter/material.dart';

void main() {
  runApp(const Timer());
}

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Timer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 183, 58, 85)),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'My First Flutter Journey'),

        /// Define the app routes
        initialRoute: '/',
        routes: {
          '/list': (context) => const ListPage(title: ""),
        });
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});
  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _ListPageState extends State<ListPage> {
  void _addNewItem() => setState(() {
        items.add(const BodyItem(title: "Hi", body: "is Me", age: "20"));
      });

  List<BodyItem> items = List<BodyItem>.generate(4,
      (index) => const BodyItem(title: "Hi", body: "This is testing", age: ""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return BodyItem(
                title: item.title,
                body: item.body,
                age: item.age,
              );
            },
          ),
          TextButton(
            onPressed: _addNewItem,
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}

class BodyItem extends StatelessWidget {
  final String title;
  final String body;
  final String age;

  const BodyItem(
      {super.key, required this.title, required this.body, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(body),
          Text(age)
        ],
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _decreaseCounter() => setState(() {
        _counter--;
      });

  void _incrementCounter() => setState(() {
        _counter++;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
                onPressed: _decreaseCounter, child: const Text("Decrease")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
                child: const Text("List")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
