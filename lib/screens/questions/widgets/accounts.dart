// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/questions/service/account_services.dart';
import 'package:keycloakflutter/screens/questions/widgets/single_accounts.dart';

import '../../../helper/common/widgets/loader.dart';
import '../../../models/accounts.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  // temporary list
  List<AccountsConnect>? accounts;

  late List<int> _selectedItems = [];

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    accounts = await accountServices.fetchAccounts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return accounts == null
        ? const Loader()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 330,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: accounts!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // onTap: () {
                      //   // Navigator.pushNamed(
                      //   //   context,
                      //   //   TaskDetailsScreen.routeName,
                      //   //   arguments: tasks![index],
                      //   // );

                      // },

                      onTap: () {
                        if (!_selectedItems.contains(index)) {
                          setState(() {
                            _selectedItems.add(index);
                          });
                        }

                        print(_selectedItems);
                      },
                      onLongPress: () {
                        if (_selectedItems.contains(index)) {
                          setState(() {
                            _selectedItems.removeWhere((val) => val == index);
                          });
                        }

                        print(_selectedItems);
                      },

                      child: SingleAccounts(
                        account: accounts![index],
                        isSelected: false,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}


// ListView.builder(
//  itemCount: appliances.length,
//  scrollDirection: Axis.horizontal,
//  itemBuilder: (context, index) {
//   return ApplicancesTile(
//    appliancesData: appliances[index],
//    onChanged: (value){
//     setState(() {
//      selected = value;
//     });
//    },
//   );
//  },
// ),
