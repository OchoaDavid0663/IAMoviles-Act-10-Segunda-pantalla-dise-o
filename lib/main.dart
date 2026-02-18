import 'package:flutter/material.dart';

void main() => runApp(const Similares());

class Similares extends StatelessWidget {
  const Similares({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Farmacia',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF021526),
        useMaterial3: true,
      ),
      home: const OpcionesInicio(),
    );
  }
}

class OpcionesInicio extends StatefulWidget {
  const OpcionesInicio({super.key});

  @override
  State<OpcionesInicio> createState() => _OpcionesInicioState();
}

class _OpcionesInicioState extends State<OpcionesInicio> {
  int _indiceActual = 2; 

  final List<Map<String, String>> productos = [
    {
      'nombre': 'Peluche Dr. Simi',
      'precio': '\$250.00',
      'desc': 'El icónico peluche coleccionable.',
      'img': 'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-10-Segunda-pantalla-dise-o/refs/heads/main/peluche.jpg'
    },
    {
      'nombre': 'Caja de Agrifen',
      'precio': '\$120.00',
      'desc': 'Caja decorativa grande para regalos.',
      'img': 'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-10-Segunda-pantalla-dise-o/refs/heads/main/caja2.jpg'
    },
    {
      'nombre': 'Caja de Agustifolia',
      'precio': '\$85.00',
      'desc': 'Pastillas de 70 gr.',
      'img': 'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-10-Segunda-pantalla-dise-o/refs/heads/main/caja1.jpg'
    },
    {
      'nombre': 'Calcetines Simi',
      'precio': '\$55.00',
      'desc': 'Calcetines cómodos diseño exclusivo.',
      'img': 'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-10-Segunda-pantalla-dise-o/refs/heads/main/calcetines.jpg'
    },
    {
      'nombre': 'Caja Kraft',
      'precio': '\$40.00',
      'desc': 'Caja de cartón resistente multiusos.',
      'img': 'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-10-Segunda-pantalla-dise-o/refs/heads/main/caja2.jpg'
    },
    {
      'nombre': 'Mini Peluche',
      'precio': '\$150.00',
      'desc': 'Versión pequeña para mochilas.',
      'img': 'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-10-Segunda-pantalla-dise-o/refs/heads/main/peluche.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  hintText: "Buscar...",
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white10,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  suffixIcon: const Icon(Icons.search, color: Colors.white, size: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(color: Color(0xFF5FFB7D)),
              child: const Center(
                child: Text(
                  "PRODUCTOS",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _botonCategoria("Medicamentos")),
                const SizedBox(width: 10),
                Expanded(child: _botonCategoria("Objetos")),
              ],
            ),
            const SizedBox(height: 25),

            // GRID AJUSTADO PARA SER MÁS PEQUEÑO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Agregamos margen para achicar cuadros
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25, 
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.85, // Al aumentar este número, el cuadro se hace más corto (pequeño)
                ),
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return _cardProducto(productos[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (index) => setState(() => _indiceActual = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF03346E),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.white38,
        selectedFontSize: 11,
        unselectedFontSize: 9,
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Empleados'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Productos'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Ventas'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config.'),
        ],
      ),
    );
  }

  Widget _botonCategoria(String titulo) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF03346E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(titulo, style: const TextStyle(fontSize: 12)),
      ),
    );
  }

  Widget _cardProducto(Map<String, String> data) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Imagen pequeña dentro del cuadro
              child: Center(
                child: Image.network(
                  data['img']!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            data['nombre']!,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data['precio']!,
            style: const TextStyle(color: Color(0xFF03346E), fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            data['desc']!,
            style: const TextStyle(color: Colors.black54, fontSize: 7.5),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}