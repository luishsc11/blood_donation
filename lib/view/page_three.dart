import 'package:blood_donation/view/page_four.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Pagina3());
}

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Blood Donation Helper',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial, Helvetica, sans-serif',
                  fontSize: 26.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(157, 131, 131, 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(30),
                width: 0.75 * MediaQuery.of(context).size.width,
                child: Text(
                  'O processo de doação de sangue é simples e seguro. Primeiro, você fará um breve questionário médico para garantir que está apto para doar. Depois, um profissional de saúde irá recolher o sangue.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Cadastre no botão abaixo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: CupertinoButton(
                  color: Colors.red,
                  child: Text('CONTINUAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateCadastroPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
