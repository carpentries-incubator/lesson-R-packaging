---
title: "Vignettes"
teaching: 40
exercises: 20
---

::: questions
- How can I use R packages to write my research?
:::

::: objectives
- Learn how to write reports in the form of a vignette
:::



## Vignettes

If you are reading this, chances are that you are using R for doing research.
And if you are a researcher, probably you spend a lot of time writing.
Did you know that you can write your reports, and even your papers, directly from R?

We'll do this with vignettes.
Vignettes are plain-text files that combine enriched text and code.
Typically, the enriched text is displayed and the code is hidden and executed.

Think about it for a moment.
A vignette will take code from your package, execute it, generate the figures for you, and put everything together and in context.
The resulting document would be a human readable website, pdf file or even Microsoft Word file.

::: challenge
## Why would you want to do that?!
Writing your reports directly in R Studio may sound like an overkill, and it is certainly a bit harder than writing on an external word processor.
Can you think of a couple of reasons for making the effort worth it?

:::: solution
There are several reasons that make the use of vignettes a very good idea for writing research.
For instance:
- It keeps all the work tidy in a single project folder.
- The document describes and performs the calculations, instead of only describing them.
- The document can be read as a text, but interested enough readers can also execute it, test it. In short: reproduce it.
::::
:::

::: callout
## Why is everybody talking about reproducibility?
Probably you've heard about it.
The [reproducibility crisis](https://en.wikipedia.org/wiki/Replication_crisis) has been in the headlines recently.
In short, reproducibility crisis means that the results of many scientific studies are difficult or impossible to reproduce in an independent lab (and often even at the same lab they were produced!).

And why is this relevant?
Because reproducibility is a cornerstone of the scientific method.
It can be argued that non-reproducible results are literally not scientific.
:::

## `Rmarkdown` files

In `R`, vignettes are typically written using `.Rmd` (a shortening of `Rmarkdown`) files.
The name is self-descriptive: it is a file that combines **code** (in `R`) and **text** (in `markdown`).

::: callout
## What is markdown?
Markdown is a way of creating formatted text using a plain-text editor.
Actually, it looks a lot like plain text, but with some special symbols every now and then indicating aesthetic details such as bold typeface, links, tables, ...
Markdown files can be rendered to reading-friendly formats, such as `html` or `pdf`.

This website is written in markdown.
Below you can the source for the last paragraph of the previous section.

```markdown
In `R`, vignettes are typically written using `.Rmd` (a shortening of `Rmarkdown`) files.
The name is self-descriptive: it is a file that combines **code** (in `R`) and **text** (in `markdown`).
```

The good news is you don't have to learn by hearth all these symbols.
As we'll see below, RStudio is going to help you a lot in this regard.
Additionally, there are lots of good [cheat sheets](https://www.markdownguide.org/cheat-sheet/) available online.
:::

We can easily create our first vignette using the RStudio menus.
Click on `File/New file/R Markdown`, and you'll see a window like the one below:

![New R markdown](fig/new_rmd.png)

Fill in the field `Title` with the text: "Examples of usage", and press `OK`.

A new file will appear.
Before going further, let's save it.
Create a folder inside your project with the name `vignettes`, and save it there with the name `examples.Rmd`.

Now, let's take a look at the file.
Notice that the new file is not empty.
This is great!
RStudio created an example for us!

![R markdown template](fig/template_rmd.png)

As always, it is instructive to read the message (in this case, the file) that RStudio generated for us.
We realize that:

- Several formatting options are present as examples (so we don't have to remember them!).
- Code blocks are surrounded by the symbol ```` ```{r <name>, <optional parameters>} ```` and end with ```` ``` ````.
- There is something called **knit** that seems to be important.

_"Knitting"_ is the process of generating a reader-friendly document.
And RStudio has a button for that.
Let's press it and see what happens.

![Knitting](fig/knit.gif)

Great, isn't it?

::: callout
## Can I knit markdown files to other formats than html?
Yes, and surprisingly easy indeed.
Just take a look a the expanded menu of the knitting button.

Be warned, anyways, that some output formats may require installing additional packages.
:::

::: callout
## Can I use vignettes with other language than R?
Yes, although this is advanced material that we'll not cover in detail in this course.
:::

## Our vignette

The template vignette we just created works fine, but it doesn't give any useful information about our package.
In this section we'll fix that.
We will create a report including some examples to show how great our package is!

::: challenge
## A vignette about `mysterycoffee`
Open the default vignette we created in the previous section.
Use it as a template (for instance, editing and removing parts of it) to turn it into a vignette about `mysterycoffee`, the package we created during this course.

What can you write?
Just let me give you a few suggestions:

What about beginning with a tiny **introduction** section?
If you don't feel creative, you can write something along the lines of: _"Working from home can be boring. Luckily, `mysterycoffee` is here to help"_.

Now, a **how to use it** section will be ideal.
It will require some code chunks:
A chunk to attach the package, a chunk to load some names and a chunk to make the groups.
Don't forget to insert explanatory text in between the chunks.

We may also need a chunk to actually display the groups formed after knitting.

:::: solution
This is what I wrote.
Of course, your text, and even your code, will most likely be different.


````markdown
---
title: "Example of usage"
author: "Pablo Rodriguez"
date: "12/8/2021"
output: html_document
---
## Introduction

Working from home can be lonely. Do you miss the random chats at the coffee machine? Certainly we do!

Luckily, our R package `mysterycoffee` is here to help.

## How to use it

Well, first you'll have to attach the package.

```{r install}
# library(mysterycoffee) # uncomment this line in the vignette
```

Afterwards, the package will need the names of your colleagues. These are mine:

```{r names}
names <- c("Pablo Rodríguez",
           "Lieke de Boer",
           "Barbara Vreede",
           "President Obama",
           "General Sun Tzu",
           "Pharaoh Hatshepsut")
```

Now we just have to use the function `make_groups` to assign the random coffee partners:

```{r assign}
groups <- make_groups(names)
```

And here you have the result!

```{r print, echo=FALSE}
print(groups)
```
````
::::
:::

::: instructor

In the solution above, the line `library(mysterycoffee)` is commented out.
This is a technical choice: due to the Carpentries Lesson Template being written in Rmarkdown,
this line caused the CI to attempt to install `mysterycoffee`... which of course does not exist.
Please make sure to point out when sharing this solution that the line must be uncommented
in a functional vignette.

:::

::: challenge
## Hiding chunks
Sometimes you don't want the content of the code chunk to be printed in the knitted document, but only its results.
How can you control this?

Hint: take a look at the menu that appears at the right upper corner of each chunk.

:::: solution
The menu in the upper corner of each chunk allows you to do multiple things.
Among them, it allows you to fine-control what will happen to every chunk.
You can comfortably choose among a combination of execute or not execute the chunk, display the code, the output, or nothing.

By the way, did you notice the effect of choosing one of these options in the file itself?
When yoy choose, for instance, _show output only_, the parameter `echo=FALSE` will be added to the chunk header.
::::
:::

::: keypoints
- Reports can be part of the package
:::
