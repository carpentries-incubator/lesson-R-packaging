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

The main lesson we'll get out of this episode is that those tiny tests are extremely valuable.
So much, that they deserve more than just be typed on the console and be forgotten forever.
Tests deserve to be saved, and even more, rerun often.

## Testing our function

Now, let's take a look at the function we have written.
How can we check that it works as expected?
One possibility could be trying the function in the console.
For instance:

~~~r
library(mysterycoffee)

names <- c("Luke", "Vader", "Leia", "Chewbacca", "Solo", "R2D2")
make_groups(names)
~~~
{: .source}

The output should look similar to this:

~~~
     [,1]    [,2]       
[1,] "Luke"  "Chewbacca"
[2,] "Vader" "Solo"     
[3,] "Leia"  "R2D2"
~~~
{: .output}

By naked eye, we notice that everything went fine.
Actually, we are receiving a lot of information from a single sight.
For instance, we notice that:

- All names appear once and only once.
- The names have been randomly reordered.
- Actually three groups of two people have been made.
- The output is a matrix of strings.

All of this is excellent, but as we'll see, we can do it even better.

## Automated tests

Automated tests are tiny scripts that do exactly what we did: check that everything is fine.
In R packages, R tests are expected to live inside the `tests/testthat/` folder.
The easiest way to start writing tests is by asking the `usethis` package to create the folder structure for us:

```r
usethis::use_testthat()
```
> ## What happened?
> Take a look at the output of `usethis::use_testthat()`.
> Take also a look at your folder system (press the refresh button if needed).
> 
> What happened?
> > ## Solution
> > The command above took care of all the folder structure regarding tests.
> > It also printed some useful information on the console:
> > 
> > ~~~
> > ✓ Setting active project to '~/mysterycoffee'
> > ✓ Adding 'testthat' to Suggests field in DESCRIPTION
> > ✓ Setting Config/testthat/edition field in DESCRIPTION to '3'
> > ✓ Creating 'tests/testthat/'
> > ✓ Writing 'tests/testthat.R'
> > • Call `use_test()` to initialize a basic test file and open it for editing.
> > ~~~
> > {: .source}
> > 
> > It also created a file called `tests/testthat.R`.
> > This a system file that rarely has to be manually edited.
> {: .solution}
{: .discussion}

### Our first test

Let's follow the advice printed in the console and invoke the `use_test()` function:

~~~r
usethis::use_test()
~~~
{: .source}

Once again, very useful information will be printed in the console:

~~~
✓ Writing 'tests/testthat/test-functions.R'
• Modify 'tests/testthat/test-functions.R'
~~~
{: .output}

Automated tests are very similar to testing directly in the console, but differ in a crucial aspect: they need to contain _assertions_.
An assertion is a line of code that, typically, warns us if a function behaves in an unexpected manner.
Most assertions are contained in the `testthat` package, and have names starting by `expect_`, such as `expect_equal`, `expect_true`, and so on.
> ## Write your own test
> Let's follow the advice printed in the console and modify the file `tests/testthat/test-functions.R`.
> In order to do this, we first have to open it and take a look at its contents.
> It should contain something like this:
>
> ~~~r
> test_that("multiplication works", {
>   expect_equal(2 * 2, 4)
> })
> ~~~
> {: .source}
> 
> This is just an example test, that was created to make your life easier.
> You can use it as a template for writing your own tests.
> Take 10 minutes to:
> 1. Figure out what is happening inside this test. Can you understand it?
> 2. Write another two tests, just below this one, that checks that addition and subtraction also work. Tip: you can copy-paste the current test.
>
> > ## Solution
> > 
> > The test is checking that 2 times 2 equals 4.
> > This may sound silly, but actually something quite interesting is happening.
> > The test checks that the `*` operator in _R_ works as expected.
> >
> > Regarding the tests for addition and subtraction, a possible solution would be:
> >
> > ~~~r
> > test_that("multiplication works", {
> >   expect_equal(2 * 2, 4)
> > })
> > 
> > test_that("addition works", {
> >   expect_equal(2 + 3, 5)
> > })
> > 
> > test_that("subtraction works", {
> >   expect_equal(2 - 3, -1)
> > })
> > ~~~
> > {: .source}
> >
> > Notice that the _assertions_ often look like: `expect_equal(<actual result>, <expected result>)`.
> > Where the actual result is obtained using software, and the expected result is provided via expert knowledge.
> {: .solution}
{: .challenge}

## Running the tests

The tests can be run from the build tab, usually located in the upper right corner.
Just press `More > Test package`.
The menu will also show you the hotkey, typically `Ctrl / Cmd + Alt + T`.

![Test package](../fig/test.gif)

After the tests are performed, a handy summary table will be displayed:

~~~
ℹ Loading mysterycoffee
ℹ Testing mysterycoffee
✓ |  OK F W S | Context
✓ |   3       | functions                                    

══ Results ══════════════════════════════════════════════════
[ FAIL 0 | WARN 0 | SKIP 0 | PASS 3 ]
~~~
{:. source}

The table above tells us that all the three tests passed successfully.

## Why shall I store my tests?

What is the added value of storing my tests?
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

{% include links.md %}