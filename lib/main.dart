import 'package:flutter/material.dart';

import 'counter.dart';
import 'objectbox.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  Store? store;
  Box<Counter>? counterBox;
  List<Counter> counters = [];

  Future<void> _initStore() async {
    store = await openStore();
    counterBox = store?.box<Counter>();
    _fetchCounters();
  }

  void _fetchCounters() {
    counters = counterBox?.getAll() ?? [];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('カウンター')),
      body: ListView.builder(
        itemCount: counters.length,
        itemBuilder: (context, index) {
          final counter = counters[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    counter.title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Text('${counter.count}', style: const TextStyle(fontSize: 16)),
                IconButton(
                  onPressed: () {
                    counter.count++;
                    counterBox?.put(counter);
                    _fetchCounters();
                  },
                  icon: const Icon(Icons.plus_one),
                ),
                IconButton(
                  onPressed: () {
                    counterBox?.remove(counter.id);
                    _fetchCounters();
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newCounter = await Navigator.of(context).push<Counter>(
            MaterialPageRoute(
              builder: (context) {
                return const AddCounterPage();
              },
            ),
          );
          if (newCounter != null) {
            counterBox?.put(newCounter);
            _fetchCounters();
          }
        },
      ),
    );
  }
}

class AddCounterPage extends StatefulWidget {
  const AddCounterPage({super.key});

  @override
  State<AddCounterPage> createState() => _AddCounterPageState();
}

class _AddCounterPageState extends State<AddCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('カウンター追加')),
      body: TextFormField(
        onFieldSubmitted: (text) {
          final counter = Counter(title: text, count: 0);
          Navigator.of(context).pop(counter);
        },
      ),
    );
  }
}
