---
layout: post
title: "Kata: Roadmap and Vision"
thumb: /img/kube-wire-black.png
---

This project, Kata, is a large undertaking. It's the culmination of years of research into the state of programming languages and software development processes. Writing this post is a way to share my thoughts and ideas with the world, and to get feedback on the direction I'm taking. KataScript, a programming language, is the first step in this journey, as it lays a foundation for implementing the rest of the project.

Most of the things mentioned on this page I've already made, but I'm iterating on their design constantly and prototyping. The "alpha" of Kata (which was just a C-based interpreter) is called kscript, and can be found at [kscript.org](https://kscript.org), with the code located at [github.com/chemicaldevelopment/kscript](https://github.com/chemicaldevelopment/kscript). Some other links you can check out while Kata proper is being developed:

  * [kscript Web REPL (fully featured, works in your browser!)](https://term.kscript.org)
  * [kscript documentation (stdlib, builtins, syntax, philosophy)](https://docs.kscript.org)

<!--more-->

## Goals

Kata aims to be a complete software ecosystem that can be used to develop programs that run on desktop, web, edge, and other platforms from a single source. Additionally, it should have a nearly-comprehensive standard library so that developers can focus on the problem they're trying to solve, rather than the tools they're using to solve it with.

Most widely used programming languages are fairly old (since adoption is a slow process), and have been designed with a specific set of constraints in mind. For example, C was designed to be a low-level language that is compiled to run on a wide variety of hardware. Python was designed to be a high-level language that is quick to prototype ideas with. These languages are great for their intended use cases, but they're not ideal for all use cases. For example, C is not a good choice for writing web applications, and Python is not a good choice for writing low-level drivers (although, these are possible with some effort). However, due to trends in computing and the connected-ness of technology we see today, abstraction in software is more important than ever, and being able to use a single language across applications and libraries can increase iteration speed and decrease cognitive load.

By being able to use a single language for any use case, efficiently, and without sacrificing portability, developer productivity should increase, as well as the quality of code. You can read more about the goals and design philosophy of Kata on the [Philosophy of Kata page](/philosophy). 

## Tasks

To accomplish these goals, we need to break the effort into smaller subtasks that can be accomplished independently. At a high level, the components of Kata are:

  * KataScript (`ks`), the programming language and runtime for using Kata
    * Parser, lexer, compiler, and optimizer components for entire pipeline
      * Requires modules: `ks` (KataScript AST), `ir` (intermediate representation), `opt` (optimization hints and passes), `kvm` (Kata virtual machine), `kdb`: (Kata debugger)
    * LLVM support for JIT compilation, cross compilation, and optimizations
  * Modules: builtin types/funcs and standard library modules
    * Types: `any`, `int`, `real`, `str`, `range`, `tuple[T]`, `list[T]`, `tensor[T]`, `set[T]`, `dict[K,V]`
      * Hardware types: `f32`, `f64`, `u8`, `s8`, `u32`, `s32`, `usize`, `ssize`, etc
    * Common datastructures (pattern matching `pm`, computer science utils (`cs`), input/output serialization (`io`)), APIs (operating system (`os`), networking (`net`), command-line interfaces (`cli`), timing (`time`), and useful references (`unicode`)
    * Utility packages for different disciplines (`math`, `sci`, `lang`, `nx` (numerics), `nn` (neural networks), `xyz` (data visualization, graphing))
    * Third party code that is a requirement (encryption, compression, serialization, formats)
      * Cryptography: `ssl` (OpenSSL), `krypt` (higher level Kata tooling)
      * Compression: `.lz4`, `.gz`, `.xz`, `.bz2`
      * Formats: `.md`, `.json`, `.yaml`, `.tar`, `.svg`, `.png`/`.jpg`/`.webp`, `.wav`/`.flac`/`.ogg`
      * Serialization: `.pb` (Protocol Buffers), `.bson` (Binary JSON), `.kio` (Kata object stream), `.csv`, `.ksv` (CSV, but better! `ksv` module in stdlib)
  * Kata Shell (`kash`), a shell for improved productivity, and without all the syntax baggage from the bash-family of languages
    * I use ZSH, but in my opinion it's just passable for a shell. It tries to much to emulate bash (understandably), but I constantly have to google simple things because the design is convoluted
    * I want a shell that is easy to use and I always know what code is doing. I'm tired of constantly using hacks, leaky string comparisons, and praying that it doesn't break on another platform.
  * Kata Package Manager (`kpm`), a package manager for installing and manipulating Kata packages
    * Should be the default way to build, distribute, and release software
    * Includes packaging logic, dependency management, and compilation settings
  * External packages, for common workflows in other languages
    * Including bindings is very useful for interoperability, the package `ffi` (for `libffi`, C/C++ interop)
    * For example: `llvm`, `sdl`, `sfml`, , `gtk`, `fltk`, `tk`, `nuklear`, `opengl`, `glfw`, `vulkan`, `cuda`/`hip`, `torch`, `git`, `usb`, `bluetooth`, `i2c`, `blender`, `ffav` (ffmpeg libs), `sqlite`, `opencv`, `gsl`, `cairo`, `vlc`, `flint`, `pari`, `pdfio`, `stb*`, 

### Plan: KataScript

KataScript needs to be [bootstrapped](https://en.wikipedia.org/wiki/Bootstrapping_(compilers)), which means it should be able to compile itself. This has many benefits, such as:

  * It's a good way to test the compiler, as it can be used to compile itself
  * It removes the need for a separate compiler written in another language
  * It can use its own standard library, JIT compiler, and so forth increasing performance

Unfortunately, this is not a straightforward process; it requires multiple steps since we don't yet have a compiler written in KataScript, for KataScript. The first step is to write a basic implementation in another language, which implements all the features you need for a compiler. From there, you can implement the compiler in KataScript, and use the initial implementation to compile the KataScript-native compiler. Then, repeat the process again using the newly compiled KataScript-native compiler to re-compile itself with full optimizations.

At the end of the process you should have a fully-featured compiler written in KataScript, which is completely independent of the initial implementation. For completeness, let's write down the steps:

  1. Write an interpreter/compiler in another language (I'll be using C, and calling it `cks`)
  2. Write a KataScript compiler in KataScript code (Call this `ks` proper)
  3. Run `ks` with `cks`, which will be slow and inefficient. Call this `ks0`
  4. `ks0` should be fully featured, and now can be used to recompile `ks` with optimizations resulting in `ks` proper, fully optimized
  5. `ks0` and `cks` are no longer needed, and can be removed from the project

The code for KataScript and most of the standard library can be found at: [github.com/kataguide/kata](https://github.com/kataguide/kata). The progress and roadmap are implemented as [GitHub issues](https://github.com/kataguide/kata/issues).

### Plan: Builtin Types/Funcs/Modules

Once KataScript (`ks` proper, from above) is implemented, the rest of the standard library can be implemented in KataScript and enjoy the benefits of optimizations, JIT compilation, and share the same runtime. Builtin modules will be included in the standard distribution, but not included in built programs unless they are used, so that the size of the executable is minimized.

In general, the builtin types and functions are the most important and universal on all platforms:

  * `any`: type description

TODO: Finish this post.
