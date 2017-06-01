# humans.db

This collection of tools allows you to create a little database with some information "offered" by EINA.

# Installation

## From source
You can do a manual installation with:

```bash
git clone https://github.com/wynro/humans.git
cd humans
sudo make install
sudo make install-doc # Optional, but gives documentation (man)
```

And a removal with:

```bash
git clone https://github.com/wynro/humans.git
cd humans
sudo make uninstall
sudo make install-doc # Optional, if you installed documentation
```

In both cases, remember to install/uninstall the required dependencies (Subsection **Dependencies**)

## From packages
Go to the releases list (https://github.com/wynro/humans/releases), and download the desired package. You can easily install the package with:

```bash
sudo dpkg -i humans_.*_all.deb
```

And remove it with:

```bash
sudo dpkg -r humans
```

In both cases, remember to install/uninstall the required dependencies (Subsection **Dependencies**)

## Dependencies
Either if you install from sources o from package, you need to install all the required dependencies manually. Neither `dpkg` nor `make` install the dependencies.

The current dependencies are`coreutils, python, pdfgrep, sqlite3, curl, openssh-client, sed, grep, bsdmainutils and libc-bin`. You should have most of those installed in any typical Debian/Ubuntu installation. In case you miss some of them, simply do:

```bash
sudo apt-get update
sudo apt-get install -y coreutils python pdfgrep sqlite3 curl openssh-client sed grep bsdmainutils libc-bin
```

To install the missing dependencies.

Remember to also remove any unnecessary package on uninstall.

# Basic usage

**This is a basic guide, the man pages are guaranteed to be more up-to-date, so I recommend to refer to them for detailed/extended/current information**

After the installation (Section **Installation**) of the program, you have to create the database (an example one comes with the package, but it is empty and only includes the schema).

First, you need to download the information from the sources and save it in local plain text files, for that, execute:

```bash
humans-get-sources
```

That will create a bunch of files in */tmp/humans*. Those files contain the information in plain text, but we need to compile them into a structured database, to simplify doing queries to the information. For that, just do:

```bash
humans-load
```

<!-- As always, permission problems -->
This will create a `humans.db` file in your current directory. Move it to its correct location with:

```bash
sudo mv humans.db /usr/share/humans/humans.db
```

And now you are ready to explore the database with the command `humans`. It includes a beautifully made manual (in `man humans`) and Tab-completion, so feel free to explore all its possibilities.

**Have fun!**
