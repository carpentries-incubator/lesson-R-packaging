---
layout: lesson
root: .  # Is the only page that doesn't follow the pattern /:path/index.html
permalink: index.html  # Is the only page that doesn't follow the pattern /:path/index.html
---

Picture yourself starting a new programming project in R.
Most likely, your first step will consist of creating a new folder, a folder that later you'll populate with files.
If the project is long and complex, you'll need several files and also some subfolders.
The folder structure can eventually become pretty complex and difficult to maintain, specially if your project has multiple authors.

Wait a moment!
Long and complex projects, multiple authors, ... this sounds like **any** scientific project!
Is there a way of making this process easier?
The answer is yes, and the way is by structuring our work as a software package.

As we will see, this comes with unexpected advantages: packaging makes your code more robust, more predictable, shareable, easier to read and, most importantly, more enjoyable to write!

This workshop will teach you the first steps in creating your own R package.

<!-- this is an html comment -->

{% comment %} This is a comment in Liquid {% endcomment %}

> ## Prerequisites
>
> In order to follow this lesson you'll need:
>
> - To be able to understand simple `R` code.
> - To understand the concept of an `R` function.
>
> In case you are not familiar with the abovementioned topics, please follow first one of [our lessons about R](https://swcarpentry.github.io/r-novice-inflammation/).
>
> Additionally, please visit our [setup section](setup.md) to make sure you installed all the required software.
{: .prereq}

{% include links.md %}
