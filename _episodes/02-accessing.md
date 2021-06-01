---
title: "Accessing packages"
teaching: 0
exercises: 0
questions:
- "How do I use my package?"
- "How do I use someone else's package?"
- "What is the difference between installing and loading?"
objectives:
- "Install and load your own packages"
- "Install packages from GitHub"
- "Install packages from CRAN"
keypoints:
- "First key point. Brief Answer to questions. (FIXME)"
---

One of the main advantages of packages is that they can be **installed**.

## Install a package from CRAN

[CRAN](https://cran.r-project.org/) is the official repository for R Packages.
It stands for the _Comprehensive Archive R Network_.

Installing a package from CRAN is particularly easy.
Let's imagine we need to install a package with tools for R developers.
We can start by browsing to our favorite search engine, and make a search like: _R developers tools_.
It will point us to a package called `devtools`.
The package can be installed by opening RStudio and typing:

```r
install.packages("devtools")
```

The previous command will download and install the package and the required dependencies.
Depending on the package, it may take a while, ranging from a few seconds to a few minutes.

> ## Installing multiple packages
> Multiple packages can be installed simultaneously using a vector of package names:
>
> `install.packages(c("<first package>", "<second package>", ...))`
{: .callout}

> ## Can I publish my package in CRAN?
> The answer is yes, and it is easier than you may think.
> We'll go back to this in chapter TODO.
{: .callout}

## Install a package from GitHub

Not all publicly available packages are available in CRAN.
...

## Install a package from source

What if the package is only available in your computer?

{% include links.md %}