import '../widgets/analytics_widget.dart';
import '../widgets/show_orders_widget.dart';

import '../widgets/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';

enum FilterOption {
  numericMetrics,
  ordertimegraph,
  all,
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FilterOption currentSelection = FilterOption.all;
  int _selectedIndex = 0;

  Future<void> _showAllOrders() async {
    await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _showAllOrders();
    super.initState();
  }

  List<Widget> tabs = [ShowOrders(), Analytics(), Graph()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context).getOrders;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'All Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Analytics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph),
              label: 'Graphs',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          onTap: _onItemTapped,
        ),
        appBar: AppBar(
          title: const Text('FlapKap Challenge'),
        ),
        body: tabs.elementAt(_selectedIndex));
  }
}
