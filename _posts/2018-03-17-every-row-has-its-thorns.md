---
layout: post
title: Every row has its thorns
---

<table width="100%">
<tr>
<td><h2>CSV</h2><textarea id="th_table_csv" class="ctable" wrap="off" autocorrect="off" spellcheck="false"></textarea></td>
<td><h2>&THORN;SV</h2><textarea id="th_table_thorn" class="ctable" wrap="off" autocorrect="off" spellcheck="false"></textarea></td>
</tr>
</table>

<script>
$.mobile.ignoreContentEnabled=true;
$(function() {
  var txt = "IDEA,IMPLEMENTED\nsave earth,no\nfight tyranny,no\nþ-separated-value converter,HECK YES\n";

  var delim = String.fromCharCode(0xFE);
  var csv_thorn = new daff.Csv(delim);
  var csv = new daff.Csv();
  var update = true;
  $('#th_table_thorn').keyup(function() {
     if (update) {
       update = false;
       $('#th_table_csv').val(csv.renderTable(csv_thorn.makeTable($('#th_table_thorn').val())));
       update = true;
     }
  });
  $('#th_table_csv').keyup(function() {
     if (update) {
       update = false;
       $('#th_table_thorn').val(csv_thorn.renderTable(csv.makeTable($('#th_table_csv').val())));
       update = true;
     }
  });
  $('#th_table_csv').val(txt);
  $('#th_table_csv').trigger('keyup');
  $('#table_thorn').trigger('keyup');
});
</script>

Last year we all got excited about 
[&#x1f4a9; separated values]({% post_url 2017-01-24-the-year-of-poop-on-the-desktop %})
(`.psv`) for our data interchange needs.  But that is so 2017.
This year, it is all about &thorn; separated values.
[@pobocks](https://twitter.com/pobocks]) posted the 
<a href='https://twitter.com/pobocks/status/974371210011332608'>complete
motivation and spec</a>:

{: .scale-image}
[![PSV Spec](/images/thsv_spec.png)](https://twitter.com/pobocks/status/974371210011332608)

Technically the spec has a <a href="https://twitter.com/pobocks/status/974373630548291585">small
glitch</a>. Every spec has its glitch.  Just like every rose has its thorn.

{: .scale-image}
[![What even is a thorn](/images/thorn.png)](https://en.wikipedia.org/wiki/Thorn_(letter))

