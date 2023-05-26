---
title: "Writing our own functions"
teaching: 15
exercises: 15
---

::: questions
- "How can I add functionality to my package?"
:::

::: objectives
- "Create a custom package"
:::


So far, we have been playing with the example package that is built-in in `RStudio`.
It only contains a function that says `Hello, world!`.
It is extremely useful that we have an example that gets us started, but this package is not very interesting yet.
In this and the next episodes, we will create our own customized package, which in the previous episode we gave the name of `mysterycoffee`.

## `mysterycoffee`, our virtual coffee room

Our package will try to mitigate a practical problem: social isolation in remote working environments.
We want to create a software solution that simulates random encounters at the office's coffee machine... when there is no office.
The very first step is to answer three very important questions:

### 1. What will our package do?
As we said, our package will simulate random encounters between employees.

### 2. How will we do it?
After some thinking, we figured out that we can have a function that has the following input and output:

- **Input**: vector of employees' names.
- **Output**: a two-column matrix, randomly grouping the employees' names into couples.

The output table can be published, say, weekly, and each couple invited to have a videoconference-coffee chat, just as if they had randomly met at the coffee machine.

So this will be our starting point.
In the next sections we'll write an R function that does exactly this.

Later on, we'll see that our original design may face unexpected challenges.
For instance, what happens [if the number of employees not even](https://carpentries-incubator.github.io/lesson-R-packaging/05-testing/index.html#what-to-do-if-a-test-fails)?

### 3. Are we reinventing the wheel?
This is also an important question worth investing some time in when creating new functions or packages.
Can we solve our problem with a software solution that someone else already wrote?

Well... if our problem really was to simulate random encounters, the answer is yes.
There are already solutions for this.
But our **real** problem is learning how to make R Packages, isn't it?
So we'll use this problem as a pedagogical example.

## Getting our hands dirty 

### First step: remove `hello.R`
The next step is to remove the file `hello.R`.
This was just an example file, and we don't need it anymore.

### Second step: edit `DESCRIPTION`
Now that we know what our package is expected to do, it is a perfect moment to edit the `DESCRIPTION` file.

::: challenge
## The `DESCRIPTION` file
Open the `DESCRIPTION` file.
What do you see here?

Take 5 minutes to edit this file with the information it asks.
In particular, edit the following fields (when needed):
`Title`, `Version`, `Author`, `Maintainer`, `Description`.
For now, ignore the rest.

:::: solution
After editing, your `DESCRIPTION` file should look similar to:

```txt
Package: mysterycoffee
Type: Package
Title: Simulation of random encounters between couples of persons
Version: 0.1.0
Author: Pablo Rodriguez-Sanchez
Maintainer: Pablo Rodriguez-Sanchez <p.rodriguez-sanchez@esciencecenter.nl
Description: Simulates random encounters between couples of persons
    This package was inspired by the need to mitigate social isolation in remote 
    working environments. The idea is to simulate random encounters at the office's
    coffee machine... when there is no such an office.
License: What license is it under?
Encoding: UTF-8
LazyData: true
RoxygenNote: 7.1.1
```
::::
:::

::: callout
## More on `DESCRIPTION`
In the previous exercise we deliberately ignored some of the fields in the `DESCRIPTION` file.
Two of them are particularly relevant, the `Version` and the `License` fields.

The `Version` field helps you and your users keep track of the package version.
It is advisable to use [_semantic versioning_](https://semver.org/).
In a nutshell, _semantic versioning_ means using a `MAJOR.MINOR.PATCH` structure for naming your versions.
If your new version only fixes some bugs, increase the `PATCH` by one.
If your new version includes new features, increase the `MINOR` by one.
If your new version includes new features that are not backwards compatible, increase `MAJOR` by one.

Regarding the `License`: software licensing is a large and complicated field which lies at the intersection of programming and law.
Its intricacies are far beyond the aim of this course.
The good news is that, most likely, most of your research code can be released under a _permissive_ license, typically _MIT_ or _Apache_.
If you want to know more, please take a look at [these materials](https://r-pkgs.org/license.html#license).

For more, detailed information about `DESCRIPTION` files, see [R Packages documentation](https://r-pkgs.org/description.html).
:::

### Third step: create a function

We came up with the following prototype function that will do the random grouping:

```r
make_groups <- function(names) {
  # Shuffle the names
  names_shuffled <- sample(names)

  # Arrange it as a two-columns matrix
  names_coupled <- matrix(names_shuffled, ncol = 2)

  return(names_coupled)
}
```

Please, open an editor, copy the function above and save it as `R/functions.R`.
All the functions of the package have to be in `R` files inside the `R/` folder.

::: callout
## On the art of being tidy
So far, our package only has one function, and we have chosen a very boring name for the file where it is stored (`R/functions.R`).

In the future, keep in mind that you can use any valid filename for storing your functions.
Additionally, such a file can contain one or many functions, and you can use multiple files if you want.
Indeed, using multiple files with descriptive filenames is a good idea.

For instance, if your package has some functions for doing input, output and parsing of data, it could be a good idea to store those as `R/io.R`.
You can later put your analysis functions in `R/analysis.R`, and the plotting ones under `R/plotting.R`.

Be creative and informative! The only rule is that your `.R` files should "live" inside the `R/` folder.
:::

::: keypoints
- "It is important to think about **what** we want our package to do (_design_) and **how** to do it (_implementation_). We also want to know **why** we need a new package (_avoid reinventing the wheel_)"
- "Functions have to be saved in `.R` files in the R folder"
:::
