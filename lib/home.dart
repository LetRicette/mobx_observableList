import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_observablelist/controller.dart';
import 'package:mobx_observablelist/principal.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Controller();
  ReactionDisposer? reactionDisposer;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // autorun((_) {
    //   print(controller.formularioValidado);
    // });

    reactionDisposer =
        reaction((_) => controller.usuarioLogado, (bool usuarioLogado) {
      //enviaria o usuário para outra tela por aqui
      if (usuarioLogado) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Principal()));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    reactionDisposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(
                    controller.formularioValidado
                        ? "Validado"
                        : "*  Campos não validados",
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Observer(
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: controller.formularioValidado
                          ? () {
                              controller.logar();
                            }
                          : null,
                      child: controller.carregando
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                Colors.white,
                              ),
                            )
                          : Text(
                              'Logar',
                              style: TextStyle(
                                color: Colors.pink.shade100,
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                            ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
