// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:covid19_tracker/constants/colors.dart';
import 'package:covid19_tracker/view/world_states.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  final int totalcases;
  final int totalDeaths;
  final int totalRecovered;
  final int active;
  final int critcal;
  final int todayRecovered;
  final int test;
  const DetailsScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.totalcases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critcal,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomRow(text: 'Total Cases', value: widget.totalcases),
            CustomRow(text: 'Total Tests', value: widget.test),
            CustomRow(text: 'Total Deaths', value: widget.totalDeaths),
            CustomRow(text: 'Total Recovered', value: widget.totalRecovered),
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String text;
  final int value;
  const CustomRow({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
