---
title: "Introduction"
teaching: 30
exercises: 0
---

::: questions
- What is a package?
- Why do we want a package?
:::

::: objectives
- Understand what a package is.
- Understand why a package is useful.
- Understand the tools you are about to use.
:::

Picture yourself starting a new programming project.
Most likely, your first step will consist of creating a new folder, a folder that you will later populate with files.
If the project is long and complex, you will need several files and also some subfolders.
The folder structure can eventually become pretty complex and difficult to maintain, especially if your project has multiple authors.
Fortunately, you can make this process a lot easier by structuring our work as a software package.

::: prereq
## Prerequisites
Have you ever written an `R` function?
If the answer is yes, then you are ready to take this course.
If the answer is no, we recommend you go through [this episode](https://swcarpentry.github.io/r-novice-inflammation/02-func-R/index.html) of the [Programming with R](https://swcarpentry.github.io/r-novice-inflammation/) course.
:::

## What is a package and what is it good for?

A package may sound complex, but it is simply a standard way of structuring your project.
This standardized structure applies to the files and (sub)folders of your project, but also to your code:
in an R package, the code consists of functions only.
These will be the access points for anyone who wants to use your code.

Structuring your project as a package has several advantages, such as increased:

- Robustness
- Reproducibility
- Shareability
- Legibility
- Usability
- Maintainability

Structuring your R project as a package is a way of making them easily available to other R users.
You probably know this process already: did you ever use a library (such as `knitr`, `lubridate` or `stringi`)?
If the answer is yes, you are already using packages.
Packages written by someone else.

In this lesson we will show you how to write your own, so you can actively participate in the R community.

::: discussion
## How can this course help me?
As we will see during this course, applying a standardized structure comes with several unexpected benefits.
Let me ask you a few questions:

- Did you ever have problems running a script written by a colleague?
- Did you ever have problems running your own code?
- Are you sometimes scared of editing your code, just in case you "break" it?
- Do you suspect that some parts of your code may not be working as you want them to?
- Do you feel that you are losing control about how your code is growing?

If your answer to any of the previous questions is yes, stay with us.
You may not know it yet, but software packaging can make your life easier.

Can anyone give an example of these things happening to them in their work?
:::


## The tools we will use

### Why R?
The practice of software packaging is applicable to many programming languages.
The language of choice for this course is R.
Is there any reason for that?

As we will see, R projects are particularly easy to be written in the form of packages.
This makes R the ideal language for getting started with packaging.

### Why RStudio?
RStudio is an Integrated Development Environment (IDE) specifically designed for `R`.
As many IDEs, it contains some menus and buttons arranged in an intuitive interface.
This will relieve a lot of mental space, as we do not have to remember the commands for common operations such as _building_, _saving_, _knitting_ and so on.
In this course we will make extensive use of it.

::: callout
## Pro-tip
When you hover over a button in RStudio, a textbox will be displayed. Among other things, this textbox will contain the equivalent key combination (for instance, `Ctrl/Cmd + S` for saving).
Paying attention to these text boxes is a perfect way of getting used to, and ultimately remembering, those key combinations.

Additionally, after pressing a button, some commands will be executed in the console.
It is always very instructive to take a look at the console to see what commands the button triggered.
:::

::: keypoints
- An R package is a project in a standardized folder structure.
- An R package centers around R functions.
- RStudio is a useful editor that helps you package your project.
:::
