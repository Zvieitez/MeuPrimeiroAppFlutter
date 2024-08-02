import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      //verifica as validações do formulário
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.blue,
            title: const Text('Nova Tarefa'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  height: 650,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        //ter espaçamento, envolve o formfiel num padding
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          //faz validações necessárias, diferente do textfield
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira o nome da Tarefa';
                            }
                            return null;
                          },
                          controller: nameController,
                          //responsável por controlar as informações que estão dentro do campo de texto
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            //dica do texto a preencher
                            fillColor: Colors.white70,
                            //cor de dentro do formfield
                            filled: true, //verifica se está preenchido ou não
                          ),
                        ),
                      ),
                      Padding(
                        //ter espaçamento, envolve o formfiel num padding
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          //faz validações necessárias, diferente do textfield
                          validator: (value) {
                            if (value!.isEmpty ||
                                int.parse(value) > 5 ||
                                int.parse(value) < 1) {
                              return 'Insira uma Dificuldade entre 1 e 5';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: difficultyController,
                          //responsável por controlar as informações que estão dentro do campo de texto
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade',
                            //dica do texto a preencher
                            fillColor: Colors.white70,
                            //cor de dentro do formfield
                            filled: true, //verifica se está preenchido ou não
                          ),
                        ),
                      ),
                      Padding(
                        //ter espaçamento, envolve o formfiel num padding
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          //faz validações necessárias, diferente do textfield
                          onChanged: (text) {
                            setState(() {
                              //avisa qdo ocorre alguma mudança no texto do formulário e rebilda a tela
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Insira um URL de imagem';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                          controller: imageController,
                          //responsável por controlar as informações que estão dentro do campo de texto
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            //dica do texto a preencher
                            fillColor: Colors.white70,
                            //cor de dentro do formfield
                            filled: true, //verifica se está preenchido ou não
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageController.text,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset('assets/images/photo.png');
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(nameController.text);
                            print(int.parse(difficultyController
                                .text)); //transforma o texto em inteiro
                            print(imageController.text);
                          }
                        },
                        child: Text('Adicionar'),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
