import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../data/api.dart';
import 'page_five.dart';

class CreateCadastroPage extends StatefulWidget {
  const CreateCadastroPage({Key? key}) : super(key: key);

  @override
  _CreateCadastroPageState createState() => _CreateCadastroPageState();
}

OutlineInputBorder myInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      width: 3,
    ),
  );
}

final formKey = GlobalKey<FormState>();

class _CreateCadastroPageState extends State<CreateCadastroPage> {
  final api = Api();
  final nome = TextEditingController();
  final telefone = TextEditingController();
  final tipagem = TextEditingController();
  final sangue = TextEditingController();
  final datanasc = TextEditingController();
  final peso = TextEditingController();
  List<String> tiposSanguineos = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
    'Nao Sei'
  ];
  String? selectedTipoSanguineo = 'A+';

  List<String> ultimaDoacao = [
    'De 3 a 6 meses',
    'De 6 meses a 1 ano',
    'Mais de 1 ano',
    'Mais de 2 anos',
    'Nunca doei'
  ];
  String? selecteduUltimaDoacao = 'De 3 a 6 meses';

  String? validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Nome é obrigatório';
    }
    final RegExp regexNome = RegExp(r'^[a-zA-ZÀ-ÖØ-öø-ÿ ]+$');
    if (!regexNome.hasMatch(value)) {
      return 'O Nome deve conter apenas letras, espaços e acentos';
    }
    return null;
  }

  String? validateTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Telefone é obrigatório';
    }
    final RegExp regexTelefone = RegExp(r'^[0-9]+$');
    if (!regexTelefone.hasMatch(value)) {
      return 'O Telefone deve conter apenas números';
    }
    if (value.length < 11) {
      return 'O Telefone deve ter no mínimo 11 números';
    }
    return null;
  }

  String? validateSangue(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Última Doação de Sangue é obrigatório';
    }
    return null;
  }

  String? validateDatanasc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Data de Nascimento é obrigatório';
    }
    try {
      final DateTime parsedDate = DateFormat('dd/MM/yyyy').parseStrict(value);
      if (parsedDate.isAfter(DateTime.now())) {
        return 'A data de nascimento não pode estar no futuro';
      }
    } catch (e) {
      return 'Formato de data inválido. Use o formato dd/MM/yyyy';
    }
    return null;
  }

  String? validatePeso(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Peso é obrigatório';
    }
    try {
      double peso = double.parse(value);
      if (peso <= 0 || peso > 500) {
        return 'Informe um peso válido';
      }
    } catch (e) {
      return 'Informe um valor numérico válido';
    }
    return null;
  }

  bool isLoading = false;

  void showLoadingIndicator() {
    setState(() {
      isLoading = true;
    });
  }

  void hideLoadingIndicator() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Blood Donation Helper',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Arial, Helvetica, sans-serif',
                          fontSize: 26.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Nome",
                          border: myInputBorder(),
                        ),
                        controller: nome,
                        validator: validateNome,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          labelText: "Telefone",
                          border: myInputBorder(),
                        ),
                        controller: telefone,
                        validator: validateTelefone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedTipoSanguineo ?? tiposSanguineos[0],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.bloodtype),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Qual seu tipo sanguíneo",
                          border: myInputBorder(),
                        ),
                        items: tiposSanguineos.map((tipo) {
                          return DropdownMenuItem<String>(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTipoSanguineo = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Tipo Sanguíneo é obrigatório';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: selecteduUltimaDoacao ?? ultimaDoacao[0],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.bloodtype),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Qual a última vez que doou:",
                          border: myInputBorder(),
                        ),
                        items: ultimaDoacao.map((tipo) {
                          return DropdownMenuItem<String>(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selecteduUltimaDoacao = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Ultima Doação é obrigatório';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          labelText: "Sua data de nascimento",
                          border: myInputBorder(),
                        ),
                        controller: datanasc,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          DataInputFormatter(),
                        ],
                        keyboardType: TextInputType.number,
                        validator: validateDatanasc,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Qual seu peso",
                          border: myInputBorder(),
                        ),
                        controller: peso,
                        validator: validatePeso,
                      ),
                      SizedBox(height: 40),
                      CupertinoButton(
                        color: Colors.red,
                        child: Text('CADASTRAR'),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              showLoadingIndicator();

                              await api
                                  .postCadastro(
                                nome: nome.text,
                                telefone: telefone.text,
                                tipagem: selectedTipoSanguineo ?? 'A+',
                                sangue:
                                    selecteduUltimaDoacao ?? 'De 3 a 6 meses',
                                datanasc: datanasc.text,
                                peso: peso.text,
                              )
                                  .whenComplete(() {
                                hideLoadingIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pagina5()),
                                );
                              });
                            } catch (e) {
                              print('Erro ao cadastrar: $e');
                              hideLoadingIndicator();
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

class DataInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 2 && !text.endsWith('/')) {
      text += '/';
    } else if (newValue.selection.baseOffset == 5 &&
        text.length > 4 &&
        !text.endsWith('/')) {
      text += '/';
    }
    if (text.length == 3 && !text.contains('/')) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    if (text.length > 10) {
      text = text.substring(0, 10);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
