import 'package:boli_digital_bank/components/card_credit_item.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Cartões',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        toolbarHeight: 80,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                ],
              ))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              children: [
                Text(
                  'Dinheiro total',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '\$100.000.000',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          const CardCreditItem(
            balanceCard: '20,000,000',
            cardNumber: '5376 8371 0923 0921',
            cvv: '097',
            dueDate: '12/23',
            colorCard: Color.fromRGBO(100, 106, 226, 1),
            colorText: Colors.white,
            iconCard: BoxIcons.bxl_visa,
          ),
          const CardCreditItem(
            balanceCard: '8,450,000',
            cardNumber: '0495 8381 9303 1234',
            cvv: '017',
            dueDate: '12/24',
            colorCard: Color.fromRGBO(27, 27, 27, 1),
            colorText: Colors.white,
            iconCard: BoxIcons.bxl_visa,
          ),
          CardCreditItem(
            balanceCard: '32,003,000',
            cardNumber: '0298 6652 9142 7348',
            cvv: '582',
            dueDate: '12/26',
            colorCard: Theme.of(context).primaryColor,
            colorText: Theme.of(context).primaryColorDark,
            iconCard: BoxIcons.bxl_visa,
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Theme.of(context).dividerColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bxs_home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_camera),
            label: 'Escanear',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_bar_chart_alt_2),
            label: 'Investimentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
