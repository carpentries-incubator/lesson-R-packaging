---
title: "Testing"
teaching: 0
exercises: 0
questions:
- "How can I know that my package works as expected?"
objectives:
- "Understand why tests are useful"
- "Learn how to create a battery of basic tests"
- "Learn how to run the tests"
keypoints:
- "FIXME"
---

What is the first thing you do after writing a function or another piece of code?
Most likely, you try it, and figure out if it works as expected.
Right?
If the answer is yes, congratulations!
You already know the very basics of testing!

The main lesson we'll get out of this episode is that those kind of tests are extremely valuable.
So much, that they deserve more than just be typed on the console and be forgotten forever.
Tests deserve to be saved, and even more, rerun often.

## Why shall I store my tests?

The vast majority of people needs to try their scripts and functions in order to make sure they work fine.
And we do it.
What is the added value of storing those tests?
> ## What is the added value of storing my tests?
> Storing tests in the form of a script takes a bit more time and effort than just running them interactively in the console.
> 
> Do you have any idea about why is it worth the effort?
> > ## Solution
> > There are several reasons why storing your tests is a good idea.
> > Some of them are:
> >
> > - **Code is alive**. What works today may fail tomorrow. Keeping the tests will help us identifying future failures.
> > - **Tests can be used as supporting documentation**. As we'll see soon, tests are often use examples. This can be very valuable for users.
> > - **Your tests can be run by a colleague**. For instance, in a different computer. If some installation or dependency problem appears, the tests will help discovering it.
> {: .solution}
{: .discussion}

## How to test

The easiest way to start writing tests is by asking the `usethis` package to create the folder structure for us:

```r
usethis::use_testthat()
```
> ## What happened?
> Take a look at the output of `usethis::use_that()`.
> Take also a look at your folder system (press the refresh button if needed).
> 
> What happened?
> > ## Solution
> > The command above took care of all the folder structure regarding tests.
> {: .solution}
{: .discussion}

{% include links.md %}