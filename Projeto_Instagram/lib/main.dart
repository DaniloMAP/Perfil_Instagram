import 'package:flutter/material.dart';
import 'package:projeto_instagram/widgets/load_button.dart';
import 'package:projeto_instagram/bloc/profile_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Profile',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Instagram'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<ProfileData>(
                stream: profileBloc.profileData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var flutterInsta = snapshot.data!.flutterInsta;
                    return Column(
                      children: [
                        SizedBox(height: 24),
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
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        SizedBox(height: 24),
                        Text(
                          'Erro: ${snapshot.error}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: 24),
                        Text(
                          'Pesquisar perfil',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              LoadButton(),
            ],
          ),
        ),
      ),
    );
  }
}
