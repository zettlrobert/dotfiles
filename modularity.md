# Modularity

By default we have `hardware-configuration.nix` and `configuration.nix` files, they are both modules.

Modules are technically just functions that accept attribute sets, of config and pkgs.
They return an attribute set of configuration options.

## Suggested Structure

System level modules
User level modules

### Functions in Nix

Define a function
function that takes an integer argument and returns the argument +1
technically every function only accepts one argument

    `x: x+1;`

For a function that accepts mutliple arguments we can use

- currying, a function inside a function
  functin that takes x as arugment which is imbedded in a function why that takes x as arugment

  `x: y: x + y`

- passing a single input as an attribute set and use all pieces of the attribute set in the return
  `{x, y,} : x + y`

- nix uses lambda or anonyoumus functions
- we can store functions in variables

```nix
let
    addNumbers = x, y}: x + y;
in

addNumbers  { x = 2, y = 2}; # returns four
```

- when a function is defined we can specify a default for a argument

```nix
let
    addNumbers = {x, y ? 4}: x + y;
in
```

## Common Errors

- files in a repository need to be staged!

