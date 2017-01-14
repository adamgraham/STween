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

### To Do

- Detailed usage/documentation readme
- Support for mutable structs
- Example project

### License
```
MIT License

Copyright (c) 2016 Adam Graham

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
