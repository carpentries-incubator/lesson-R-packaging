---
title: "Managing dependencies"
teaching: 15
exercises: 5
---

::: questions
- How can I make my package as easy to install as possible?
:::

::: objectives
- Use the `DESCRIPTION` file for declaring dependencies
:::


## What are dependencies?

Very often, our own code uses functions from a different package.
For instance, we used some functions from the package `testthat` in our [episode about testing](testing.Rmd).
When that's the case, we need the potential users of our package to, at least, have those other packages also installed in their machines.
The, so to say, sub-packages, are the dependencies of our package.

Providing a list of dependencies will greatly simplify the task of installing our package.
And the `DESCRIPTION` file provides a simple and handy way of creating this list.

## Using the `DESCRIPTION` file

At this moment, our `DESCRIPTION` file should look approximately like this:

```txt
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
```

The most important keywords to declare dependencies are:

- `Suggests`: for **recommended** dependencies, such as the ones required for testing, creating vignettes (see [this episode](vignettes.Rmd)) or plotting.
- `Imports`: for **mandatory** dependencies, that is, required for the basic functionality of the package. Such dependencies will be automatically installed along with the package you are developing.

As we can see in our `DESCRIPTION` file, the last two lines already contain a dependency statement.
Under the category `Suggests` we can see the package `testthat`.
More specifically, we can see that a version equal or higher than `3.0.0` is suggested.

::: challenge
## Add some dependencies
Let's add some dependencies to this list.
Particularly, we want you to add:

- `knitr` as an mandatory dependency.
- `tidyr` as a recommended dependency.

:::: hint
Tip: take a look at the help menu of `usethis::use_package()`.
:::

:::: solution
We can add the new dependencies by:
```
usethis::use_package("knitr", type = "Imports")
usethis::use_package("tidyr", type = "Suggests")
```

Please notice how the `DESCRIPTION` file changed:

```txt
Suggests:
  tidyr,
  testthat (>= 3.0.0)
Imports:
  knitr
```

If you prefer, you can also add the dependencies by directly editing the `DESCRIPTION` file.
But using `usethis::use_package()` is handy!
::::
:::

## Running `devtools::check()`

`devtools::check()` checks for many different things, but here we want to see it in action for dependencies. 

Let's start by adding a function that depends on another package.
We use `usethis::use_r()` to initiate a file for this function:

```r
usethis::use_r("make_groups_and_time")
```

Then add the following function to the file `make_groups_and_time.R`:
```r
#' Make groups of 2 persons and coffee time
#'
#' Randomly arranges a vector of names into a data frame with
#' 3 columns and whatever number of rows is required. The first
#' two columns are the two persons that meet for the coffee; 
#' the last column is the randomly sampled time at which they meet.
#'
#' @param names The vector of names
#'
#' @return A data frame with re-arranged names in groups and assigned coffee time.
#' @export
#'
make_groups_and_time <- function(names) {
  groups <- data.frame(make_groups(names))
  names(groups) <- c("person1", "person2")
  possible_times <- c("09:30", "10:00", "15:15", "15:45")
  groups_and_time <- dplyr::mutate(
    groups,
    coffee_time = sample(possible_times, 
                         size = nrow(groups), 
                         replace = TRUE)
  )
  return(groups_and_time)
}
```

::: challenge
With this in place, or with your own package, do the following.
Run `devtools::check()` (or click [ Build ] > [ Check ]).
What messages do you get about dependencies?
Optionally, you can address the messages by changing the code, and re-run `devtools::check()` to see if you were successful. 

:::: solution
From running `devtools::check()` we get:
``` output
W  checking dependencies in R code ...
 '::' or ':::' import not declared from: ‘dplyr’
```

We can add the `dplyr` dependency with `usethis::use_package("dplyr", type = "imports")`. This updates the `DESCRIPTION`. 
::::
:::


::: keypoints
- The `DESCRIPTION` file helps us keeping track of our package's dependencies
:::
