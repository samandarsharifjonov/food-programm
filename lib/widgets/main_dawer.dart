import 'package:flutter/material.dart';
import 'package:ovqatlar/screens/tab_screen.dart';
import 'package:ovqatlar/screens/products_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget _buildMenuItem(
      IconData icon,
      String title,
      Function() handle){
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: handle,
    );
  }

  void _mainMenu(BuildContext context){
    Navigator.of(context).pushReplacementNamed(TabScreen.routName);
  }

  void _productMenu(BuildContext context){
    Navigator.of(context).pushReplacementNamed(ProductsScreen.routName);
  }


  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
         children: [
           AppBar(
             automaticallyImplyLeading: false,
             centerTitle: true,
             backgroundColor: Colors.amber,
             title: const Text("MENU"),
           ),

           _buildMenuItem(
             Icons.home,
             "Bosh sahifa",
               (){
                 _mainMenu(context);
               }

           ),
           const Divider(
             color: Colors.amber,
             height: 0,
           ),
           _buildMenuItem(
               Icons.production_quantity_limits,
               "Mahsulotlar",
                   (){
                     _productMenu(context);
                   }
           ),

         ],
      ),
    );
  }
}
