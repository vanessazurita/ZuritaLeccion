import 'package:flutter/material.dart';
import '../logica/punto.dart';

class PagePunto extends StatefulWidget {
  const PagePunto({super.key});

  @override
  State<StatefulWidget> createState() => PagePuntoState();
}

class PagePuntoState extends State<PagePunto> {
  final TextEditingController _x1Controller = TextEditingController();
  final TextEditingController _y1Controller = TextEditingController();
  final TextEditingController _x2Controller = TextEditingController();
  final TextEditingController _y2Controller = TextEditingController();

  String _resultado = '';
  final Punto _punto = Punto();

  void _calcularDistancia() {
    final x1 = double.tryParse(_x1Controller.text);
    final y1 = double.tryParse(_y1Controller.text);
    final x2 = double.tryParse(_x2Controller.text);
    final y2 = double.tryParse(_y2Controller.text);

    if (x1 == null || y1 == null || x2 == null || y2 == null) {
      setState(() {
        _resultado = 'Ingrese números válidos.';
      });
    } else {
      final distancia = _punto.calcularDistancia(x1, y1, x2, y2);
      setState(() {
        _resultado =
            'La distancia entre A($x1, $y1) y B($x2, $y2) es: ${distancia.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de distancia entre dos puntos'),
        backgroundColor: const Color.fromARGB(255, 198, 166, 255),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Ingresa las coordenadas de dos puntos en el plano cartesiano:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 189, 165, 230),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _x1Controller,
                decoration: InputDecoration(
                  labelText: 'Coordenada x1',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 194, 163, 247)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 194, 163, 247)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 194, 163, 247)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _y1Controller,
                decoration: InputDecoration(
                  labelText: 'Coordenada y1',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 246, 145, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 246, 145, 241)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 246, 145, 241)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _x2Controller,
                decoration: InputDecoration(
                  labelText: 'Coordenada x2',
                  labelStyle: const TextStyle(color: Colors.deepPurple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _y2Controller,
                decoration: InputDecoration(
                  labelText: 'Coordenada y2',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 250, 152, 238)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 250, 152, 238)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 250, 122, 238)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calcularDistancia,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 188, 169, 239),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5, // Sombra del botón
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calculate, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Calcular Distancia',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Text(
                  _resultado,
                  style:
                      const TextStyle(fontSize: 18, color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
