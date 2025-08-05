import 'package:flutter/material.dart';
import 'package:modulo_a2_pr/global/cores.dart';
import 'package:modulo_a2_pr/global/funcoes.dart';
import 'package:modulo_a2_pr/global/variaveis.dart';
import 'package:modulo_a2_pr/services/infos_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    contexto = context;
    telaAtual = 0;
    iniciar();
  }

  void iniciar() async {
    await InfosDao().receberMensagem();
    await InfosDao().listarEscolas();
    setState(() {});
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bem-vindo, ${usuario['name']}',
                        style: TextStyle(
                          color: corEscuro,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  mensagemHome,
                  style: TextStyle(
                    color: corEscuro,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
