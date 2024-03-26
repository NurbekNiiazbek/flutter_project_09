import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_09/constants.dart';

class CityView extends StatefulWidget {
  const CityView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, text);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextFormField(
                  onChanged: (String value) {
                    log('onChanged: $value');

                    setState(() {
                      text = value;
                    });

                    log('onChanged.text: $text');
                  },
                  style: kTextFormFieldTextStyle,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Enter a search term',
                    hintStyle: kTextFormFieldTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
