import 'package:app_pokemon/config/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ConfigViewMain extends StatelessWidget {
  const ConfigViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final mainProvider = Provider.of<MainProvider>(context);
    
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Configuración',
            style: TextStyle(fontSize: 30, color: colors.primary),
          ),
          leading: BackButton(
            color: colors.primary,
            onPressed: () {
              if (context.canPop()) context.pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: const Text('Rojo'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.red),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.red),
              ),
              ListTile(
                title: const Text('Verde'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.green),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.green),
              ),
              ListTile(
                title: const Text('Gris'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.grey),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.grey),
              ),
              ListTile(
                title: const Text('Amarillo'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.yellow),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.yellow),
              ),
              ListTile(
                title: const Text('Azul'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.blue),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.blue),
              ),
              ListTile(
                title: const Text('Purpura'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.purple),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.purple),
              ),
              ListTile(
                title: const Text('Amber'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.amber),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.amber),
              ),
              ListTile(
                title: const Text('Cyan'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.cyan),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.cyan),
              ),
              ListTile(
                title: const Text('Negor'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.black),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.black),
              ),
              ListTile(
                title: const Text('Naranja'),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(backgroundColor: Colors.deepOrangeAccent),
                ),
                onTap: () => mainProvider.changeThemeColor(color: Colors.deepOrangeAccent),
              ),
            ],
          ),
        ));
  }
}