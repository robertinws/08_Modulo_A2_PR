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
                    Navigator.of(context).pushNamed('/escolas');
                  },
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
    );
  }
}
