import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//a utlilização do mixin Store é para a geração dos códigos automáticos
abstract class PrincipalControllerBase with Store {
  @observable
  String novoItem = '';

  @action
  void setNovoItem(String valor) => novoItem = valor;

  ObservableList<String> listaItens = ObservableList();

  @action
  void adicionarItem() {
    listaItens.add(novoItem);
    print(listaItens);
  }
}
