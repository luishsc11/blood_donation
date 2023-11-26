import 'package:blood_donation/view/page_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Pagina6());
}

class Pagina6 extends StatelessWidget {
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
                      'BENEFÍCIOS DA DOAÇÃO DE SANGUE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial, Helvetica, sans-serif',
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 52.5),
                    Text(
                      'Doar sangue faz bem para a saúde do doador ao diminuir a pressão arterial, podendo melhorar inclusive os níveis de colesterol. Um doador regular tem menores chances de sofrer com qualquer tipo de câncer, pois reduz a presença de oxidativos em nosso organismo. Doar sangue não faz bem somente à saúde física e mental da pessoa, mas também ao bolso. Os doadores têm direito a uma folga remunerada por ano para exercer esse ato cívico, visto que é recomendado repouso após a doação.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.5),
              Container(
                child: CupertinoButton(
                  color: Colors.red,
                  child: Text('VOLTAR AO INICIO'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pagina1(),
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
