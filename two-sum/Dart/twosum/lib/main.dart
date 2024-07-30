import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductMatcher());
  }
}

class ProductMatcher extends StatefulWidget {
  const ProductMatcher({super.key});

  @override
  State<ProductMatcher> createState() => _ProductMatcherState();
}

class _ProductMatcherState extends State<ProductMatcher> {
  List<Map<String, dynamic>> products = [
    {'title': 'Coffee Mug', 'price': 20},
    {'title': 'Notebook', 'price': 5},
    {'title': 'Wireless Mouse', 'price': 60},
    {'title': 'Bluetooth Headphones', 'price': 75},
    {'title': 'Sticky Notes', 'price': 10},
    {'title': 'Water Bottle', 'price': 25},
    {'title': 'Desk Lamp', 'price': 90},
  ];

  int target = 50;
  List<int> result = [];
  TextEditingController targetController = TextEditingController();
  @override
  void initState() {
    super.initState();
    targetController.text = target.toString();
  }

  List<int> twoSum(List<Map<String, dynamic>> items, int target) {
    Map<int, int> numMap = {};
    for (var i = 0; i < items.length; i++) {
      int price = items[i]['price'];
      int complement = target - price;
      if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }
      numMap[price] = i;
    }

    return [];
  }

  void findPairs() {
    int parsedTarget = int.tryParse(targetController.text) ?? 0;
    setState(() {
      target = parsedTarget;
      result = twoSum(products, parsedTarget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: targetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Enter your gift card value",
                  border: OutlineInputBorder()),
              onSubmitted: (_) => findPairs(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: findPairs,
                child: const Text("Find the matching products")),
            const SizedBox(
              height: 20,
            ),
            if (result.isEmpty)
              const Text("No matching products found")
            else
              Text(
                  "${products[result[0]]['title']} (\$${products[result[0]]['price']}) and ${products[result[1]]['title']} (\$${products[result[1]]['price']}) match your target of \$${target}."),
          ],
        ),
      ),
    );
  }
}
