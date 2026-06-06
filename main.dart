import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const IWApp());
}

class IWApp extends StatelessWidget {
  const IWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IW Frutas y Verduras',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),
      ),
      home: const SplashScreen(),
    );
  }
}

//================ SPLASH =================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1;
      });
    });

   Timer(const Duration(seconds: 3), () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  color: Color(0xFFC8E6C9),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'IW',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'IW Frutas y Verduras',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//================ DATOS =================

class Producto {
  final String emoji;
  final String nombre;
  final double precio;

  Producto({
    required this.emoji,
    required this.nombre,
    required this.precio,
  });
}

List<Producto> carrito = [];
//================ LOGIN =================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC8E6C9),
        title: const Text("Inicio de Sesión"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFF8BBD0),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "IW",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Bienvenido",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: usuarioController,
              decoration: InputDecoration(
                labelText: "Usuario",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
  if (usuarioController.text == "ingrit" &&
      passwordController.text == "1234") {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Usuario o contraseña incorrectos",
        ),
      ),
    );
                  }
                },
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//================ MAIN =================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const CatalogoScreen(),
      const CarritoScreen(),
      const InfoScreen(),
    ];

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Catálogo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Carrito",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Info",
          ),
        ],
      ),
    );
  }
}

//================ CATALOGO =================

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Producto> frutas = [
    Producto(emoji: "🍎", nombre: "Manzana", precio: 25),
    Producto(emoji: "🍌", nombre: "Plátano", precio: 18),
    Producto(emoji: "🍊", nombre: "Naranja", precio: 22),
    Producto(emoji: "🍇", nombre: "Uva", precio: 40),
    Producto(emoji: "🍓", nombre: "Fresa", precio: 35),
  ];

  final List<Producto> verduras = [
    Producto(emoji: "🍅", nombre: "Tomate", precio: 20),
    Producto(emoji: "🥕", nombre: "Zanahoria", precio: 15),
    Producto(emoji: "🥬", nombre: "Lechuga", precio: 12),
    Producto(emoji: "🧅", nombre: "Cebolla", precio: 18),
    Producto(emoji: "🥒", nombre: "Pepino", precio: 16),
  ];

  String busqueda = "";

  @override
  Widget build(BuildContext context) {
    List<Producto> frutasFiltradas = frutas.where((p) {
      return p.nombre.toLowerCase().contains(busqueda.toLowerCase());
    }).toList();

    List<Producto> verdurasFiltradas = verduras.where((p) {
      return p.nombre.toLowerCase().contains(busqueda.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC8E6C9),
        title: const Text("Catálogo"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Buscar producto...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  busqueda = value;
                });
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "🍎 FRUTAS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ...frutasFiltradas.map(
            (producto) => ProductoCard(
              producto: producto,
              onAgregar: () {
                setState(() {
                  carrito.add(producto);
                });
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "🥕 VERDURAS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ...verdurasFiltradas.map(
            (producto) => ProductoCard(
              producto: producto,
              onAgregar: () {
                setState(() {
                  carrito.add(producto);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

//================ TARJETA =================

class ProductoCard extends StatelessWidget {
  final Producto producto;
  final VoidCallback onAgregar;

  const ProductoCard({
    super.key,
    required this.producto,
    required this.onAgregar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF8BBD0),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Text(
          producto.emoji,
          style: const TextStyle(fontSize: 35),
        ),
        title: Text(producto.nombre),
        subtitle: Text("\$${producto.precio}"),
        trailing: ElevatedButton(
          onPressed: onAgregar,
          child: const Text("Agregar"),
        ),
      ),
    );
  }
}

//================ CARRITO =================

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var producto in carrito) {
      total += producto.precio;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC8E6C9),
        title: const Text("Carrito"),
      ),
      body: carrito.isEmpty
          ? const Center(
              child: Text(
                "No hay productos en el carrito",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carrito.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          carrito[index].emoji,
                          style: const TextStyle(fontSize: 30),
                        ),
                        title: Text(carrito[index].nombre),
                        subtitle:
                            Text("\$${carrito[index].precio.toStringAsFixed(0)}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              carrito.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                
                                  Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${total.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.shopping_bag),
                          label: const Text(
                            "Finalizar Compra",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Compra realizada"),
                                content: Text(
                                  "Gracias por tu compra.\n\nTotal pagado: \$${total.toStringAsFixed(0)}",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        carrito.clear();
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: const Text("Aceptar"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
//================ INFO =================

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8E6C9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC8E6C9),
        title: const Text("Información"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "IW Frutas y Verduras",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("📍 Dirección: Calle Principal #123"),
            SizedBox(height: 10),
            Text("📞 Teléfono: 899-123-4567"),
            SizedBox(height: 10),
            Text("🕒 Horario: 8:00 AM - 8:00 PM"),
            SizedBox(height: 20),
            Text("¡Gracias por visitarnos!"),
          ],
        ),
      ),
    );
  }
}
