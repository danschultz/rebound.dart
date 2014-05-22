part of rebound;

class SpringSystem {
  JsObject _proxy;

  bool get isIdle => _proxy.callMethod("getIsIdle");

  SpringSystem() :
    _proxy = new JsObject(context["rebound"]["SpringSystem"]);

  Spring createSpring(int tension, int friction) {
    return new Spring._(_proxy.callMethod("createSpring", [tension, friction]));
  }
}
