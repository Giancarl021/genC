# genC

Generate similar C source files from templates and a Makefile

## Objective

This repository is for personal use. It is not a general purpose tool, be aware that it may not work for you.

## Installation

* Clone this repository;
* Add `alias genc="bash PATH/TO/generate.sh"` on your aliases file.

## Usage

```bash
genc <number of files> [template]
```

* `number of lines` (REQUIRED): The number of files to generate;

* `template` (OPTIONAL): The base template to be used from the [`templates/`](templates) directory, if not specified, the [`default`](templates/default.c) template will be used.

> **Important:** The script will **OVERWRITE** existing files, be careful!