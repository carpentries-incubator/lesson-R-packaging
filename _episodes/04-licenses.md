---
title: "Licenses"
teaching: 15
exercises: 10
questions:
- "How do I allow the use of my package?"
objectives:
- "Understand the reason for licenses, and how to add a license to a new R package"
keypoints:
- "A license is essential to allow the use and reuse of your package."
- "The copyright holder(s) decide(s) on the license."
- "It is easy to add an open source license to a new R package."
---

## What is a license?
In a license, you specify how your code may be used. Everything you create has copyright, which limits the possibility for others to (re)use it. A copyright holder therefore has to explicitly give permission (and specify limitations) for the use of their work. You do this by attaching a license.

## Who has copyright?
If you code in your own time, for a project only you contribute to, then you are the copyright holder. When a project is authored by multiple people, all of these people have copyright, and therefore need to agree on the license.

When a project is done under employment, the copyright situation becomes more difficult. In most cases, copyright officially belongs to the employer, although the exact situation can differ depending on the employment contract. It is good practice therefore to check whether your employer has a policy for software licensing.

In practice, it is often the case that (University) employees assume copyright of their own work, and in the absence of (open source) policy, decide on their own licenses. Being thorough and checking with the University's legal department may result in an overly cautious response that requires the use of a proprietary license, heavily limiting the options for your package's (re)use.

## What types of licenses exist?
Many (many!) different options exist for licensing your software. In the spirit of R (licensed under GPL) and the Carpentries (licensed under CC-BY), we will focus on open source licenses. These are licenses that allow the use of the source code. You will meet these licenses in community-built software projects, like R itself.

Two important flavours of open source software licenses are: permissive, and copyleft (or viral).

Copyleft licenses require that any product that uses the licensed work must be licensed in the same way. That is why it is called a viral license: it spreads. A well-known copyleft software license is the GPL, the GNU Public License. R itself, as mentioned, is licensed under GPL.

Permissive licenses are similarly open, but they do not restrict the way in which downstream work is licensed. A few well known permissive licenses are the MIT license, the Apache license, and the BSD license. They differ in small respects, but their philosophy is the same.

## How do I decide what license to use?
First, ask a few important questions:

- Is there code you use in your project which is already licensed? If so, what are their requirements?
- Is there an official policy from my employer that informs my license choice?

> ## Copyleft and dependencies in R
>
> R is licensed with the copyleft license GPL. Does this mean that every package in R requires a GPL license?
> Fortunately, the GPL is not that strict. Because of the way the R language works, you are not
> required to license your R package with GPL. This is also the case when other libraries that your package imports
> (your so-called dependencies) are GPL licensed: you are not shipping that code directly with your package, so, you are not
> required to adhere to the copyleft policy.
>
> However, if you copy code from another project and paste it to yours, then that project's license does
> become relevant. Be sure to consult it when choosing a license for your own work.
>
{: .callout}

Then, head to [choosealicense.com](https://choosealicense.com/), and choose a license. Make sure that all copyright holders for your package agree with your choice.

## How do I add a license to my R package?
It is easy to apply your license using the `usethis` package.

~~~r
usethis::apply_apache_license()
~~~
{: .source}

Two files are edited with this command:
- `DESCRIPTION`
- `license.MD`


{% include links.md %}
