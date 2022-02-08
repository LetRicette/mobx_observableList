import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  _dialog(){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma descrição..."
              ),
              onChanged: (valor){},
            ),
            actions: [
              TextButton(
                  onPressed: (){ Navigator.pop(context); },
                  child: Text("Cancelar", style: TextStyle(
                    color: Colors.red
                  ),)
              ),
              TextButton(
                  onPressed: (){},
                  child: Text("Salvar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefas",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, indice){
          return ListTile(
            title: Text("Título $indice"),
            onTap: (){

            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _dialog();
        },
      ),
    );
  }
}
