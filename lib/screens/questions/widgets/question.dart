import 'package:keycloakflutter/models/question.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/questions/service/account_services.dart';
import 'package:keycloakflutter/screens/questions/widgets/single_question.dart';

import '../../../helper/common/widgets/loader.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  // temporary list
  List<Question>? questions;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    questions = await accountServices.fetchQuestions(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return questions == null
        ? const Loader()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 0),
                width: 330,
                padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: questions!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: SingleQuestion(
                        question: questions![index],
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
