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
> - `knitr` as an mandatory dependency.
> - `tidyr` as a recommended dependency.
>
> Tip: take a look at the help menu of `usethis::use_package()`.
>
> > ## Solution
> > We can add the new dependencies by:
> > > ~~~r
> > > usethis::use_package("knitr", type = "Imports")
> > > usethis::use_package("tidyr", type = "Suggests")
> > > ~~~
> > {: .source}
> >
> > Please notice how the `DESCRIPTION` file changed:
> > > ~~~txt
> > > Suggests:
> > >   tidyr,
> > >   testthat (>= 3.0.0)
> > > Imports:
> > >   knitr
> > ~~~
> > {: .source}
> > If you prefer, you can also add the dependencies by directly editing the `DESCRIPTION` file.
> > But using `usethis::use_package()` is handy!
> {: .solution}
{: .challenge}


> ## Using and running `devtools::check()` for dependencies
>
> `devtools::check()` checks for many different things, but here we want to see it in action for dependencies. 
>
> Let's start by adding a function that depends on another package.
> We use `usethis::use_r()` to initiate a file for this function:
> 
>~~~r
> usethis::use_r("make_groups_and_time")
>~~~
> {: .code}
>
> Then add the following function to the file `make_groups_and_time.R`:
>~~~r
> #' Make groups of 2 persons and coffee time
> #'
> #' Randomly arranges a vector of names into a data frame with
> #' 3 columns and whatever number of rows is required. The first
> #' two columns are the two persons that meet for the coffee; 
> #' the last column is the randomly sampled time at which they meet.
> #'
> #' @param names The vector of names
> #'
> #'
> #' @return A data frame with re-arranged names in groups and assigned coffee time.
> #' @export
> #'
> make_groups_and_time <- function(names) {
>   groups <- data.frame(make_groups(names))
>   names(groups) <- c("person1", "person2")
>   possible_times <- c("09:30", "10:00", "15:15", "15:45")
>   groups_and_time <- dplyr::mutate(
>     groups,
>     coffee_time = sample(possible_times, size = nrow(df), replace = TRUE)
>   )
>   return(groups_and_time)
> }
>~~~
> {: .code}
> 
> With this in place, or with your own package, do the following.
> Run `devtools::check()` (or `Build > Check`). What messages do you get about dependencies?
> Optionally, you can address the messages by changing the code, and re-run `devtools::check()` to see if you were successful. 
> > ## Solution
> > From running `devtools::check()` we get:
> >~~~r
> > '::' or ':::' imports not declared from:
> >  ‘tidyr’ ‘tidyselect’
> > 
> > checking R code for possible problems ... NOTE
> > reshape_groups: no visible global function definition for ‘%>%’
> > Undefined global functions or variables:
> >   %>%
> >~~~
> > 
> > We first add the `tidyr` dependency with `usethis::use_package("tidyr", type = "imports")`, and do the same for `tidyselect`. We can verify that the `DESCRIPTION` is updated.
> >
> > One way to resolve the missing import for `%>%` is with `usethis::use_pipe()`---this creates a new file `R/utils-pipe.R`. Another way, if using `roxygen`, is to declare `magrittr` in the `Imports`, and declare `@importFrom magrittr "%>%"` in the file `reshape_groups.R` as follows:
> >
> >~~~r
> >#' reshape groups
> >#'
> >#' @param names person names
> >#' @importFrom magrittr "%>%"
> >#' @return a dataframe with two columns: group membership and person name
> > reshape_groups <- function(names) {
> >  df <- data.frame(make_groups(names))
> >  names(df) <- c("group1", "group2")
> >  out <- df %>% tidyr::pivot_longer(cols = tidyselect::starts_with("group"))
> >  return(out)
> >}
> >~~~
> {: .source}
> >
> {: .solution}
{: .challenge}


{% include links.md %}
