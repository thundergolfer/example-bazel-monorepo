<h1 align="center">goodreads-sh</h1>
<p align="center">
    <a href="https://travis-ci.com/thundergolfer/goodreads-sh">
        <img src="https://travis-ci.com/thundergolfer/goodreads-sh.svg?token=yHGWQ42iK2BPk1FjaUMc&branch=master">
    </a>
    <a href="https://ci.appveyor.com/project/thundergolfer/goodreads-sh">
        <img src="https://ci.appveyor.com/api/projects/status/y7su4tvu6agdkmc7?svg=true">
    </a>
</p>
<p align="center">Command line interface for <a href="https://goodreads.com" > Goodreads</a>. Focuses on letting you quickly update your current reading activity, and giving you quick access to what your friends are reading.</p>
<p align="center">
<a href="https://i.imgur.com/42j4zAW.gif"><img src="https://i.imgur.com/42j4zAW.gif" width="700"/></a>
</p>



--- 

> ⚠️ **Notice:** This is only my 2nd Rust project, after [`slackify-markdown`](https://github.com/thundergolfer/slackify-markdown), and so while the project is functional the code is _not_ pretty.

## Installation

#### Homebrew

Easiest way to install on macOS is by using [Homebrew](https://brew.sh/).

```
$ brew tap thundergolfer/homebrew-formulae
$ brew install goodreads-sh
```

#### Manual Installation

You can get binaries for OSX and Linux on this project's [releases page](https://github.com/thundergolfer/goodreads-sh/releases).

After downloading, you unzip the `.tar.gz` and move the binary to a place that's on your path (`$PATH` on Linux/OSX).

#### [Required] Developer key
`goodreads-sh` requires your developer key and developer secret in order to read-write to the goodreads API. Obtaining them is fairly trivial.

1. Access your developer key and secret [here](https://www.goodreads.com/api/keys).
2. Copy your developer key and secret over to `goodreads-sh`'s config file. `~/.goodreads.toml`
```sh
developer_key = "<your_key_here>"
developer_secret = "<your_secret_here>"
```

Your config file should already be present in your home dir `~/.goodreads.toml` and if it's not, then run the command once without any options or create the file manually.

## Usage

```bash
USAGE:
    goodreads-sh <SUBCOMMAND>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    add-to-shelf    Add a book to an existing shelf (eg. currently-reading, to-read)
    auth            Setup OAuth for the CLI (1 time only)
    finished        Tell Goodreads you've finished a book that you're currently reading
    help            Prints this message or the help of the given subcommand(s)
    me              Show your User ID
    new             Tell Goodreads you've started a new book
    update          Update progress on a book you're currently reading
```

## Credit

- Kudos to [Danish Prakash](https://github.com/danishprakash/) for his implementation, [`goodreadsh`](https://github.com/danishprakash/goodreadsh), which I used and learned from while I developed this CLI. 🙏
