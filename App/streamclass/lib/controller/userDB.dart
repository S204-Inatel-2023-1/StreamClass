import 'package:streamclass/controller/connectDB.dart';

class UserDB extends connectBD {
  //
  registerUser(String name, String cpf, String email, String serial,
      String senha, int assinatura, String avatar) async {
    try {
      //necessário guardar o ID
      dynamic conn = await connectBD().dbConnect();
      await conn.query(
        'INSERT INTO User (name,email,cpf,assinatura,senha,numero_serial,avatar,username) VALUES (?,?,?,?,?,?,?,?)',
        [
          name,
          email,
          cpf,
          assinatura,
          senha,
          serial,
          avatar,
          "user_${name.split(" ").first}"
        ],
      );
      conn.close();
    } catch (e) {
      print("Erro Registro: $e");
    }
  }

  login(String email, String senha) async {
    //Verificar se a senha está correta
    try {
      final conn = await connectBD().dbConnect();
      final result = await conn.query(
        'SELECT * FROM User WHERE email = ? AND senha = ?',
        [email, senha],
      );

      await conn.close();
      return "logado";
    } catch (e) {
      print("Erro login: $e");
      return e;
    }
  }

  //Necessário para login
  verificaEmail(String email) async {
    try {
      final conn = await connectBD().dbConnect();
      final result = await conn.query(
        'SELECT email FROM User WHERE email = ?',
        [email],
      );
      await conn.close();

      if (result.length == 0) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print("Erro verificaEmail: $e");
      return e;
    }
  }

  verificaSenha(String senha) async {
    //Verificar se a senha está correta
    final conn = await connectBD().dbConnect();
    final result = await conn.query(
      'SELECT senha FROM User WHERE senha = ?',
      [senha],
    );
    await conn.close();

    if (result.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  //Recupera as informações do Usuario quando faz login
  dadosUser(String email) async {
    try {
      final conn = await connectBD().dbConnect();
      final result = await conn.query(
        "SELECT * FROM User WHERE email = ?",
        [email],
      );
      await conn.close();

      return result;
    } catch (e) {
      print("ERRO dadosUser: ${e}");
    }
  }

  //Definir uma nova senha
  forgotPassword(senha, String email) async {
    var conn = await connectBD().dbConnect();
    await conn.query(
      "UPDATE User SET senha = ? WHERE email = ?",
      [senha, email],
    );
    conn.close();
  }

  //Atualizar email
  updateEmail(String newEmail, String email) async {
    var conn = await connectBD().dbConnect();
    await conn.query(
      "UPDATE User SET email = ? WHERE email = ?",
      [newEmail, email],
    );
    await conn.close();
  }
}
