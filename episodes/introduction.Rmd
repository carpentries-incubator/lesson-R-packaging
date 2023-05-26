---
title: "Introduction"
teaching: 30
exercises: 0
---

::: questions
- "What is a package?"
- "Why do we want a package?"
:::

::: objectives
- "Understand what a package is"
- "Understand why a package is useful"
- "Understand the tools you are about to use"
:::

Picture yourself starting a new programming project.
Most likely, your first step will consist of creating a new folder, a folder that you will later populate with files.
If the project is long and complex, you will need several files and also some subfolders.
The folder structure can eventually become pretty complex and difficult to maintain, especially if your project has multiple authors.

Wait a moment!
Long and complex projects, multiple authors... this sounds like **any** scientific project!
Is there a way of making this process easier?
The answer is yes, and the way is by structuring our work as a software package.

## What is a package and what is it good for?

A package may sound complex, but it is simply a standard way of structuring your project.
This standardized structure applies to the files and (sub)folders of your project, but also to your code:
in an R package, the code consists of functions only.
These will be the access points for anyone who wants to use your code.

Structuring our projects as packages has several advantages, such as increased:

- Robustness
- Reproducibility
- Shareability
- Legibility
- Usability
- Maintainability

::: callout
## A thought about standards
Standards are more valuable that you may think.

The fact that we are teaching this course in English, for instance, rests on the assumption that you can read English.
None of the authors of this guide has English as their mother tongue.
Using English was a **choice**, aimed at maximizing the amount of people able to read this guide.
And all of this rests on the fact that English is, nowadays, the standard language of science.

Something similar happens with R packages.
Structuring your R projects as an R package is a way of making them available to a huge pool of people who "speak" R.
And the communication goes both ways.
Other developers or collaborators can use your software easier, but you can also use theirs.

Indeed, most likely you are already part of this "conversation".
Did you ever use a library (such as `knitr`, `lubridate` or `stringi`)?
If the answer is yes, you are already using packages.
Packages written by someone else.

In this lesson we will show you how to write your own, so you can actively participate in the R community.
:::

::: discussion
## How can this course help me?
As we will see during this course, applying a standardized structure comes with several unexpected benefits.
Let me ask you a few questions:

- Did you ever have problems running a script written by a colleague?
- Did you ever have problems running your own code?
- Are you sometimes scared of editing your code, just in case you "break" it?
- Did you ever have to re-do all the figures in your paper manually?
- Do you suspect that some parts of your code may not be working as you want them to?
- Do you feel that you are losing control about how your code is growing?

If your answer to any of the previous questions is yes, stay with us.
You may not know it yet, but software packaging can make your life easier.

Can anyone give an example of these things happening to them in their work?
:::

## Prerequisites
Have you ever written an `R` function?
If the answer is yes, then you are ready to take this course.
If the answer is no, we recommend you read [this episode](https://swcarpentry.github.io/r-novice-inflammation/02-func-R/index.html) of the [Programming with R](https://swcarpentry.github.io/r-novice-inflammation/) course.

::: callout
## Why R?
The practice of software packaging is applicable to many programming languages.
The language of choice for this course is R.
Is there any reason for that?

As we will see, R projects are particularly easy to be written in the form of packages.
This makes R the ideal language for getting started with packaging.
:::

::: callout
## Why RStudio?
RStudio is an Integrated Development Environment (IDE) specifically designed for `R`.
As many IDEs, it contains some menus and buttons arranged in an intuitive interface.
This will relieve a lot of mental space, as we do not have to remember the commands for common operations such as _building_, _saving_, _knitting_ and so on.
In this course we will make extensive use of it.
:::

::: callout
## Pro-tip
When you hover over a button in RStudio, a textbox will be displayed. Among other things, this textbox will contain the equivalent key combination (for instance, `Ctrl/Cmd + S` for saving).
Paying attention to these text boxes is a perfect way of getting used to, and ultimately remembering by heart, those key combinations.

Additionally, after pressing a button, some commands will be executed in the console.

It is always very instructive to take a look at what commands the button triggered.
:::

::: keypoints
- "An R package is a project in a standardized folder structure"
- "An R package centers around R functions"
- "RStudio is a useful editor that helps you package your project"
:::
