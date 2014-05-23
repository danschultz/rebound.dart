part of rebound;

class Spring {
  JsObject _proxy;

  int get id => _proxy.callMethod("getId");

  num get startValue => _proxy.callMethod("getStartValue");

  num get currentValue => _proxy.callMethod("getCurrentValue");
  void set currentValue(num value) {
    _proxy.callMethod("setCurrentValue", [value]);
  }

  num get endValue => _proxy.callMethod("getEndValue");
  void set endValue(num value) {
    _proxy.callMethod("setEndValue", [value]);
  }

  StreamController<Spring> _onStartSink = new StreamController.broadcast();
  Stream<Spring> get onStart => _onStartSink.stream;

  StreamController<Spring> _onUpdateSink = new StreamController.broadcast();
  Stream<Spring> get onUpdate => _onUpdateSink.stream;

  StreamController<Spring> _onEndSink = new StreamController.broadcast();
  Stream<Spring> get onEnd => _onEndSink.stream;

  Spring._(this._proxy) {
    var listeners = new JsObject.jsify({
      "onSpringActivate": (_) => _onStartSink.add(this),
      "onSpringUpdate": (_) => _onUpdateSink.add(this),
      "onSpringAtRest": (_) => _onEndSink.add(this)
    });
    _proxy.callMethod("addListener", [listeners]);
  }

  factory Spring() {
    return new Spring._(new JsObject(context["rebound"]["Spring"]));
  }
}
