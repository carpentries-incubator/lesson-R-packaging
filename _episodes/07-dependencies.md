---
title: "Managing dependencies"
teaching: 15
exercises: 5
questions:
- "How can I make my package as easy to install as possible"
objectives:
- "Use the `DESCRIPTION` file for declaring dependencies"
keypoints:
- "The `DESCRIPTION` file helps us keeping track of our package's dependencies"
---

## What are dependencies?

Very often, our own code uses functions from a different package.
For instance, we used some functions from the package `testthat` in our previous [episode about testing](../05-testing).
When that's the case, we need the potential users of our package to, at least, have those other packages also installed in their machines.
The, so to say, sub-packages, are the dependencies of our package.

Providing a list of dependencies will greatly simplify the task of installing our package.
And the `DESCRIPTION` file provides a simple and handy way of creating this list.

## Using the `DESCRIPTION` file to `Suggest` and `Import` dependencies

At this moment, our `DESCRIPTION` file should look approximately like this:

~~~txt
Package: mysterycoffee
Type: Package
Title: Simulation of random encounters between couples of persons
Version: 0.1.0
Author: Pablo Rodriguez-Sanchez
Maintainer: Pablo Rodriguez-Sanchez <p.rodriguez-sanchez@esciencecenter.nl>
Description: Simulates random encounters between couples of persons
    This package was inspired by the need to mitigate social isolation in remote 
    working environments. The idea is to simulate random encounters at the office's
    coffee machine... when there is no such an office.
License: What license is it under?
Encoding: UTF-8
LazyData: true
RoxygenNote: 7.1.1
Suggests: 
    testthat (>= 3.0.0)
~~~

The most important keywords to declare dependencies are:

- `Suggests`: for **recommended** dependencies, such as the ones required for testing, creating vignettes (see [episode 9](../09-vignettes)) or plotting.
- `Imports`: for **mandatory** dependencies, that is, required for the basic functionality of the package.

As we can see in our `DESCRIPTION` file, the last two lines already contain a dependency statement.
Under the category `Suggests` we can see the package `testthat`.
More specifically, we can see that a version equal or higher than `3.0.0` is suggested.

> ## What do you mean mandatory?
> Please note that, even if we tag a dependency as **mandatory** using the `Imports` key, it will never be automatically installed by our new package.
> We have to do install it ourselves.
> What is then the use of tagging it as **mandatory**?
> That now our package is aware that the dependency **should be** installed, and it is going to throw an error if that's not the case.
{: .callout}
> ## Add some dependencies
> Let's add some dependencies to this list.
> Particularly, we want you to add:
>
> - `knitr` as an recommended dependency.
> - `kableExtra` as a mandatory dependency.
>
> It will become aparent later why we chose those packages.
>
> Tip: take a look at the help menu of `usethis::use_package()`.
>
> > ## Solution
> > We can add the new dependencies by:
> > > ~~~r
> > > usethis::use_package("knitr", type = "Suggests")
> > > usethis::use_package("kableExtra", type = "Imports")
> > > ~~~
> > {: .source}
> >
> > Please notice how the `DESCRIPTION` file changed:
> > > ~~~txt
> > > Suggests: 
> > >   knitr,
> > >   testthat (>= 3.0.0)
> > > Imports: 
> > >   kableExtra
> > ~~~
> > {: .source}
> > If you prefer, you can also add the dependencies by directly editing the `DESCRIPTION` file.
> > But using `usethis::use_package()` is handy!
> {: .solution}
{: .challenge}


{% include links.md %}
