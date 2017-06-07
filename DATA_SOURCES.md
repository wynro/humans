# Data Sources

The database (specifically the view `ALL_INFO`) currently contains 5 fields, `nip`, `dni`, `name`, `subject` and `bachelor`. All this information is extracted from two sources, EINA's computer system (the user information) and a public Census published openly by EINA.

I am going to comment how to get and relate with each other all this information.

# `nip` and `name`

The nip is obtained from the computer system. All the user information is saved and served in a centrallized network-accesible system. So, we can get the nips by consulting the **passwd** information.

Given that EINA uses a network login, the `/etc/passwd` of each computer is basically empty, so we have to use the command `getent`, which will check the LDAP system, and will give back all the necessary information, and example of one of those registers is:

```
a604409:x:1604409:1000000:Guillermo Robles GonzAlez:/home/a604409:/bin/bash
```

This is a double colon separated list of fields, like every `/etc/passwd` file in a *nix computer. In our case we only care about the fields 1 and 5, those give us the nip of the person and its name.

(As an interesting addendum, every student has its own group, identified by 1<nip>, and the group alumnos, that cover all the students in EINA)

# `subject`

Every subject has its own group, identified by `g + <subject code>` (for example, the System Administration II subject has the group `g30257`), and every student that is registered in the subject is also registered on the group (As a guess, I think this is done to separate permissions, as in a System Administration student is allowed to create virtual machines, but someone in Human-Computer Interaction is not). So we can use the *nix db **groups** to get the required information (also with the `getent` program). And example of one of those registers is:

```
g30257:*:1030257:a593258,a553939,a699623,a685127,a691812,a696132,a620546,a702089,a682405,a609438,a700480,a687369,a647973,a686194,a516206,a559207,a473555,a486864,a697662,a593173,a579901,a590114,a696773,a699328
```

As we can see, exactly the same as before, its just a double colon separated list of fields. In this case, the interesting fields are the 1 and the 4. The first one contains the subject code (prepended with `g`) and the fourth is the list of student usernames in the subject. The name of the subjects can be easily obtained in the bachelor pages (like [this](http://titulaciones.unizar.es/ing-informatica/cuadro_asignaturas.html)) simple string matching is all that its left to associate all of this into a complete database.

# `dni` and `bachelor`

This is the interesting part. The basic information can be obtained via the already mentioned pdf, but as anyone can tell, pdf is not simple to parse and analyze, so we need to convert it into a more malleable format, like simple text. For that we use `pdfgrep`, a simple tool that allows us to do searching and matching in pdf files. Like `grep` but for pdfs.

Using a matching pattern like `'^.*$'` gives us all the line in a pdf (although we can be a little more refined if we need/want)

As so, after some `sed` magic, we get `student.csv`, which is the pdf information in `csv` format.

After that, we simply need to connect all that information with the previously obtained one to create the full database.

There is a small detail in this matching (apart from the typical no-accent same-case normalization). Some times, students are inserted into the computer system as "surname1 surname2 name", instead of "name surname1 surname2", so we need to consider that when doing the matching (generate permutations and such)

# End

As simple as that! With some clever searching and a bit of string comparison, the information can be easily obtained. After that, all thats left is the insertion in the database with the prefered schema and off we go.
