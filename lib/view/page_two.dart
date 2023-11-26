import 'package:blood_donation/view/page_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Pagina2());
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BloodDonationPage(),
    );
  }
}

class BloodDonationPage extends StatelessWidget {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Blood Donation Helper',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Color.fromRGBO(157, 131, 131, 0.3),
                padding: EdgeInsets.all(15.0),
                width: screenWidth * 0.8,
                child: Text(
                  "Doe sangue com segurança: hidrate-se, alimente-se bem, descanse, leve um documento, após a doação descanse e evite exercícios intensos. Siga as orientações dos profissionais de saúde para uma experiência sem estresse.",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  final url =
                      'https://www.google.com.br/maps/place/Funda%C3%A7%C3%A3o+Hemominas/@-18.5941975,-46.5149837,19.5z/data=!4m6!3m5!1s0x94ae8ad31ec92547:0xbf069a0f1b8a8c19!8m2!3d-18.5941534!4d-46.5148359!16s%2Fg%2F1tnbm6xq?entry=ttu';
                  launch(url);
                },
                child: Container(
                  color: Colors.grey[700],
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img6.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: CupertinoButton(
                  color: Colors.red,
                  child: Text('CONTINUAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pagina3(),
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
