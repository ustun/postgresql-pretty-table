# A small script to make pretty html tables from psql

## Installation

Put the shell script in PATH. On OS X, `brew install gnu-sed`.

On Linux, change references to `gsed` to `sed` and `open -a Safari` to
`xdg-open` or `firefox` equivalent.

## Usage

1. In psql,

    \o test.html
    select * from mytable; -- or any other query.
    \o -- so that it no longer prints to file


2. In shell,

  make_pretty_table.sh test.html

This will create a file `test_enhanced.html` and open it in a web browser.

## Example

To get all tables in the system in html,

In postgres,

    \o test.html
    \dt+
    \o

In shell,
    make_pretty_table test.html

![unfiltered](https://github.com/ustun/postgresql-pretty-table/images/unfiltered.png "Unfiltered")
![filtered](https://github.com/ustun/postgresql-pretty-table/images/filtered.png "Filtered")
