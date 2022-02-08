import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//a utlilização do mixin Store é para a geração dos códigos automáticos
abstract class PrincipalControllerBase with Store {}
