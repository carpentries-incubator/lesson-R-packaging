---
title: "Accessing packages"
teaching: 0
exercises: 3
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

One of the advantages of packages is that they can be **installed** and **loaded**.
This allows us to use the functions contained in the package from anywhere.

There are many ways of accessing a package in order to start using it.
In this section, we will study the most common ones.
At the end, we'll describe briefly other alternatives that may be useful in some cases.
## Install a package from CRAN

[CRAN](https://cran.r-project.org/) is the official repository for R Packages.
It stands for the _Comprehensive Archive R Network_.
It is an awesome collection of high quality resources written by other R users just like you.

Installing a package from CRAN is particularly easy.
Let's imagine we need to install a package with tools for R developers.
We can start by browsing to our favorite search engine, and make a search like: _R developers tools_.
It will point us to a package called `devtools`.
The package can be installed by opening RStudio and browsing to the _Packages_ tab:

![Packages tab](../fig/packages.png)

After pressing _Install_, a window like this will appear:

![Install prompt](../fig/install.png)

We write `devtools` in the prompt, and press install.
This operation will download and install the package and the required dependencies.
Depending on the package, it may take a while, ranging from a few seconds to a few minutes.

> ## The same, but with a command
> Some people may prefer using code instead of a graphical user interface to install a package.
> Are you one of them?
> Then, you'll like to know that all the above is equivalent to typing:
> 
> ```r
> install.packages("devtools")
> ```
>
> As often happens with RStudio, you don't have to remember this command by heart.
> You can keep using the graphical user interface and **observe** what happens in the console.
> RStudio will build and execute the command for you.
{: .callout}

After installing, the new package should appear in the _Packages_ tab.
> ## Something went wrong?
> Sometimes, an installation may fail.
> If that's the case, take a look at the output message in the console.
> It will contain very useful information, and direct suggestions about how to fix the problem.
{: .callout}

> ## Can I publish my package in CRAN?
> The answer is yes, and it is easier than you may think.
> We'll go back to this in chapter TODO.
{: .callout}


## Install a package from source

What if the package is only available in your computer?
This is the case of the one we are building during this lesson.

## Install a package from GitHub

Not all publicly available packages are available in CRAN.
...

## Loading an installed package

In order to use an installed package, you need to load it into workspace.
This means that its functions and data will become available in your working session.

The easiest way to load an installed package is by using the _Packages_ tab.
If you click on the package's name, the package's help menu will open.
If you click on the checkbox by the package's name, the package will be loaded.

> ## What if we want to load a package from the console?
> How would you load an installed R package using the console?
>
> Tip: As always with RStudio, it is a good idea to look at the console while we are performing operations in the graphical user interface.
> > ## Solution
> > Use `library(<package name>)`.
> {: .solution}
{: .challenge}

> ## Using a function without loading the package
> Some advanced users may be interested in loading individual functions from a given package, but not the package itself.
> This can be done using the syntax: `<package>::<function>`.
>
> For instance, if we want to use the function `filter` from the package `dplyr` we can call it directly as:
>
> ```r
> dplyr::filter()
> ```
> Keep in mind that for this to work, `dplyr` has to be installed.
>
> We are not going to do this during the present course, but you may find code out there that does.
{: .callout}

{% include links.md %}