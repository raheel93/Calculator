# Calculator

An iOS calculator app written using the MVVM architectural pattern (model-view-viewmodel).

Features:
* Basic math (addition, subtraction, multiplication, and division)
* iPhone and iPad support
* Localization
    * Formats numbers based on the device's locale
    * Supports right-to-left languages
    
# Architecture
    
There are three layers to the architecture:

1. View layer (topmost layer)
    * Consists of views, view controllers, constraints, colors, fonts, etc. This is the only layer that uses UIKit.
    * Binds data from the view model layer to the views
2. View model layer
    * Packages the model layer in a manner that is suitable for presentation by the view
    * Is reusable if the app were to be ported to other platforms, such as macOS
3. Model layer (bottommost layer)
    * Contains business logic

# Test Suite

There is a test suite that exercises the model layer and some of the view model layer. My main goal for the test suite was to provide confidence when refactoring. As a result, the tests treat the system as a black box (i.e., they doesn't assume any knowledge of the internals of the system). The tests always go through the API of the object under test.

The tests paid off big time. They caught many bugs introduced during refactoring that would have otherwise gone unnoticed.

The test suite is designed around testing behaviors of the system, not testing classes or methods. As a result, there is not a 1:1 correspondence between test cases (subclasses of `XCTestCase`) and classes in the system. In fact, the main model class (`ConcreteCalculator`) is tested by multiple test cases that each exercise a different group of behaviors. For example, there are test cases exercising addition, subtraction, number entry, localization, etc.

# TDD Practice

I used this project as an opportunity to practice TDD. I wrote tests first the vast majority of the time for the model layer. I did test-after for the view model layer. I did not write tests for the view layer. In total, the tests cover ~90% of the code in the project (as measured by Xcode's code coverage tool).
