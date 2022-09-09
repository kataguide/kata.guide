---
layout: page
permalink: /philosophy
title: Philosophy
description: Design philosophy, principles, and rationale for implementing Kata
nav_order: 3
---

# Philosophy of Kata

Kata is and will always be Free and Open Source Software (FOSS), licensed under the [Kata Public License (KPL)](/kpl). Kata is also designed to run on many different platforms, including most desktop, web, and HPC systems. 


![Kata Name Origin](/img/kata-name-origin.webp){: .img-left }

## Meaning of 'Kata'

Kata gets its name from the Greek [κατά](https://en.wiktionary.org/wiki/%CE%BA%CE%B1%CF%84%CE%AC#Ancient_Greek), which has a few related meanings shown in this figure. It primarily means 'downwards', referencing the fact that programs are written in a [top-down fashion](https://en.wikipedia.org/wiki/Top-down_and_bottom-up_design). 

Kata's name was picked for a few different reasons:

  * It's easy to say and remember
  * Short enough to quickly type
  * 'K' is a cool letter, relatively uncommon as a prefix


<div style="clear: both;"></div>

## Conceptual Models

Kata is designed with a unifying philosophy of mathematics and computation in mind, based on [Mathematical Platonism](https://en.wikipedia.org/wiki/Philosophy_of_mathematics#Platonism) and [Digital Philosophy](https://en.wikipedia.org/wiki/Digital_philosophy):

> Mathematical Platonism is the metaphysical view that there are **abstract mathematical objects whose existence is independent** of us and our language, thought, and practices. 
> 
> **Just as electrons and planets exist independently of us, so do numbers and sets**. And just as statements about electrons and planets are made true or false by the objects with which they are concerned and these objects’ perfectly objective properties, so are statements about numbers and sets. 
>
> **Mathematical truths are therefore discovered, not invented.**
>
> -- [*Platonism in the Philosophy of Mathematics*](https://plato.stanford.edu/entries/platonism-mathematics/), by Øystein Linnebo (Stanford)

![Theory of Forms diagram](/img/theory-of-forms.webp){: .img-right }

On a conceptual level, this allows for a more expressive and dynamic language that more closely mirrors programmers' intentions, rather than the particular steps a given machine may take to achieve such intentions. As a result, written programs can be more easily read by others, including those who are not familiar with computers at a low level.

On a practical level, this allows for efficient implementation of concepts on different hardware situations, which is a useful and neccessary feature for the future of ubiquitous computing:

  * Kata is designed to prevent hardware lock-ins, which is a common problem in the software industry
  * Kata is open source by design, and encourage FOSS applications/libraries that can be shared across operating systems, platforms, and hardware


<div style="clear: both;"></div>

## Differences

### "Why Not Language {X, Y, Z}?"

Of course, there are many languages that Kata is *not* based on. It would be an impossible task to describe its relation to each one. Instead, here are a few of the most popular languages, and why they didn't satisfy the use cases of Kata:

  * C/C++: great for portability and performance, but severely lacking in composition, type systems, and the syntax has too many quirks that limit developer productivity
  * C#: a very well designed language, but within the larger .NET/CLR ecosystem (which is theoretically cross platform, but mysteriously very few apps written in it ever end up running outside of Windows...), and leans too much into the C-style syntax and pure-academic object-oriented programming paradigms
    * F# and other .NET languages are easy-interop with each other, but they share the same .NET/CLR ecosystem
  * Python: great for high level problem solving, "driver" code (as opposed to "engine"), but syntax is terrible (relevant whitespace, TitleCase constants, abuse of `:`, weird naming conventions, awkward syntax for `lambda`, the list goes on). Also, the standard library is just... not designed well. So many quirks, inconsistencies, and odd formulations (not to mention "hello, world" breaking!) that could have been designed better.
  * Rust: [it's difficult to learn](https://vorner.github.io/difficult.html). For very difficult problems (like writing a web browser), it may be the language of choice, but it has an undue cognitive burden for a general programming language.
  * JavaScript: No explanation needed. A language designed in a week that we're all stuck with.
    * TypeScript/CoffeeScript/AnotherDerivativeScript23: these suffer from most of the problems JavaScript does and typically use the same [terrible tooling](https://www.npmjs.com/). It's more of an ecosystem problem than a language design problem (TypeScript has a much better design than classic JavaScript), and adding another unifying JavaScript clone language is not going to make things any better

### What about Python?

[Python](https://www.python.org/) is a dynamic programming language used by new programmers and experienced data scientists alike. Community packages ([NumPy](https://numpy.org/), [PyTorch](https://pytorch.org), and so on) make common tasks and quick iterations easier for programmers, accelerating development.

Kata and Python both share a lot of design goals (easy to learn, high level, cross platform), but we think Python has some design flaws:

  * syntactical oddities and inconsistent style choices
    * relevant whitespace means that auto-formatting Python code is impossible (since indentation == block depth, changing the format would change the program). it also can create (silent) bugs when pasting code from a source online
    * builtin constants are `TitleCase` (`True`, `False`, ...), which trips up many beginners, and is more difficult to type than lower-case versions
  * lack of the ability to distribute to multiple platforms/machines
    * in particular, Python lacks a (convenient,reliable) way to run in a web browser, or distribute code without using third party solutions
    * Kata has distribution of code as a first-class use case, whereas Python has no builtin solution to do this besides assuming everyone else already has Python installed

### What about JavaScript?

[JavaScript](https://en.wikipedia.org/wiki/JavaScript) is a programming language written and designed about 10 days. It is also currently the obvious choice for any page on the internet or mobile application. Reality is often stranger than fiction...

One thing JavaScript and Kata share in common is the goal of being able to run on any browser, under any conditions. Universal deployment is indeed a critical goal for any modern application, and JavaScript (and ecosystem) pioneered this area.

JavaScript was not created with any kind of ecosystem in mind a-priori, so everything is basically ad-hoc. There's no single way to write JavaScript apps -- the workflow depends on which framework and setup you're using (not to mention variants, like TypeScript, CoffeeScript, ...). Additionally, poor design choices made development very difficult, limiting the ability to write high quality code:

  * type coercion and loose type system make little intuitive sense to most people (prompting the creation of `===` (the triple equals))
  * the lack of composable components, and difficult prototypal type system makes it a pain to implement even simple datastructures
  * the lack of a standard library causes an abundance of low-quality duplicate code (for example, the [leftpad fiasco](https://qz.com/646467/how-one-programmer-broke-the-internet-by-deleting-a-tiny-piece-of-code/))
