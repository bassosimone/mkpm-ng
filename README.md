# Measurement Kit Package Manager

[![Build Status](https://travis-ci.org/bassosimone/mkpm-ng.svg?branch=master)](https://travis-ci.org/bassosimone/mkpm-ng)

MKPM is Measurement Kit Package Manager (well, sort of...). Specifically, it is
a script functional to Measurement Kit development that performs the following
taks:

1. allows you to generate the scaffolding of a Measurement Kit subproject

2. automates building of dependencies (e.g. libevent, tor)

This repository contains the script itself (`./script/mkpm`), the
specification for building dependencies (see inside `./mkpm_modules/pkg`),
and all the scaffolding files for generating a new Measurement Kit
subproject (see inside `template`).

## Generating the scaffolding of a new project

Copy `script/mkpm-scaffolding` inside the empty directory of the project
and then run the following command:

```
./script/mkpm-scaffolding
```

This will download from GitHub all the scaffolding you need for developing
a subproject of Measurement Kit. Among other things, this will install a new
up-to-date version of MKPM at `./script/mkpm`.

## Updating scaffolding files

To sync-up with later upstream change in scaffolding files, run:

```
./script/mkpm scaffolding
```

To auto-generate a `include.am` file telling automake how to install your
headers and compile your tests and examples, run:

```
./script/mpkm autohelp
```

This will also update the `.gitignore` file.

## Compiling dependencies and using them

MKPM allows you to download, patch, compile and use dependencies commonly
used by Measurement Kit. The command to do that is this:

```
./scripts/mkpm install [name]
```

For example, to download, compile, etc. Tor and all its dependencies you
run this command:

```
./scripts/mkpm install zlib libressl libevent tor
```

Sources are downloaded and compiled in `./mkpm_modules/src/$package`, and
headers and libraries are installed inside `./mkpm_modules/dist`. Files
inside such directory follow the Unix convention (i.e. headers are inside
`/include`, libraries inside `/lib`).

To use the compiled dependencies, either manually set `CPPFLAGS` and
`LDFLAGS` to point to `./mkpm_modules/dist`, or use the `shell` subcommand,
which will do that for you. For example,

```
./scripts/mkpm shell ./configure [--flags]
```

## Support for cross compiling

We already include "plumbing" script for cross compiling under iOS and we
will port similar scripts from Measurement Kit for Android.

The plumbing script for iOS is named `mkpm-cross-ios-plumbing`. You tell it
as its first argument the iOS architecture for which you want to cross
compile, and then a command to execute. It sets the proper configuration
variables, and then executes such command. If you don't specify any further
command it just prints all the environment variables.

To cross compile Tor and all of its dependencies for iOS/arm64, run the
following command:

```
./scripts/mkpm-cross-ios-plumbing arm64                                        \
    ./scripts/mkpm install zlib libressl libevent tor
```
