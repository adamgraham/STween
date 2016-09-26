# STween
> A Swift iOS animation framework based on [Robert Penner's Easing Functions](http://robertpenner.com/easing/).<br/>
> Complex animations done simple. An easy-to-use interface.

### Tweening
A Tween is an animation of a value from a start position to an end position with a given duration of time and a type of easing algorithm (linear, exponential, quadratic, etc).

Tweening engines make animations simple. Take the following, for example:

``` swift
view.tween(property: .y(100.0), duration: 1.0)
```
This one line of code creates an animation that moves a view's vertical position to the y-coordinate of `100.0` over a duration of `1.0` second.

Tweens are not just limited to the animation of visual elements, though. Tweening can be applied to virtually any type of data. See below for more information.

### Supported Types
Tweening animations can be applied to any of the supported types below. If a type is not listed, you can add tweening support by conforming to the `STween.Tweenable` protocol. Feel free to leave suggestions to new types you would like to see added.

- `UIKit.UIView`
- `UIKit.NSLayoutConstraint`
- Work in progress, more to come...

### Supported Algorithms
The below algorithm classifications are supported. Each classification has 3 variations: `.in`, `.out`, `.inOut`.<br/>
A visualized cheat-sheet of the algorithms can be found at [easings.net](http://easings.net/).

- Linear
- Cubic
- Quadratic
- Quartic
- Quintic
- Exponential
- Circular
- Back
- Elastic
- Bounce

To set the type of ease a Tween will use, for example, see the following:
``` swift
tween.set(ease: .bounceInOut)
```

### To Do

- Detailed usage/documentation readme
- Support for mutable structs
- Finish unit tests
- Example project
