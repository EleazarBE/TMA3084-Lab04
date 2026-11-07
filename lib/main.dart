import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  static const String menuRoute = '/menu';
  static const String vegetableRoute = '/vegetable';
  static const String cheeseRoute = '/cheese';
  static const String friesRoute = '/fries';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Store',
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      initialRoute: menuRoute,
      routes: {
        menuRoute: (context) => const MenuScreen(),
        vegetableRoute: (context) => const DetailScreen(
          itemName: 'Vegetable Pizza',
          imagePath: 'assets/images/vegetable_pizza.png',
          description:
              'A delicious pizza topped with fresh vegetables, '
              'mushrooms, olives, capsicum and melted cheese.',
        ),
        cheeseRoute: (context) => const DetailScreen(
          itemName: 'Cheese Pizza',
          imagePath: 'assets/images/cheese_pizza.png',
          description:
              'A classic cheese pizza loaded with rich tomato sauce '
              'and delicious melted mozzarella cheese.',
        ),
        friesRoute: (context) => const DetailScreen(
          itemName: 'Box of Fries',
          imagePath: 'assets/images/fries.png',
          description:
              'Golden and crispy French fries, freshly prepared '
              'and served in a convenient takeaway box.',
        ),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pizza Store Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Choose Your Favourite!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildMenuCard(
            context,
            'Vegetable Pizza',
            'Fresh and delicious vegetable toppings',
            'assets/images/vegetable_pizza.png',
            PizzaStoreApp.vegetableRoute,
          ),
          _buildMenuCard(
            context,
            'Cheese Pizza',
            'Classic pizza with extra cheese',
            'assets/images/cheese_pizza.png',
            PizzaStoreApp.cheeseRoute,
          ),
          _buildMenuCard(
            context,
            'Box of Fries',
            'Golden and crispy French fries',
            'assets/images/fries.png',
            PizzaStoreApp.friesRoute,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String name,
    String description,
    String imagePath,
    String route,
  ) {
    return Card(
      color: Colors.orange,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 105,
                  height: 105,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tap to view details →',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final String description;

  const DetailScreen({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 260,
                width: double.infinity,
                color: Colors.white,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              itemName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Menu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
