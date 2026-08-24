# Gosu 2026

[![](https://img.shields.io/badge/Gosu-1.14.16-green.svg)](https://gosu-lang.github.io/)

> Haven't used Gosu before. Exploring Java `.jars`, some syntax, dependencies, compilation, etc. Used a *bit* in the Insurance industry.

## Setup and Use

```bash
docker compose up
```

```bash
# Exec in
## Three ways to interact with .gsp

## Gosu - change the package...
### Evaluates the full directory path as the classpath!
gosu src/main/gosu/thoughtscript/io/example/App.gsp

## Inline
gosu -e 'print(\"Hello world!\")'

## Maven
### Fresh compile before-hand...
mvn compile
mvn exec:java -Dexec.mainClass="thoughtscript.io.example.App"
```

## Notes

1. Maven dependencies:
    * `gosu-parent` - contains synchronized dependencies, compiler settings, etc.
    * `gosu-core` and `gosu-core-api` - the actual language and interface.
    * (`gosu-parent` apparently contains both `gosu-core` and `gosu-core-api`.)
1. Although `string` and `String` are interchangeable (apparently, with the former being an alias for the latter akin to C# `object` and `System.Object`). the JIT Interpreter will cry foul:
    ```gosu
    "string" is not a valid type. [line:6 col:30] in
    line 5:   //string is like C# System.Object alias for String...
    line 6:   static function main(args: string[]) {
    line 7:     print("Hello from the Main method!")
    Line Number: 6  Column: 30
    ```
1. The `gosu` JIT interpreter to execute `.gsp` scripts:
    ```gosu
    gosu src/main/gosu/thoughtscript/io/example/App.gsp
    ```
    It seems that going this route requires that package `thoughtscript.io.example` be changed to: `main.gosu.thoughtscript.io.example` since it evaluate the full directory path as the classpath.
1. Maven:
    ```bash
    mvn clean install compile
    mvn exec:java -Dexec.mainClass="thoughtscript.io.example.App"
    ```
1. Gotcha's:
    * Cannot name `Main.gsp` and have `Main` Class within it otherwise it throws a redundant Class Error.
        * `/app/src/main/gosu/thoughtscript/io/example/class/Example.gsp:[3,7] error: Duplicate class found at: thoughtscript.io.example.class.Example.Example.`
    * There is no Main Method in Gosu.
    * Importing using `package` and `uses`. `uses` is primarily for importing Java libraries.
        * FYI - this exploratory example doesn't presently demontrate relative imports or `uses`.
    * Gosu dot notation for accessing fields. `property` for `set` and `get`.
    * `gosu --version` must be run in the Terminal - for some reason adding it to the Dockerfile results in an error.
    * Double `WORKDIR` in [dockerfile](./gosu/dockerfile) due to recommended installation/setup.

## Resources and Links

1. https://github.com/gosu-lang/example-commandline