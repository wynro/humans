# Humans.db

A database that you **could** extract from multiple sources
(hypothetically)

# Sources

All the places from which you can extract interesting information

You need a directory called `sources`, with all the described files in
the given format

We need at least 4 sources to fully complete the database:
- group: Relationship between nips and subjects
- passwd: Relationship between names and nips
- subject: Relationship between subject numbers and names
- students.csv: Relationship between DNIs, names and bachelors

Most can easily be obtained with Linux tools (like pdfgrep, getent,
sed...)

## group

A file with the same structure of an standard `/etc/group/` UNIX file

It's conformed of the following fields, separated by `:`:
- group name
- `*`: I actually don't know what this is
- group number
- usernames in the group, separated by commas

`getent group` in certain places.

## passwd

A file with the same structure of a standard `/etc/passwd` UNIX file

It's conformed of the following fields, separated by `:`:
- username
- `x`: I actually don't know what this is
- user id
- user primary group
- full name
- home directory
- preferred shell

`getent passwd` in certain places.

## students.csv

A CSV file with the following fields:
- DNI
- Full name
- Bachelor

Some `sed` magic in Census files (published openly by Unizar) should
give this file easily.

## subject

A file with 2 fields separated by `:`:
- Subject number
- Subject name

Some web scrapping of the Bachelors' pages (like
http://titulaciones.unizar.es/estudios-arquitectura/cuadro_asignaturas.html)
will give you this.
