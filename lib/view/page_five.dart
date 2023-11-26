import 'package:blood_donation/view/page_six.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Pagina5());
}

class Pagina5 extends StatelessWidget {
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
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(157, 131, 131, 0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(35.5),
                width: 0.75 * MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      'CADASTRO REALIZADO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial, Helvetica, sans-serif',
                        fontSize: 20,
                        color: Color.fromRGBO(0, 0, 0, 0.298),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 52.5),
                    Text(
                      'Seus dados foram salvos, ao precisar o Hemominas entrará em contato para os demais processos. Agradecemos pela contribuição',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.5),
              SizedBox(height: 10.5),
              SizedBox(height: 30.5),
              Container(
                child: CupertinoButton(
                  color: Colors.red,
                  child: Text('CONTINUAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pagina6(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
