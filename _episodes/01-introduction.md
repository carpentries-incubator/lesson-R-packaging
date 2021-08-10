---
title: "Introduction"
teaching: 20
exercises: 0
questions:
- "What is a package?"
- "Why do we want a package?"
objectives:
- "Understand what is a package"
- "Understand why a package is useful"
keypoints:
- "Folder structure"
- "The value of standards"
---

Picture yourself starting a new programming project.
Most likely, your first step will consist on creating a new folder, a folder that later you'll populate with files.
If the project is long and complex, you'll need several files and also some subfolders.
The folder structure can eventually become pretty complex and difficult to maintain, specially if your project has multiple authors.

Wait a moment!
Long and complex projects, multiple authors, ... this sounds like **any** scientific project!
Is there a way of making this process easier?
The answer is yes, and the way is by structuring our work as a software package.

## What is a package and what is it good for?

A package is no more and no less than a standard way of structuring your project.
Doesn't sound very impressive, but don't let the simplicity of the idea deceive you.
We'll see that structuring our projects as packages have several advantages, such as increased:

- Robustness
- Reproducibility
- Shareability
- Legibility
- Usability
- Maintainability

And after all, you need a folder structure anyways.
Why not use one of proven quality?

> ## A thought about standards
> Standards are more valuable that you may think.
>
> The fact that you are reading this guide now, for instance, rests on the assumption that you can read English.
> None of the authors of this guide has English as their mother tongue.
> Using English was a **choice**, aimed at maximizing the amount of people able to read this guide.
> And all of this rests on the fact that English is, nowadays, the standard language of science.
>
> Something similar happens with R packages.
> Structuring your R projects as an R package is a way of making them available to a huge pool of people who "speak" R.
> And the communication goes both ways.
> Other developers or collaborators can use your software easier, but you can also use theirs.
>
> Indeed, most likely you are already part of this "conversation".
> Did you ever used a library (such as `knitr`, `lubridate` or `stringi`)?
> If the answer is yes, you are already using packages.
> Packages written by someone else.
>
> In this lesson we'll show you how to write your own, so you can participate actively in the R community.
{: .callout}

## How can this course help me?

As we'll see during this course, the apparently dull objective of working on a tidier environment comes with several unexpected perks.
Let me ask you a few questions:

- Did you ever have problems running research software written by a colleague?
- Did you ever have problems running your own software?
- Are you sometimes scared of editing your code, just in case you "break" it?
- Did you ever have to re-do all the figures in your paper manually?
- Do you suspect that some parts of your code may not be working as you want them to?
- Do you feel that you are losing control about how your code is growing?

If your answer to any of the previous questions is yes, stay with us.
You may not know it yet, but software packaging can make your life easier.

> ## Prerequisites
> Have you **ever** used _R_?
> If the answer is yes, then you are ready to take this course.
{: .prereq}
> ## Why R?
> The practice of software packaging is applicable to many programming languages.
> The language of choice for this course is R.
> Is there any reason for that?
>
> As we will see, R projects are particularly easy to be written in the form of packages.
> This makes R the ideal language for getting started with packaging.
{: .callout}

{% include links.md %}
