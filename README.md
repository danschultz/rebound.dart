# Rebound.dart
Rebound.dart is a Dart package that wraps the JavaScript port of [Rebound](http://facebook.github.io/rebound/). Rebound spring models can be used to create animations that feel natural by introducing real world physics to your application.

Rebound is not a general purpose physics library; however, spring dynamics can be used to drive a wide variety of animations. The simplicity of Rebound makes it easy to integrate and use as a building block for creating more complex components like pagers, toggles, and scrollers.

For more information about Rebound, check out http://facebook.github.io/rebound.

## Installation
Add Rebound to your project's `pubspec.yaml` file:

```
dependencies:
  rebound: any
```

The package comes with a minified JS file for Rebound. It needs to be loaded from your HTML:

```
<html>
  <head>
    <title>Rebound</title>
    <script src="packages/rebound/rebound.js"></script>
  </head>
</html>
```

## Usage
Here's a simple example of using a Spring model to drive a scaling animation of an image.

```
// The image element to animate and scale.
var image = new ImageElement();

// Create a system to run the physics loop for a set of springs.
var springSystem = new SpringSystem();

// Add a spring to the system.
var spring = springSystem.createSpring();

// Add a listener to observe the motion of the spring.
spring.onUpdate.listen((_) {
  var value = mapValueInRange(spring.currentValue, 0, 1, 1, 0.5);
  image.style.transform = "scale($value)";
});

// Set the spring in motion; moving from 0 to 1
spring.endValue = 1;
```

## API Changes
The Dart API is very similar to the JS API. However, some methods and fields may have changed to feel more "dartesque". In particular:

* The get and set methods in JS have been converted into getters and setters in Dart.
* Instead of passing a JS listener objects, streams are used.

## Versioning
Since the JavaScript for Rebound is included with the package, the versioning for Rebound.dart follows the same version numbers as ReboundJS.