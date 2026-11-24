
import 'package:flutter/material.dart';

void main() {
  runApp(const DZTaxi());
}

class DZTaxi extends StatelessWidget {
  const DZTaxi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DZ TAXI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDriver = false;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF673AB7),
        foregroundColor: Colors.white,
        title: const Text(
          'DZ TAXI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showMessage('Sazlamalar'),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hoş geldiňiz!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Daşoguz boýunça amatly taksi hyzmaty',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: modeButton('Müşderi', !isDriver, () {
                      setState(() => isDriver = false);
                    }),
                  ),
                  Expanded(
                    child: modeButton('Sürüji', isDriver, () {
                      setState(() => isDriver = true);
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Text(
              isDriver ? 'Sürüji paneli' : 'Nirä gitmek isleýärsiňiz?',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            inputField(
              fromController,
              'Nireden?',
              Icons.my_location,
            ),

            const SizedBox(height: 12),

            inputField(
              toController,
              'Nirä?',
              Icons.location_on,
            ),

            const SizedBox(height: 12),

            inputField(
              priceController,
              'Bahany teklip ediň (TMT)',
              Icons.payments,
              number: true,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF673AB7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  if (fromController.text.isEmpty ||
                      toController.text.isEmpty ||
                      priceController.text.isEmpty) {
                    showMessage('Ähli maglumatlary dolduryň');
                    return;
                  }

                  showMessage(
                    isDriver
                        ? 'Sargyt gözlenýär'
                        : 'Teklibiňiz ugradyldy',
                  );
                },
                child: Text(
                  isDriver ? 'Sargytlary gözle' : 'Taksi çagyr',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'DZ TAXI — Siziň ýoluňyz, siziň bahaňyz!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF673AB7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget modeButton(String title, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF673AB7)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool number = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType:
          number ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF673AB7)),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
