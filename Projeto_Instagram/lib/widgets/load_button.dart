import 'package:flutter/material.dart';
import 'package:projeto_instagram/bloc/profile_bloc.dart';

class LoadButton extends StatefulWidget {
  @override
  _LoadButtonState createState() => _LoadButtonState();
}

class _LoadButtonState extends State<LoadButton> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _usernameController,
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
            profileBloc.fetchProfileData(_usernameController.text);
          },
          child: Text('Carregar Perfil'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Define a cor de fundo do botão
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
}
