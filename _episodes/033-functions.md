---
title: "Writing our own functions"
teaching: 0
exercises: 0
questions:
- "How can I add functionality to my package"
objectives:
- "Create a custom package"
keypoints:
- "Functions have to be written in R files in the R folder"
---

So far, we have been playing with the example package that is built-in in `RStudio`.
It only contains a function that says `Hello, world!`.
This is extremely useful to get started, but not very interesting.
In this and the next episodes, we will create our own customized package, which in the previous episode we gave the name of `mysterycoffee`.

## `mysterycoffee`, our virtual coffee room

Our package will try to mitigate a practical problem: social isolation in remote working environments.
We want to create a software solution that simulates the random encounters at the office's coffee machine... when there is no office.
The very first step is to answer two very important questions:

> ## How can we do it?
> This is a very important question.
> Before starting with coding, it is a good idea to spend some time thinking about how to implement it.
> 
> The goal is to simulate random encounters between couples of employees.
> Thus, a reasonable design will be the following:
>
> - **Input**: list of employees' names.
> - **Output**: a two-column table, randomly coupling the employees' names.
>
> So this will be our starting point.
>
> Later on we'll see that our original design may face unexpected challenges.
> For instance, what happens if the number of employees is odd?
{: .callout}

> ## Are we reinventing the wheel?
> This is also an important question worth investing some time in.
> Perhaps we can solve our problem with a software solution that someone else already wrote?
>
> Well... if our problem really was to simulate random encounters, the answer is yes.
> There are already solutions for this.
> But our **real** problem is learning how to make R Packages, isn't it?
> So we'll use this problem as a pedagogical example.
{: .callout}

{% include links.md %}