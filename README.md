# STween
> An iOS animation framework based on [Robert Penner's Easing Functions](http://robertpenner.com/easing/).<br/>
> Complex animations done simple. An easy-to-use interface.

For detailed usage and documentation, please visit the [STween Reference](https://adamgraham.github.io/STween/).

## Requirements

- iOS 10.0+
- Swift 5.0+
- Xcode 10.2+

## Usage

### Tweening
A Tween is an animation of a value from a start position to an end position over time using a given ease (linear, quadratic, exponential, etc). An ease is a timing function that provides a natural sense of motion.

Tweening engines make animations simple. Take the following, for example:

``` swift
view.tween(to: .width(100.0))
```
This one line of code creates an animation that changes a view's width to `100.0`.

Alternatively, tweens can be created using the generic `Tweener` class:
``` swift
Tweener.default.animate(view).to(.width(100.0))
```

Tweens are not just limited to the animation of visual elements, though. Tweening can be applied to virtually any type of data. See below for more information.

### Customizing Tweens
Once you have instantiated a `Tween` using the tween methods on an object or using the `animate` function from the `Tweener` class, you can customize it in many ways:
``` swift
// Animates properties from the target's current values *to* the desired values
tween.to(...)
// Animates properties *from* desired values to the target's current values
tween.from(...)

// The amount of seconds the tween takes to complete
tween.duration(0.3)
// The amount of seconds before the tween starts updating after being started
tween.delay(0.0)
// The `Ease` used to interpolate values
tween.ease(.quadOut)

// The callback invoked every time the tween is updated
tween.onUpdate({ ... })
// The callback invoked when the tween is started
tween.onStart({ ... })
// The callback invoked when the tween is stopped
tween.onStop({ ... })
// The callback invoked when the tween is restarted
tween.onRestart({ ... })
// The callback invoked when the tween is paused
tween.onPause({ ... })
// The callback invoked when the tween is resumed
tween.onResume({ ... })
// The callback invoked when the tween is completed
tween.onComplete({ ... })
// The callback invoked when the tween is killed
tween.onKill({ ... })
// The callback invoked when the tween is revived
tween.onRevive({ ... })
```

Now that the tween has been customized, you can control its playback using the following state control methods:
``` swift
// Increases the tween's elapsed time and invokes all animation closures
tween.update(by: 0.1)
// Starts the tween for updates, putting it in an `active` state
tween.start()
// Stops the tween from updating, putting it in an `inactive` state
tween.stop()
// Stops the tween, then immediately starts it over again from the beginning
tween.restart()
// Pauses the tween, maintaining its current progress
tween.pause()
// Resumes the tween, continuing where it left off before being paused
tween.resume()
// Completes updates on the tween, jumping to its ending values
tween.complete()
// Kills the tween in place, halting at its current values
tween.kill()
// Revives the tween, putting it in a `new` state
tween.revive()
```

There are a few additional properties that can be used to get more information about the tween:
``` swift
// The tween's current state, i.e., active, paused, etc
tween.state
// The amount of seconds the tween has been active
tween.elapsed
// The percentage of the tween's elapsed time in relation to its duration
tween.percentComplete
```

### Managing Tweens
The `Tweener` class keeps track of all of the active tweens and continues to update them using a display link timer. There are few methods available to aid in managing tweens:
``` swift
// The number of tweens crrently being tracked
Tweener.shared.count
// Checks if a tween is being tracked
Tweener.shared.isTracking(tween)
// Adds a tween to the list of tracked tweens
Tweener.shared.track(tween)
// Removes a tween from the list of tracked tweens
Tweener.shared.untrack(tween)
// Global state control methods
Tweener.shared.updateAll(by: 0.1)
Tweener.shared.startAll()
Tweener.shared.stopAll()
Tweener.shared.restartAll()
Tweener.shared.pauseAll()
Tweener.shared.resumeAll()
Tweener.shared.completeAll()
Tweener.shared.killAll()
```

There are other instances of `Tweener` available, too, and you can even create your own.
``` swift
// The default assigned instance
Tweener.default
// The main shared instance (default)
Tweener.shared
// An instance where all tweens are updated manually
Tweener.manual
// A custom instance
Tweener.custom("id")
// Assigns this instance as the default
Tweener.custom("id").setAsDefault()
```

### Examples
``` swift
let view = UIView()
view.tween(to: .backgroundColor(.black), .width(256.0), .height(256.0))
view.tween(from: .alpha(0.0), .frame(.zero))
```
``` swift
let view = UIView()
let position = CGPoint(x: 100.0, y: 100.0)
view.tween(to: .origin(position))
    .duration(0.5)
    .ease(.backOut)
    .onComplete({ ... })
```
``` swift
let view = UIView()
Tweener.default.animate(view).to(.left(20.0), .top(40.0))
Tweener.default.animate(view).from(.backgroundColor(.white), .size(.zero))
```
``` swift
let view = UIView()
Tweener.default.animate(view)
    .to(.transform(...))
    .duration(1.0)
    .ease(.cubicIn)
    .onUpdate({ ... })
```

### Defaults
There are a set of values that are applied to every tween by default. These values can be changed via the `Defaults` class.
``` swift
Defaults.ease // .quadOut
Defaults.overshoot // 1.70158
Defaults.duration // 0.3
Defaults.delay // 0.0
Defaults.autoStartTweens // true
Defaults.autoKillCompletedTweens // true
```

### Supported Eases
The easing functions below are all supported. A visualized cheat-sheet of these easing functions can be found at [easings.net](http://easings.net/).

``` swift
Ease.linear
Ease.cubicIn
Ease.cubicOut
Ease.cubicInOut
Ease.quadIn
Ease.quadOut
Ease.quadInOut
Ease.quartIn
Ease.quartOut
Ease.quartInOut
Ease.quintIn
Ease.quintOut
Ease.quintInOut
Ease.expoIn
Ease.expoOut
Ease.expoInOut
Ease.circIn
Ease.circOut
Ease.circInOut
Ease.backIn
Ease.backOut
Ease.backInOut
Ease.elasticIn
Ease.elasticOut
Ease.elasticInOut
Ease.bounceIn
Ease.bounceOut
Ease.bounceInOut
Ease.custom({ ... })
```

### Supported Types
Tweening animations can be applied to any of the supported types below. If a type is not listed below, you can add tweening support by conforming to the `Tweenable` protocol. Feel free to leave suggestions to new types you would like to see added.

- `UIView`, `UIButton`, `UILabel`, `UITextField`
- `CALayer`
- `NSLayoutConstraint`

All of the following data types can be interpolated - the ability for a type to calculate the value between a start and end position at a specific point in time. If a type is not listed below, you can add interpolation support by conforming to the `Interpolatable` protocol.

- `UInt`, `UInt8`, `UInt16`, `UInt32`, `UInt64`
- `Int`, `Int8`, `Int16`, `Int32`, `Int64`
- `Float`, `Float32`, `Float64`, `Float80`, `Double`
- `Date`
- `CATransform3D`
- `CGAffineTransform`, `CGColor`, `CGFloat`, `CGPoint`, `CGRect`, `CGSize`, `CGVector`
- `CIColor`, `CIVector`
- `UIColor`, `UIEdgeInsetes`, `UIOffset`

## License
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
