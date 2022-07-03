# genC

Generate similar C source files from templates and a Makefile

## Objective

This repository is for personal use. It is not a general purpose tool, be aware that it may not work for you.

## Installation

* Clone this repository;
* Add `alias genc="bash PATH/TO/generate.sh"` on your aliases file.

## Usage

```bash
genc <number of files>[force] [template]
```

* `number of lines` (REQUIRED): The number of files to generate;

* `force` (OPTIONAL): The level of force applied to the current working directory. There are four levels:

    | Level | Representation | Description                                                                     | Default |
    | ----- | -------------- | ------------------------------------------------------------------------------- | ------- |
    | 0     |                | No files will be overwritten if encountered                                     | Yes     |
    | 1     | `!`            | Only C source files will be overwritten if encountered                          | No      |
    | 2     | `!!`           | C source files and the Makefile will be overwritten if encountered              | No      |
    | 3     | `!!!`          | The directory C source files and Makefile will be deleted before the generation | No      |

* `template` (OPTIONAL): The base template to be used from the [`templates/`](templates) directory, if not specified, the [`default`](templates/default.c) template will be used.