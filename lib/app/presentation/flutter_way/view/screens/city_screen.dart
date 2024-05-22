import 'package:flutter/material.dart';
import 'package:flutter_project_09/app/presentation/flutter_way/business_logic/business_logic.dart';
import 'package:flutter_project_09/common/contants/text_styles/app_text_styles.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
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
                    Navigator.pop(context, true);
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
                    businessLogic.typeCity(value);

                    setState(() {});
                  },
                  style: AppTextStyles.kTextFormFieldTextStyle,
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
                    hintStyle: AppTextStyles.kTextFormFieldTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'Get Weather',
                  style: AppTextStyles.kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
