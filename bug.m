In Objective-C, a less common error stems from the misuse of `performSelector:withObject:afterDelay:` or similar methods.  If the selector doesn't exist on the target object or the object is deallocated before the delay expires, it can lead to unexpected crashes or silent failures.  Another problem arises if the object's memory is deallocated during execution of a selector. This can occur if the selector is called with a significant delay and the object's lifetime isn't managed properly. This leads to a EXC_BAD_ACCESS crash.

```objectivec
- (void)myMethod {
    [self performSelector:@selector(delayedMethod) withObject:nil afterDelay:5.0];
}

- (void)delayedMethod {
    // ... some code ...
    // Crash if self is deallocated before this line.
}
```