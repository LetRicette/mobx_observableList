import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

//a utlilização do mixin Store é para a geração dos códigos automáticos
abstract class ControllerBase with Store {
  //Executa sempre que um observável tem seu estado alterado
  ControllerBase() {
    // autorun((_) {
    //   print(email);
    //   print(password);
    //   print(formularioValidado);
    // });
  }

  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool usuarioLogado = false;
  @observable
  bool carregando = false;

  @computed
  bool get formularioValidado => email.length >= 5 && password.length >= 5;
  // @computed
  // String get emailPassword => "$email - $password";

  @action
  void setEmail(value) => email = value;
  @action
  void setPassword(value) => password = value;

  @action
  Future<void> logar() async {
    carregando = true;

    //processamento
    await Future.delayed(Duration(seconds: 3));

    carregando = false;
    usuarioLogado = true;
  }
}
