---
layout: page
title: fibonacci
summary: A simple mathematical example, demonstrating recursion
parent: Tutorials
nav_order: 2
---

# Tutorial: `fibonacci`

[Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number) are numbers that show up in nature, and are related to the [Golden Ratio](https://en.wikipedia.org/wiki/Golden_ratio) and many other phenomenon. They can be defined mathematically as:

$$ F_0 = 0 , F_1 = 1 $$

$$ F_n = F_{n-1} + F_{n-2} $$

The first few Fibonacci numbers are: 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on. In this tutorial, we'll show how to write a KataScript program that calculates and displays Fibonacci numbers. 

## Defining Functions

Given our mathematical definition, ($ F_n = F_{n-1} + F_{n-2} $), we can define a reusable function to calculate $ F_n $ given $ n $. To do that in KataScript, we use the `func` keyword:

```ks
# fibonacci.ks - calculates Fibonacci numbers and displays them

# define a function that calculates the nth Fibonacci number, named "fib"
func F(n) {
    # base case definitions
    if n == 0 || n == 1, ret n

    # return a value from the function, using the "ret" keyword
    # calculate the value recursively, from the mathematical definition
    ret F(n - 1) + F(n - 2)
}

```

But, this alone won't actually compute any Fibonacci numbers. We need to call the function, and display the results to the user.

## Displaying Results

To display results to the console, we can use the builtin `print()` function which prints the arguments it is given, followed by a newline:

```ks
# ... continued from above

# prints: 0
print(F(0))
# prints: 1
print(F(1))
# prints: 8
print(F(6))
```

## Syntax

Before we dig too deep on how this works, a few notes on the syntax of KataScript:

  * Lines beginning with `#` are comments, and are ignored by the compiler
    * They exist to explain the code, making it more readable for developers
  * The `func` keyword is used to define a function, and inside `()` are the parameters
    * This example defines a function named `F` that takes a single parameter, `n`
  * The `if` keyword is used to define a conditional statement
    * This example checks if `n` is equal to `0` or `1`, and if so, returns `n` (the base case definitions)
  * The `ret` keyword is used to return a value from a function
    * Later on, this is what a function call "produces" as its value
  * The `F(...)` means we are calling a function. Inside the `()` are the arguments
  * The operators `+` and `-` are addition and subtraction, respectively

The code outside of the function definition (i.e. the `print()` calls) are executed once when the program is ran. The code inside the function definition is executed every time the function is called, and never executed if the function is never called.





