import 'package:blood_donation/view/page_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Pagina1());
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Blood Donation Helper',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: Image.asset(
                      'assets/img13.jpg',
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    color: Color.fromRGBO(157, 131, 131, 0.3),
                    padding: EdgeInsets.all(15.0),
                    width: screenWidth * 0.8,
                    child: Text(
                      'Diariamente, 4.5 milhões de unidades de sangue são cruciais para pacientes globalmente. Sua doação pode ser a diferença entre a vida e a morte. Ajude a suprir essa necessidade vital, doe sangue',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '#DoeSangue #DoeVidas',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 30),
                  CupertinoButton(
                    color: Colors.red,
                    child: Text('CONTINUAR'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pagina2(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
