---
layout: post
title: What are the earthworms, field-mice, and platypuses of the economy?
---

Venture-backed start-ups and public companies get a lot of attention.
They are the peacocks and elephants of the business ecosystem.
But what are the earthworms, the field-mice,
the platypuses?  There are lot of interesting businesses
out there built with very different DNA.
One of them is the [Data Commons Co-op](http://datacommons.coop),
and more of them are members of members of that co-op.  Let me break
that down.

In the eyes of the law, the DCC is a Mercantile Cooperative, incorporated
in the Commonwealth of Massachusetts ([opencorporates listing](https://opencorporates.com/companies/us_ma/001083005)).  It is organized as a shared services cooperative,
where members band together to lower operating costs for services that
they all need.

> The Data Commons Co-op greases the flow of data between communities
> in the cooperative, solidarity, new, call-it-what-you-will
> economy. The co-op not only serves these communities, it is owned by
> them.
>
> *(from [datacommons.coop](http://datacommons.coop))*

Some of the members of the DCC are individuals such as academics,
but most are umbrella or support organizations --
nationwide federations
(e.g. the [US Federation of Worker Co-ops](http://usworker.coop)),
state-level development organizations
(e.g. [Cooperative Maine](http://cooperativemaine.coop)),
sector-level organizations
(e.g. the [Cooperative Grocer Network](http://www.cooperativegrocer.coop)),
and others.
So the *members of the members* of the co-op are thousands of fun
places like Local Sprouts, a worker-owned caf&eacute; and bakery
in downtown Portland Maine.

Financially, the Data Commons Co-op is engineered by its
[bylaws](http://member.datacommons.coop/bylaws) to operate at cost.
It has a tiny budget, funded mostly
from membership dues. In 2017 it has no staff; most of the work today
is done by a board of directors, and occasional volunteers (I'm one).
There are always new and interesting people joining and leaving.

The main niche the co-op has found for itself is backing member-created
maps and directories.  For example, the U.S. Solidarity Economy
Mapping Platform, [solidarityeconomy.us](http://solidarityeconomy.us/),
builds on DCC software, and relies on DCC hosting.  The co-op is becoming
a pool for census projects and member directories, reducing costs and
clearing away grit.  It is a place where people go
to ask questions about the weird and wonderful organizations shaping
the cooperative/solidarity/new economy.

The DCC can't answer a lot of those questions yet.
The [find.coop](http://find.coop) directory was an attempt
by the co-op to make a "stone soup" map of all the organizations
it (and its members) knew about.  The idea was that members would
chip lists of organizations they could vouch for, and the directory
would pull them all together.

What we've learned since making this prototype:

 * Most fresh, reliable information comes from organizations making
   a determined survey or census of a part of the economy they
   care about and have expertise in.
 * Drive-by individual contributions can happen, but are not
   a great starting point for the DCC at this stage of its
   development.  Getting moderation and trust right at this
   level of granularity seems expensive.

I'm now working on a new map (codenamed "stone souper") incorporating
these lessons.  The main change is an extreme streamlining of
how member-contributed listings are added.

 * Every listing in the database can be tracked to a contributing
   member.
   All listings from a given contributor can be removed or
   replaced without trouble.
 * That means contributors will feel less pressure to have their
   listings in perfect shape before chipping in, and can be
   secure in knowing they can pull the listings if something
   unexpected comes up.

The main technical change in the map has been to move more intelligence
into search and display, so that related listings are discovered,
grouped, and summarized appropriately.
With the existing directory, it was practically impossible with
the volunteer time available to import data that overlapped
with existing listings, including previous versions of the same
listings (d'oh!)

Excited to be finally building this, and thanks to all the DCC
members who've been so patient and helpful along the way!
