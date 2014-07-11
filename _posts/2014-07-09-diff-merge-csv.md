---
layout: post
title: Diff and merge CSV files in your git client
---

Sometimes, you want to version-control your data.
As a programmer, many of us are used to putting everything in git.
For large datasets, that is currently a recipe for sadness, but
smaller ones can work just fine.

There are a few hurdles. CSV files have a special tabular structure
that git knows nothing about. This means that diffs will be noisier
than they need be, and that git may see conflicts when merging where
there are none.  

For diffs, James Smith [has a great explanation](http://theodi.org/blog/adapting-git-simple-data) and a good start at a solution.  In the git client,
he proposes a custom git diff driver that understands CSV structure.
On the server side, he shows how to tweak gitlab or ([via a plugin called CSVHub](http://theodi.org/blog/csvhub-github-diffs-for-csv-files)) github to get pretty diffs using the [daff library](https://github.com/paulfitz/daff).

![git hearts csv?](/images/git-hearts-csv.gif)

For merges, on the client side, the [coopy library](http://share.find.coop) has 
for some time provided a similar [merge driver](http://share.find.coop/doc/tutorial_git.html) to let git understand and use CSV structure.  As of today,
`daff` can do the same, and it is much easier to install.

~~~
$ npm install daff -g
$ daff git csv
~~~

<del>Actually, that second command will only tell you how to get things set up,
it won't do it for you automatically (yet).  I'm a little nervous about
mucking up people's git settings.</del> The command now does all the
setup work for you, very carefully (run `daff git` for details).

Once that is installed, you'll get nice diffs produced by the same
library James used for his github plugin, and you'll get nice merges
too.  Let's look at an example.

Suppose we have this table stored in `digi.csv`:

~~~
NAME,DIGIT
one,1
two,2
thre,33
four,4
five,5
~~~

And in one branch we correct `thre` to `three`, 
and in another branch we correct `33` to `3`:

~~~
NAME,DIGIT        NAME,DIGIT      
one,1	   	  one,1	   
two,2	   	  two,2	   
three,33   	  thre,3	   
four,4	   	  four,4	   
five,5       	  five,5     
~~~

If we try to merge these files in vanilla git, we'll get an ugly conflict:

~~~
Auto-merging digi.csv
CONFLICT (content): Merge conflict in digi.csv
Automatic merge failed; fix conflicts and then commit the result.
~~~

And the CSV file is no longer a valid CSV file, which is unfortunate
if we're using a CSV-aware editor for it:

~~~
NAME,DIGIT
one,1
two,2
<<<<<<< HEAD
thre,3
=======
three,33
>>>>>>> 634275495ecd86c287e292e2719e89a9c1188ed1
four,4
five,5
~~~

With a CSV-aware merge driver, we get:

~~~
Auto-merging digi.csv
Merge made by recursive.
 digi.csv |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
~~~

and the changes are correctly merged:

~~~
NAME,DIGIT
one,1
two,2
three,3
four,4
five,5
~~~

What if there was a real conflict?  Suppose we replaced `thre` with
`three` in one branch but `thirty-three` in another?  We are told:

~~~
1 conflict
Auto-merging digi.csv
CONFLICT (content): Merge conflict in digi.csv
Automatic merge failed; fix conflicts and then commit the result.
~~~

And the conflicted file looks like this:

~~~
NAME,DIGIT
one,1
two,2
"((( thre ))) thirty three /// three",33
four,4
five,5
~~~

This remains a valid CSV file, and so can be edited in a CSV-aware editor - 
we aren't suddenly kicked out into needing a text editor.

<ul class="menu">
  <li><a href="/2014/06/10/daff.html">daff</a></li>
  <li><a href="http://theodi.org/blog/csvhub-github-diffs-for-csv-files">CSVHub</a></li>
  <li><a href="http://share.find.coop">coopy</a></li>
</ul>
