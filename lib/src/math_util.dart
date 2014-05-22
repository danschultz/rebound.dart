part of rebound;

num mapValueInRange(num value, num fromLow, num fromHigh, num toLow, num toHigh) {
  var fromRangeSize = fromHigh - fromLow;
  var toRangeSize = toHigh - toLow;
  var valueScale = (value - fromLow) / fromRangeSize;
  return toLow + (valueScale * toRangeSize);
}