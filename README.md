# Objective-C: Unexpected Crashes with `performSelector:withObject:afterDelay:`

This repository demonstrates a common, yet subtle, error in Objective-C related to the use of `performSelector:withObject:afterDelay:`.  The issue arises when the target object is deallocated before the delayed selector is executed, resulting in an unexpected crash.

## The Problem

The `performSelector:withObject:afterDelay:` method is convenient for scheduling code execution, but requires careful management of object lifetimes.  If the object that's scheduled to perform the selector is released before the delay expires, a crash will occur when the runtime attempts to invoke the selector on a deallocated object.

## The Solution

The solution involves ensuring the object's lifetime extends beyond the delay period. This often involves using techniques such as strong references or weak references in conjunction with proper memory management. The updated code provides an example using a weak-strong pattern to resolve this issue.