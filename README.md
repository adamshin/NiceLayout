# NiceLayout

NiceLayout provides a concise fluent interface for setting up Auto Layout constraints in code. It builds on the system layout constraint APIs and can easily be integrated into an existing project.

```swift
// Before
myView.addSubview(button)
button.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    button.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
    button.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),
    button.topAnchor.constraint(equalTo: label.bottomAnchor),
    button.heightAnchor.constraint(equalToConstant: 44)
])

// After
myView.addSubview(button)
button.pin(.hEdges).to(.super).inset(16)
button.pin(.top).to(label, .bottom)
button.pin(.height).to(44)
```

# Usage

## Adding constraints
The expression for adding a constraint takes the basic form of `view.pin(...).to(...)`. 

```swift
view1.pin(.leading).to(view2, .trailing)

view1.pin(.width).to(120)
```

When the same anchor is used for both views, it can be omitted in the `to(...)` call.

```swift
view1.pin(.leading).to(view2, .leading)
view1.pin(.leading).to(view2)
```

To set the constant for a constraint, append an `offset(...)` call.

```swift
view1.pin(.leading).to(view2).offset(16)
```

The `inset(...)` method works
the same as `offset(...)`, but flips the sign of the constant for trailing and bottom edges so that edges are always offset inwards.

```swift
view1.pin(.trailing).to(view2).offset(-16)
view1.pin(.trailing).to(view2).inset(16)
```

Composite anchors are also available for setting multiple constraints at once.

```swift
view1.pin(.center).to(view2)

view1.pin(.edges).to(view2).inset(16)

view1.pin(.size).to(width: 60, height: 80)
```

NiceLayout automatically sets `translatesAutoresizingMaskIntoConstraints` to false for the view on the left-hand side of the expression.

## Superview constraints
When constraining a view to its superview, the shorthand value `.super` can be used as the target.

```swift
labelContainerView.addSubview(label)
label.pin(.leading).to(.super)
label.pin(.centerY).to(.super)
```

A view can also be constrained to its superview's safe area or layout margins.

```swift
view.addSubview(textView)
textView.pin(.top).to(.safeArea)
textView.pin(.hEdges).to(.margins)
```

## Constraint options

The multiplier, priority, and relation of constraints can be set with additional method calls.

```swift
view1.pin(.width).to(view2).multiplier(0.5)

view1.pin(.height).to(600).priority(250)

view1.pin(.bottom).to(view2).inset(24).relation(.lessOrEqual)

```

## Accessing raw NSLayoutConstraints

To access the underlying `NSLayoutConstraints` created by NiceLayout, use the `constraint` or `constraints` property on a constraint expression. These constraints may then be updated or deactivated as usual.

```swift
let widthConstraint: NSLayoutConstraint = view1.pin(.width).to(120).constraint

let edgeConstraints: [NSLayoutConstraint] = view1.pin(.edges).to(view2).constraints
```


