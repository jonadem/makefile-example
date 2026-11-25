# makefile-example

A small C project showing a Makefile with automatic dependency tracking, and debug/release builds.

## Structure

```
.
├── Makefile
├── include/hellofunc.h   # public header
└── src/
    ├── hellomain.c       # main()
    └── hellofunc.c       # printHello()
```

## Requirements

- `gcc`
- `make`
- A POSIX-like shell (the Makefile uses `mkdir -p` and `rm -rf`; on Windows use MSYS2, Git Bash or WSL)

## Usage

```sh
make                # debug build (-g -O0)
make BUILD=release  # release build (-O2)
make clean          # remove build/ and bin/
./bin/helloworld    # run
```

Switching `BUILD` does not rebuild existing objects automatically; run `make clean` first.

## Details

- Compiles with `-Wall -Wextra -Werror -std=c11`.
- Objects go to `build/obj/`, the executable to `bin/helloworld`.
- Header dependencies are tracked through `-MMD -MP` generated `.d` files.

## Inspiration

This project is inspired by the article [How to Make a Professional Makefile for C Language Projects](https://dev.to/farhadrahimiklie/how-to-make-a-professional-makefile-for-c-language-projects-2d4e) by Farhad Rahimi Klie on dev.to.
