---
title: "Documenting your package"
teaching: 0
exercises: 0
questions:
- "How can I make my package understandable and reusable?"
objectives:
- "Use roxygen2 for creating documentation"
- "Use roxygen2 for managing the NAMESPACE file"
keypoints:
- "Documentation is not optional"
- "Roxygen helps us with the otherwise tedious process of documenting"
---

## `roxygen2`

`roxygen2` is a package that makes writing packages much easier.
In particular, `roxygen2` takes care of your functions' documentation and the `NAMESPACE` file.
If you don't have it installed (you can check by trying `library(roxygen2)`), please do it now (`install.packages("roxygen2")`).

Unfortunately, using it requires manually configuring a few things.
Please follow these steps:

> ## Using `roxygen2` for the first time
> - Delete `NAMESPACE`. `roxygen2` will create a new one for you.
> - Delete the `man/` folder. `roxygen2` will create a new one for you.
> - In the upper right panel, go to `Build > More > Configure Build Tools`. You'll see a menu like this:
> ![Project options](../fig/project-options.png)
> - Tick `Generate documentation with Roxygen`.
> A new menu will appear:
> ![Project options](../fig/roxygen-options.png)
> - Tick `Install and restart`.
>
> And you are all set!
{: .checklist}

Let's create our first `roxygen` skeleton.
You can follow the steps in the animation below.
Please note that, before pressing `Code > Insert Roxygen skeleton` your cursor has to be inside the function's body.

![Roxygen skeleton](../fig/roxygen-skeleton.gif)

- The `return` field refers to the output. In this case, although something is printed to the screen, no output is provided (in the sense that `var <- hello()` is not assigned any value).
- The `export` field means that this function should be exported to the `NAMESPACE`.
- The `examples` field is used, as you can guess, for adding examples to the documentation. We'll not use it now, so we can delete it.

> ## Building the documentation (and NAMESPACE)
> If you configured `roxygen2` as we suggested in section _"Using `roxygen2` for the first time"_, the documentation will be generated every time you press _"Install and restart"_ in the _"Build"_ menu at the upper right side of `RStudio`. The tab will also contain a _"Document"_ only:
>
> ![Document](../fig/document.gif)
>
{: .callout}

## Writing our own functions

At the moment our package is quite useless.
It contains only one example function.


> ## Customize `hello`
> Let's edit the `hello` function to do something slightly more interesting: accept a name as an input, and customize the greeting.
> For instance, if we enter:
>
> ~~~r
> hello("Pablo")
> ~~~
> {: .source}
> 
> we want the output:
>
> ~~~r
> # Hello, Pablo!
> ~~~
> {: .output}
>
> > ## Solution
> > This will do:
> > ~~~r
> > hello <- function(name) {
> >  print(paste("Hello, ", name, "!", sep = ""))
> > }
> > ~~~
> > {: .source}
> {: .solution}
{: .challenge}

We changed the function, and we should change the documentation accordingly.
Let's do it.

> ## Keeping the documentation updated
> Set your cursor inside the function you just edited.
> Go to `Code > Insert Roxygen skeleton` as we did in section _'Using `roxygen2` for the first time'_.
>
> Notice that a new field `@param` appeared.
> Can you explain it?
> Can you fill it?
> > ## Solution
> > The `@param` field expects you to describe the meaning of your input parameter.
> > When filled, it should look as something like:
> >
> > ~~~r
> > #' Hello world function
> > #'
> > #' @param name Name of the person to greet
> > #'
> > #' @return Nothing, just greets
> > #' @export
> > #'
> > hello <- function(name) {
> >   print(paste("Hello, ", name, "!", sep = ""))
> > }
> > ~~~
> > {: .source}
> {: .solution}
{: .challenge}

{% include links.md %}
