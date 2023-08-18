import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Profile',
      theme: ThemeData(
        primaryColor: Colors.white, // Define a cor de fundo principal
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterInsta flutterInsta = FlutterInsta();
  bool profileLoaded = false;
  String username = "";

  Future<void> loadProfileData() async {
    try {
      await flutterInsta.getProfileData(username);

      setState(() {
        profileLoaded = true;
      });
    } catch (e) {
      print("Error loading profile data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Instagram'),
        backgroundColor: Colors.white, // Define a cor de fundo da AppBar
        iconTheme: IconThemeData(
            color: Colors.black), // Define a cor do ícone da AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (profileLoaded)
                Column(
                  children: [
                    SizedBox(height: 24), // Espaço entre a imagem e o topo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Image.network(
                        flutterInsta.imgurl,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      flutterInsta.username,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${flutterInsta.followers} Followers'),
                        SizedBox(width: 16),
                        Text('${flutterInsta.following} Following'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      flutterInsta.bio,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Pesquisar',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  loadProfileData();
                },
                child: Text('Carregar Perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Define a cor de fundo do botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
