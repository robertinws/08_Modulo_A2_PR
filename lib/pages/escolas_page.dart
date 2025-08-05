import 'package:flutter/material.dart';
import 'package:modulo_a2_pr/global/cores.dart';
import 'package:modulo_a2_pr/global/funcoes.dart';
import 'package:modulo_a2_pr/global/variaveis.dart';

class EscolasPage extends StatefulWidget {
  const EscolasPage({super.key});

  @override
  State<EscolasPage> createState() => _EscolasPageState();
}

class _EscolasPageState extends State<EscolasPage> {
  @override
  void initState() {
    super.initState();
    telaAtual = 1;
    contexto = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Row(
                    spacing: 10,
                    children: [
                      Image.asset(
                        height: 40,
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Aprender+',
                        style: TextStyle(
                          color: corEscuro,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  title: Text('Home'),
                ),
                ListTile(
                  tileColor: corRoxoClaro,
                  textColor: corClara,
                  onTap: () {},
                  title: Text('Lista de escolas'),
                ),
                ListTile(onTap: () {}, title: Text('Mapa')),
                ListTile(onTap: logout, title: Text('Logout')),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              spacing: 20,
              children: [
                Text(
                  'Lista de escolas',
                  style: TextStyle(
                    color: corEscuro,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Avaliação',
                    style: TextStyle(
                      color: corEscuro,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: ListView.builder(
                    itemCount: listEscolas.length,
                    itemBuilder: (context, index) {
                      final escola = listEscolas[index];
                      print(escola);
                      return Padding(
                        padding: EdgeInsetsGeometry.only(bottom: 10),
                        child: ListTile(
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusGeometry.circular(10),
                          ),
                          tileColor: const Color.fromARGB(
                            255,
                            216,
                            216,
                            216,
                          ),
                          title: Text(escola['nome']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(4, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            }),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
