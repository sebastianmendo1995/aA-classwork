## W6D2
## Introduction to Metaprogramming

---

But First!

---

#### Let's take a deep breath...
And stretch! A-L-O-H-A

---


## Roadmap

* Foundations
* Ruby
* SQL <<-- Here
* Rails
* JavaScript
* React

---

## Learning Objectives
* Metaprogramming - What and Why?
* Important methods
* Pros and Cons

---

### What does metaprogramming even mean?

When a program _dynamically_ alters itself at runtime.

Note:

* Why does this matter? What does it mean?
* Before we can understand this we need to understand how programs work

---

### Interpreted vs. Compiled Summary

![alt text](https://miro.medium.com/max/1200/1*3Iy-ohRRXj3lChmEbQTxIQ.png)

Note:

* In summary, interpreted languages like Ruby and JS allow for more flexibility and the metaprogramming magic we are starting to become familiar with
* You might ask, well then why aren't all languages interpreted?
  * And one of the main reasons for this is because it is faster and have less moving parts
* You have your source code and that file, that code, is simply read by someone (aka analyzed by another program) and it's going to be executed
  * There's nothing in the middle
* You have your source code, it first must be compiled (turned into machine code with instructions, memory addresses, etc.) and the result of this is what gets executed
  * There _is_ something in the middle

---

### Uses for Metaprogramming

1. Create your own language (DSL)... RSpec?
3. Aggressively remove duplicated code
4. Stretch and twist Ruby to your own specific needs

Note:

* You may want to create your own language
  * RSpec is DSL because it is based around Ruby but serves a different purpose (testing)
  * They didn't have to invite literally a new language but instead used metaprogramming to create a language out of another language
* Simply to remove duplicated code that's all over the place
* Or to learn how you can get everything possible out of Ruby and use it to your advantage

---

### Introspection

  * `self`
  * `Object#class`
  * `Class#superclass`
  * `Module#ancestors`
  * `Object#methods`
  * `Module::instance_methods`
  * `Object#is_a?`
  * `Object#instance_of?`
    
Note:
* Introspection - the program can examine information about itself while it's running instead of just at compile time
* In languages like C, variable and function names are lost when translated to machine code
* Languages like C++ and Java provide minimal introspection (i.e. asking for a class name)

Note:
* Read the definition and then walk through the example methods, briefly hitting on each one does

Note:
* After the demo is over:
  * Ruby's nature as an interpreted language is precisely why it lends itself to metaprogramming. Everything is available at runtime and can always be changed - classes, instance variables, etc.

---

### [Metaprogramming Intro & Class Instance Variables](https://vimeo.com/337185643/8c9ff280da) Video


---

## Questions?
#### Metaprogramming Intro & Class Instance Variables Video

* Familiar Syntax
	* `@name` - instance variable
  * `@@count` - class variable (we'll get to this next)
* New Method Syntax
  * `instance_variable_get(:@name)`
  * `instance_variable_set(:@name, value)`

Note:

* Side Note
  * instance variables are for one instance of a class
  * Class instance variables are for the class, but are not inherited by descendants
  * Class variables `@@var`, are inherited from superclass

* We also have the ability to use two methods to get and set the value of our instance variables
  * The first one being `instance_variable_get` that takes the instance variable name as a symbol
    * **important** the `@` is **required**
  * The second one being `instance_variable_set` that takes the instance variable name as a symbol and the value you'd like to set it equal to
* Remember that instance variables as for a single instance, other instances don't share instance variables with one another
* Additionally, class instance variables are for the class and **not** inherited by descendants
* On the other hand, class variables are referenced with two `@` symbols and **are** inherited from superclass
* You really shouldn't be using class instance variables or class variables very often


---



### [Class Variables](https://vimeo.com/337187609/026efc01ff) Video


---

## Questions?
#### Class Variables Video

* Familiar Syntax
	* `@name` - instance variable
  * `@@count` - class variable
* New Method Syntax
  * `class_variable_get(:@@name)`
  * `class_variable_set(:@@name, value)`

Note:

* Side Note
  * instance variables are for one instance of a class
  * Class instance variables are for the class, but are not inherited by descendants
  * Class variables `@@var`, are inherited from superclass

    * **important** the `@@` is **required**
* On the other hand, class variables are referenced with two `@` symbols and **are** inherited from superclass
* You really shouldn't be using class instance variables or class variables very often

---


### [Instance Variables & #send](https://vimeo.com/337188930/5eb83260e2) Video


---

## Questions?
#### Instance Variables & #send Video


* Syntax: `<Object.send(<method name>, *args)`
* Result: dynamically calls method on object
* The method name can be a `String` or `Symbol`
* Method can also be private, even from outside the class definition

Note:

* The first one is `Object#send`
* The use of `Object#send` is called dynamic dispatch because at runtime we can call arbitrary methods
* It sends a message to an object instance and its ancestors in class hierarchy until some method reacts (because its name matches the first argument)
* Note that `send` bypasses visibility checks, so you can call private methods too (useful for unit testing)
* For helpful approach to send: [credit](https://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby)
---

# 10 min break

---


### [`::define_method` & `#method_missing`](https://vimeo.com/337190496/2867b83735) Video


---

## Questions?
#### `::define_method`


* Syntax: `Module#define_method(:name) { |*args| code }`
* Result: defines instance method with given name, input and code
* Known as a **macro**: a class method that defines methods on an instance
  * Examples: `attr_accessor` and `belongs_to/has_many`
* Call within class scope

Note:

* The second one is `Module#define_method`
  * Very similar to just using normal method definition (i.e. `def / end`)

---

## Questions?
#### `#method_missing`
* Called whenever Ruby cannot find a method in the ancestors chain.
* Syntax: `method_missing(name, *args) { code }`
* Result: overwrites `BasicObject#method_missing` to dynamically handle certain method calls
  * have a conditional that will do something if the method name is what you expect
  * else call `super`

Note:

* There is another amazing method that we have available to us, a ghost method, to be specific
  * It's called `method_missing`
* It's called whenever Ruby can't find a method in the ancestors chain
  * It is defined on the highest possible class (BasicObject)
* It's very convenient way to be able to dynamically handle certain method calls
* Here we can see the syntax for it
* We could override it in one of our classes and check if they call a specific method (that isn't defined), else call `super` and it'll use `BasicObject#method_missing`, continuing to do what it would normally do
  * The overriding of method_missing is also called Dynamic Proxy.

---
### Pros of Metaprogramming

* Powerful if you know what you're doing
* Get more done with less code
* Must for certain products

---

### Cons of Metaprogramming

* Dangerous if you don't know what you're doing
* Confusing, less readable
* Doesn't play well with syntax coloring
* Difficult to read & modify

---

## Done!
