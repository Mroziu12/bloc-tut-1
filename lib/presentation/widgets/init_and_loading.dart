import 'package:flutter/material.dart';

import 'city_input_field.dart';

Widget buildInitialInput() {
  return const Center(
    child: CityInputField(),
  );
}

Widget buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
