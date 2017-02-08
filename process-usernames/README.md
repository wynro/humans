# process-usernames

This simple script will help with nip identification.

It need a files in this directory (called `humans`), with the
following structure:

    <nip1> = <name1>
    <nip2> = <name2>
    <nip3> = <name3>
	...

The instruction are simple. Just get the information you want to
identificate in plaintext (For PDFs, you have the tool `pdfgrep`,
something like `pdfgrep '^.*$' <file> > plain.txt` will give you the
PDF in plaintext format).

Once you have the plaintext, simply do

	cat plain.txt | ./process-usernames.sh

or

	./process-usernames.sh plain.txt

To get the text with the enhancements
