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

- Is there code you use in your project which is already licensed? If so, does this license require that I
- Is there an official policy from my employer that informs my license choice?



## When should I add a license?

What situation invokes these license conditions? This is more complex. The way that the licensed conditions come into play. Is not. More complex. What do you think the way that the viral conditions come into play?

It's not always easy to to figure out. With R packages, however. If you are using another package in your code. You do not need to adhere to their license. Nor do you need to adhere to the license of the R code itself, which is GPU. Licensed GPL licensed. Uhm, GPU jianu GPL. It's all very confusing. Nor do you need to adhere to the R license itself. You do. This can be different. This is certainly different if you are. Actually copying code. From other packages. In this case you will need to adhere to a viral license if it exists. Another flavor of open source licensing is called a permissive license and permissive licenses. In R. If you want to choose a license for your work, there's a couple things you have to. To keep into account. First of all. In what way are you using other people code if you are?

Simply loading importing. Another R package, or if you're working in R itself, those are not. Those are not. If you are simply importing another package. This will not. Require you to adhere to the license. Of that package, however. As mentioned before, if you are copying their code. Then this is a reason for you to take into account that license. The same may hold if you are using C code which needs to compile. There's a different I don't even know what the real the real rules are here. But I should look into that.
The second, the further things you need to keep in to take into account, is in what way do you want others to use their code.
This is a decision that is up to you and other copyright holders. You can use this tool choosealicense.com. Figure out what license fits your purposes best. Once you've made this decision.

## How do I add a license to my R package?
Anyway, once you've made this decision. It is easy to apply your license using dev tools. ``` usethis::apply_apache_license()```

Let's apply the Apache license to our. OK. CRAN requires a license. Even if you do not want to use, if you do not want to use an open source license. You can start a license file like this:

~~~r
usethis::use_apache_license()
~~~
{: .source}

Your license, Oh yeah. Once you've run this command. When you run this command. First, the DESCRIPTION and 2nd the license.MD file in the root of the package, always the if you. Are looking for. If you do not, if you want to do something else. If you want to use an alternative license, you can do so like this. Or a proprietary license.


 Things to make sure that they are in this file. So this is about. Understanding what kinds of licenses the goals are understanding, what kinds of licenses exist?
 Knowing how to apply a license, knowing where to find another license, find where to find the license of another package. You can ask. There's a command that you can use to check the license of a package. And how to amend it?

Uhm, also, if you want to submit your package to Cron that it requires a license. What the license of R itself is?

Uhm, and that they know choosealicense.com is important. And I think this is that's it really yeah?

{% include links.md %}

