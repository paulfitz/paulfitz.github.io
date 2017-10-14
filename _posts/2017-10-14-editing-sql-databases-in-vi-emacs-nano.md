---
layout: post
title: Editing SQL databases in vi/emacs/nano
---

Often enough, I want to make a small change in a SQL database.
Reset a user.  Delete a row in a request tracker.  And so on.
In code, using my favorite ORM, I've become used to not worrying
about which flavor of SQL database I'm working with.  I'd like
the same freedom on the command line.  So I made [catsql](https://github.com/paulfitz/catsql)
for `cat`ing slices of databases, and 
[visql](https://github.com/paulfitz/visql) /
[emacsql](https://github.com/paulfitz/emacsql) /
[nanosql](https://github.com/paulfitz/nanosql) for making quick edits.
Just specify a table and any filters you want to apply, and the table
will show up in `vi` (or `emacs`, or `nano`) in csv format.
Any edits you make will be applied back to the original source.

{: .scale-image}
![editing an SQL database with vi](/images/visql.gif)

This works fine on large tables.  Just specify a filter for the part
of the table you want to work on.  Only that part will be requested and shown.
Under the hood, [daff](https://github.com/paulfitz/daff) is used to figure out what
changes you want and how to apply them with a SQL update.

