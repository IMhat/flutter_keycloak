import 'package:keycloakflutter/screens/cashflow/expense.dart';
import 'package:keycloakflutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'income.dart';

class CashFlowScreen extends StatefulWidget {
  static const String routeName = '/cashflow';
  const CashFlowScreen({Key? key}) : super(key: key);

  @override
  State<CashFlowScreen> createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Drawer(
        child:  CustomDrawer(),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: currentWidth,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.deepPurple))),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  indicatorColor: Color.fromARGB(255, 168, 172, 177),
                  controller: controller,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 100,
                          height: 40,
                          child: const Text(
                            'Income',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          )),
                    ),
                    Tab(
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 100,
                          height: 40,
                          child: const Text(
                            'Expense',
                            style:  TextStyle(fontSize: 20, color: Colors.red),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: currentWidth,
              height: 800,
              child: TabBarView(
                controller: controller,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: const IncomeScreen(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: const ExpenseScreen(),
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
