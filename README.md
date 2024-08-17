# software-design-patterns
- [software-design-patterns](#software-design-patterns)
  - [Creational](#creational)
      - [Abstract factory](#abstract-factory)
    - [Builder](#builder)
    - [Factory method](#factory-method)
    - [Prototype](#prototype)
    - [Singleton](#singleton)
  - [Structural](#structural)
    - [Adapter](#adapter)
    - [Bridge](#bridge)
    - [Composite](#composite)
    - [Decorator](#decorator)
    - [Facade](#facade)
    - [Flyweight](#flyweight)
    - [Proxy](#proxy)
  - [Behavioral](#behavioral)
    - [Chain of responsibility](#chain-of-responsibility)
    - [Command](#command)
    - [Interpreter](#interpreter)
    - [Iterator](#iterator)
    - [Mediator](#mediator)
    - [Memento](#memento)
    - [Observer](#observer)
    - [State](#state)
    - [Strategy](#strategy)
    - [Template method](#template-method)
    - [Visitor](#visitor)

## Creational
Create objects, rather than having to instantiate objects directly. This gives the program more flexibility in deciding which objects need to be created for a given case.
#### Abstract factory
* Groups object factories that have a common theme.
### Builder
* Constructs complex objects by separating construction and representation.
### Factory method
* Creates objects without specifying the exact class to create.
### Prototype
* Creates objects by cloning an existing object.
### Singleton
* Restricts object creation for a class to only one instance.

## Structural
Concern class and object composition. They use inheritance to compose interfaces and define ways to compose objects to obtain new functionality.

### Adapter
* Allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class.
### Bridge
* Decouples an abstraction from its implementation so that the two can vary independently.
### Composite
* Composes zero-or-more similar objects so that they can be manipulated as one object.
### Decorator
* Dynamically adds/overrides behavior in an existing method of an object.
### Facade
* Provides a simplified interface to a large body of code.
### Flyweight
* Reduces the cost of creating and manipulating a large number of similar objects.
### Proxy
* Provides a placeholder for another object to control access, reduce cost, and reduce complexity.

## Behavioral
Specifically concerned with communication between objects.
### Chain of responsibility
* Delegates commands to a chain of processing objects.
### Command
* Creates objects that encapsulate actions and parameters.
### Interpreter
* Implements a specialized language.
### Iterator
* Accesses the elements of an object sequentially without exposing its underlying representation.
### Mediator
* Allows loose coupling between classes by being the only class that has detailed knowledge of their methods.
### Memento
* Provides the ability to restore an object to its previous state (undo).
### Observer
* Is a publish/subscribe pattern, which allows a number of observer objects to see an event.
### State
* Allows an object to alter its behavior when its internal state changes.
### Strategy
* Allows one of a family of algorithms to be selected on-the-fly at runtime.
### Template method
* Defines the skeleton of an algorithm as an abstract class, allowing its subclasses to provide concrete behavior.
### Visitor
* Separates an algorithm from an object structure by moving the hierarchy of methods into one object.