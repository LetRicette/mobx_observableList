import 'package:mobx/mobx.dart';
import 'package:mobx_observablelist/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//a utlilização do mixin Store é para a geração dos códigos automáticos
abstract class PrincipalControllerBase with Store {
  @observable
  String novoItem = '';

  @action
  void setNovoItem(String valor) => novoItem = valor;

  ObservableList<ItemController> listaItens = ObservableList<ItemController>();
  //"Letícia" < lista normal de objeto
  //nome: Curso Flutter marcado: true
  @action
  void adicionarItem() {
    listaItens.add(ItemController(novoItem));
    print(listaItens);
  }
}
