# EINA Privacy Violations

Some (in my opinion) privacy violations allowed by Unizar.

# Humans.db

A database that you *could* extract from multiple sources
(hypothetically)

## Sources

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

### group

A file with the same structure of an standard `/etc/group/` UNIX file

It's conformed of the following fields, separated by `:`:
- group name
- `*`: I actually don't know what this is
- group number
- usernames in the group, separated by commas

`getent group` in certain places.

### passwd

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

### students.csv

A CSV file with the following fields:
- DNI
- Full name
- Bachelor

Some `pdfgrep | sed` magic in Census files (published openly by Unizar,
like [this](
http://eina.unizar.es/archivos/2016_2017/Elecciones/ESTJdE/Censo_Definitivo_JdE_Estudiantes_EINA.pdf))
should give this file easily.

### subject

A file with 2 fields separated by `:`:
- Subject number
- Subject name

Some web scrapping of the Bachelors' pages (like [this](
http://titulaciones.unizar.es/estudios-arquitectura/cuadro_asignaturas.html))
will give you this.

## process-usernames

This simple script will help with nip identification.

It need a files in this directory (called `humans`), with the
following structure:

    <nip1> = <name1>
    <nip2> = <name2>
    <nip3> = <name3>
	...

How to get that file is your work. You could ask nicely to all of your
friends, so you can have all their nips. Or you could use something
like:

	getent passwd | cut -d: -f 1,5 | sed -e 's/a\([0-9]\{6\}\):\(.*\)/\1 = \2/' -e 's/\([^:]*\):\(.*\)/\1 = \2/' > humans

in certain server (its name rimes with POSIX). Relax, it's not fast.


After that, the instruction are simple. Just get the information you
want to identificate in plaintext (For PDFs, you have the tool
`pdfgrep`, something like `pdfgrep '^.*$' <file> > plain.txt` will
give you the PDF in plaintext format).

Once you have the plaintext, simply do

	cat plain.txt | ./process-usernames.sh

or

	./process-usernames.sh plain.txt

To get the text with the enhancements
