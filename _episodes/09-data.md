---
title: "Data"
teaching: 40
exercises: 20
questions:
- "How can I include data in my package?"
objectives:
- "Learn how to use the data folder"
keypoints:
- "R packages can also include data"
---

## Packaging data

In some situations, it could be a good idea to include data sets as part of your package.
Some packages, indeed, include **only** data.

Take a look, for instance, at the `babynames` package.
According to [the package description](https://cran.r-project.org/web/packages/babynames/index.html), it contains _"US baby names provided by the SSA"_.

In this chapter we will learn how to include some data in our package.
This can be very useful to ship the data together with the package, in an easy to install way.

> ## Is your data too big?
> Packages are typically not larger than a few megabytes.
>
> If you need to deal with large datasets, adding them to the package is not an advisable solution.
> Instead, consider using [Figshare](https://figshare.com/) or similar services.
{: .callout}

## Adding data

### Step 1: let R know that you'll use data

The easiest way of adding data to our project is by letting the package `usethis` help us.
In the snippet below we generate some data, and then we use `usethis` to store it as part of the package:

~~~r
example_names <- c("Luke", "Vader", "Leia", "Chewbacca", "Solo", "R2D2")

usethis::use_data(example_names)
~~~ 
{:. code}

> ## What happened?
> Type and execute in your console the code we just showed.
> What does it do?
> Does it require any further action from our side?
> > ## Solution
> > It provides a very informative output.
> > Probably you'll see something like this:
> > ~~~
> > ✔ Setting active project to '<working folder>/mysterycoffee'
> > ✔ Saving 'example_names' to 'data/example_names.rda'
> > • Document your data (see 'https://r-pkgs.org/data.html')
> > ~~~
> > {: .code}
> >
> >
> > So, what happened is that it created the file `example_names.rda` inside the `data` folder.
> > Additionally, it activated the project, but that's not very relevant because most likely the project was already active.
> >
> > The last element in the list shows something that **didn't** happen: the data documentation.
> > Actually, we are asked to do it ourselves.
> > `usethis` is kind enough to provide us with a link with further information, in case we need it.
> >
> > So let's move to the second (and last) step, and document our data.
> > 
> {: .solution}
{: .challenge}

### Step 2: document your data

Everything you put inside your package needs some documentation.
Data is no exception.
But, how to document it?
The answer is easy: not very differently as did with functions in [episode 6](../06-documentation).

An example documentation string for our data could be:

~~~txt
#' Example names
#'
#' An example data set containing six names from the Star Wars universe
#'
#' @format A vector of strings
#' @source Star Wars
"example_names"
~~~
{: .code}

We'll save this text in `R/example_names.R`, and we are ready to go.

> ## Checking that everything went ok
>
> In the build panel, press install and restart.
> Now, type `?example_names` in the console.
> Do you see some information about the dataset?
>
> Tip: if not, make sure that you activated `Generate documentation with Roxygen` in the `Build/More/Configure build tools` tab.
{: .callout}

## A note about raw data

It should be noted that the way of dealing with data we just described will **only** work with _R_ data files, that is, those with `.rda` or `.RData` extensions.

If you need to include raw data inside your package, please take a look at [section 14.3](https://r-pkgs.org/data.html) of the excellent [R Packages tutorial](https://r-pkgs.org/index.html) by Hadley Wickham.

{% include links.md %}
