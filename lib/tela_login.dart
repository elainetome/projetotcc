import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({ Key? key }) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //Declaração de atributos que serão utilizados
  //para receber os dados que o usuário digitar
  //no campo de texto
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();

  //Declaração do atributo que identifica
  //unicamente o formulário
  var f1 = GlobalKey<FormState>();

  @override
  void initState() {
    //definir o valor inicial da variável
    //txtSenha.text = '123456';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA TÍTULO
      appBar: AppBar(
        title: const Text('Login do usuario'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 218, 36, 23),
      ),
      backgroundColor: Colors.grey.shade100,
      //BODY
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/imagens/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  //identificador do form
                  key: f1,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.people_alt,
                        size: 100,
                        color: Color.fromARGB(255, 218, 36, 23),
                      ),
                      campoTexto('Login', 'Informe usuario ou e-mail', txtUsuario),
                      const SizedBox(height: 20),
                      campoTexto('Senha','Informe a senha', txtSenha),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'cadastro');
                        },
                        child: const Text('Cadastre-se'),
                      ),
                      const SizedBox(height: 30),
                      botao('Entrar'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(rotulo, dica, variavel) {
    return TextFormField(
      //associar a variável que receberá o valor
      //digitado no campo de texto
      controller: variavel,
      //habilitar o teclado numérico
      keyboardType: TextInputType.number,
      //campo de senha
      obscureText: false,
      //número de caracteres
      maxLength: 30,
      //definir o campo de texto somente leitura
      //readOnly: true,

      decoration: InputDecoration(
        //fillColor: Colors.white,
        //filled: true,
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 22,
         color: Color.fromARGB(255, 218, 36, 23),
        ),
        hintText: dica,
        hintStyle: const TextStyle(
          fontSize: 22,
         
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      //
      // Validação dos Dados
      //
      validator: (value) {
        value = value!.replaceFirst(',', '.');
        if (double.tryParse(value) == null) {
          return 'Digite o login ou e-mail válido';
        }
        return null;
      },
    );
  }

  //
  // BOTÃO
  //
  botao(rotulo) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        //Evento que ocorrerá quando o usuário acionar
        //o botão
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, 'principal', (route) => false);
         /* if (f1.currentState!.validate()) {
            //Recuperar os dados informados pelo usuário
            setState(() {
              double p = double.parse(txtUsuario.text.replaceFirst(',', '.'));
              double a = double.parse(txtSenha.text.replaceFirst(',', '.'));
              

            });
          }*/
        },
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 22),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 218, 36, 23)     ),
      ),
    );
  }

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Sair')),
            ],
          );
        });
  }
}