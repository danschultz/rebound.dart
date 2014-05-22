library rebound_example;

import 'dart:html';
import 'package:rebound/rebound.dart';

void main() {
  var logo = querySelector("#logo");

  var springSystem = new SpringSystem();
  var spring = springSystem.createSpring(50, 3);
  spring.onUpdate.listen((spring) {
    logo.style.transform = "scale(${mapValueInRange(spring.currentValue, 0, 1, 1, 0.5)}";
  });

  logo..onMouseDown.listen((_) => spring.endValue = 1)
      ..onMouseUp.listen((_) => spring.endValue = 0);
}