import 'package:flutter_test/flutter_test.dart';
import 'package:streamclass/controller/userDB.dart';

void main() {
  group("Teste de login", () {
    test("Email fora do bd", () async {
      final result = await UserDB().login(
        'eurobiva@gmail.com',
        '123456',
      );
      expect(result, equals('logado'));
    });

    //TEste do email
    test("Teste com email, sucesso", () async {
      final result = await UserDB().verificaEmail('eurobiva@gmail.com');
      expect(result, equals('logado'));
    });

    test("Teste com email, erro", () async {
      final result = await UserDB().verificaEmail('eurobiva@gmail.com');
      expect(result, equals('logado'));
    });

    //TEste da senha
    test("Teste - senha, sucesso", () async {
      final result = await UserDB().verificaSenha('123456');
      expect(result, equals(true));
    });

    test("Teste - senha, erro", () async {
      final result = await UserDB().verificaSenha('sdfsdfsd');
      expect(result, equals(false));
    });
  });
}
