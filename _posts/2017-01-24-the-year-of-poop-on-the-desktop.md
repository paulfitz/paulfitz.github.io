---
layout: post
title: the year of poop on the desktop
---

<table width="100%">
<tr>
<td><h2>CSV</h2><textarea id="table_csv" class="ctable" wrap="off" autocorrect="off" spellcheck="false"></textarea></td>
<td><h2>PSV</h2><textarea id="table_poop" class="ctable" wrap="off" autocorrect="off" spellcheck="false"></textarea></td>
</tr>
</table>

<script>
$(function() {
  var txt = "IDEA,VALUE,IMPLEMENTED\nsave earth,high,no\nfight tyranny,high,no\npoop csv,low,HECK YES\n";

  var delim = String.fromCharCode(0xD83D, 0xDCA9);
  var csv_poop = new daff.Csv(delim);
  var csv = new daff.Csv();
  var update = true;
  $('#table_poop').keyup(function() {
     if (update) {
       update = false;
       $('#table_csv').val(csv.renderTable(csv_poop.makeTable($('#table_poop').val())));
       update = true;
     }
  });
  $('#table_csv').keyup(function() {
     if (update) {
       update = false;
       $('#table_poop').val(csv_poop.renderTable(csv.makeTable($('#table_csv').val())));
       update = true;
     }
  });
  $('#table_csv').val(txt);
  $('#table_csv').trigger('keyup');
  $('#table_poop').trigger('keyup');
});
</script>

So last month an idea surfaced from [@j4mie](https://twitter.com/j4mie])
for an alternative data format: poop separated values (PSV).  Here's the
<a href='https://twitter.com/j4mie/status/804701143171497984'>complete spec</a>.

{: .max-image}
![PSV Spec](/images/psv_spec.png)

At first, I laughed.  Then, maybe I cried a little &ndash; 2016 went in a
kind of &#x1f4a9;y direction at the end there.
Finally I started thinking.  I realized that PSV is a brilliant idea,
and here's why.

What we're talking about here is the `:poop:` emoji, standarized as
<a href='http://www.fileformat.info/info/unicode/char/1f4a9/index.htm'>U+1F4A9 PILE OF POO</a>
in Unicode 6.0.
Look at that unicode for a minute: `U+1F4A9`.  That's a big number.
That's outside the Basic Multilingual Planes my friends, and into
the <a href='https://en.wikipedia.org/wiki/Plane_%28Unicode%29'>Astral Planes</a> of
the unicode standard.  You have to have your act together to deal with this.
For example, Mathias Bynens covers all the muddles javascript gets into with poop in
<a href='https://mathiasbynens.be/notes/javascript-unicode'>Javascript has a Unicode Problem</a>.
This is not the 128-odd ASCII characters your grandmother grew up with.

So isn't that an argument not to use an astral symbol as a separator?
Let's reflect on the failings of CSV.  Jesse
Donat has a great list in a piece called
<a href='https://donatstudios.com/Falsehoods-Programmers-Believe-About-CSVs'>Falsehoods-Programmers-Believe-About-CSVs</a>,
mirroring similiar lists about <a href='http://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/'>names</a>,
<a href='http://wiesmann.codiferes.net/wordpress/?p=15187&lang=en'>geography</a> and so on.
The first 8 falsehoods are all encoding related.  With CSV, if your data is a table
of numbers, you don't really have to think about encoding at all.  That's nice
right up until
the moment a non-ASCII character sneaks in there it all goes pear shaped.
But if we lead with a mandatory poop symbol, from an astral plane no less,
no-one is going to be able to punt on the encoding issue.  You have
to get it right up front.

The logical conclusion of this idea would be to borrow a string
like I&ntilde;t&euml;rn&acirc;ti&ocirc;n&agrave;liz&aelig;ti&oslash;n&#x2603;&#x1F4A9;
from unit tests and use that as the delimiter.  But &#x1F4A9; alone gets us a good way there,
and looks cleaner. Err.

Here's an example of PSV in action.  I'm editing a PSV file called
`checklist.psv` that lists my current goals in life.  I'm using `emacs`
to edit the file, and `git` to view differences against a previous
version.

{: .max-image}
![PSV and daff](/images/psv_diff.jpg)

I've configured `git` here to use <a href='https://github.com/paulfitz/daff'>`daff`</a>
to view tabular differences cleanly.  I'm doing this on my phone because phones
currently excel at showing emoji &ndash; the same thing on a laptop also works fine
but the poop is less cheerful looking.

One danger with PSV is that people could get sloppy about quoting
rules.  With CSV, you've a good chance of seeing a comma in your data,
so you deal with quoting sooner rather than later to disambiguate that.
The business data I've seen in CSV form has never had &#x1F4A9; in it,
so I could imagine someone skimping on quoting.  One solution for that
is for more of us to put poop in our names and transactions,
Little Bobby Tables style (<a href='https://xkcd.com/327/'>xkcd</a>,
<a href='https://opencorporates.com/companies/gb/10542519'>@mopman's company</a>).

There aren't a lot of programs supporting PSV yet.  So far as I know,
<a href='https://github.com/paulfitz/daff'>`daff`</a> is the first.
The purpose of `daff` is making tabular diffs and helping with
version control of data, but until format converters crop up you
can use it to convert to and from psv as follows:

```
pip install daff           # or npm install daff -g
daff copy foo.csv foo.psv  # convert csv -> psv
daff copy foo.psv foo.csv  # convert psv -> csv
```

Or you can write into the text boxes at the start of this post :-).