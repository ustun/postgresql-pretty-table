# A small script to make pretty html tables from psql

## Installation

Put the shell script in PATH. On OS X, `brew install gnu-sed`.

On Linux, change references to `gsed` to `sed` and `open -a Safari` to
`xdg-open` or `firefox` equivalent.

## Usage

1. In psql,
```sql
\H -- html mode
\o test.html
select * from mytable; -- or any other query.
\o -- so that it no longer prints to file
\H -- disable html mode
```

2. In shell,
```shell
make_pretty_table.sh test.html
```
or even better, while staying in psql
```psql
\! make_pretty_table.sh test.html
```

This will create a file `test_enhanced.html` and open it in a web browser.

## Example

To get all tables in the system in html,

In postgres,
```sql
\H -- html mode
\o test.html
\dt+
\o
\! make_pretty_table test.html
```

![unfiltered](https://raw.githubusercontent.com/ustun/postgresql-pretty-table/master/images/unfiltered.png "Unfiltered")
![filtered](https://raw.githubusercontent.com/ustun/postgresql-pretty-table/master/images/filtered.png "Filtered")
