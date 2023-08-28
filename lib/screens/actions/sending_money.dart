import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'package:intl/intl.dart';
import 'package:icons_plus/icons_plus.dart';

class SendingMoneyScreen extends StatefulWidget {
  final User userSend;
  final User userReceiver;
  final String valueToTransfer;
  const SendingMoneyScreen(
      {required this.userSend,
      required this.userReceiver,
      required this.valueToTransfer,
      super.key});

  @override
  State<SendingMoneyScreen> createState() => _SendingMoneyScreenState();
}

class _SendingMoneyScreenState extends State<SendingMoneyScreen> {

  


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = {"userSend" : widget.userSend, "userReceiver" : widget.userReceiver, "valueToTransfer": widget.valueToTransfer};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: widget.userSend.makeTransfer(
                fullnameSend: widget.userSend.fullname,
                fullnameReceiver: widget.userReceiver.fullname,
                value: widget.valueToTransfer),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(24, 20, 10, 20),
                          child: Text(
                            'Realizando sua transação...',
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 0.75,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.visible),
                          ),
                        ),
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(24, 20, 10, 20),
                          child: Text(
                            'Realizando sua transação...',
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 0.75,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.visible),
                          ),
                        ),
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(24, 20, 10, 20),
                          child: Text(
                            'Realizando sua transação...',
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 0.75,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.visible),
                          ),
                        ),
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                case ConnectionState.done:
                  return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Transação concluída!',
                            style: TextStyle(
                                fontSize: 28,
                                letterSpacing: 0.75,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.visible),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              DateFormat("dd/MM/yyyy 'às' HH:mm")
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Stack(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                      child: Text(
                                    getAbbreviation(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.userReceiver.fullname.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Boli - Banco digital S.A.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 28),
                            child: Text(widget.valueToTransfer,
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, 'transfer-voucher', arguments: arguments);
                              },
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
                                padding: const EdgeInsets.all(10),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(BoxIcons.bxs_news),
                                    Text(
                                      'Ver comprovante',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.popAndPushNamed(context, "home-screen", arguments: widget.userSend);
                            },
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.all(10),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(BoxIcons.bx_arrow_back),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text(
                                      'Voltar',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }

  String getAbbreviation() {
    String abbreviation = widget.userReceiver.name.substring(0, 1);
    String abbreviation2 = widget.userReceiver.lastName.substring(0, 1);
    String finalString = "$abbreviation$abbreviation2";
    return finalString;
  }
}
