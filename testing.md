---
title: "Testing"
teaching: 60
exercises: 30
---

::: questions
- How can I know that my package works as expected?
:::

::: objectives
- Understand why tests are useful
- Learn how to create a battery of basic tests
- Learn how to run the tests
- Learn to not panic if a test fails
- Optional: Learn how to perform a code check
:::


What is the first thing you do after writing a function or another piece of code?
Most likely, you try it, and figure out if it works as expected.
Right?
If the answer is yes, congratulations!
You already know the very basics of testing!

The main lesson we'll get out of this episode is that those tiny tests are extremely valuable.
So much, that they deserve more than just being typed on the console and be forgotten forever.
Tests deserve to be saved, and even more, rerun often.
As we will see now, tests can actually be a built-in part of your package!

## Manual tests

Now, let's take a look at the function we have written.
How can we check that it works as expected?
One possibility could be trying the function in the console.
For instance:


``` r
library(mysterycoffee)

names <- c("Luke", "Vader", "Leia", "Chewbacca", "Solo", "R2D2")
grouped_names <- make_groups(names)

print(grouped_names)
```


The output should look similar to this:

```output
     [,1]    [,2]
[1,] "Luke"  "Chewbacca"
[2,] "Vader" "Solo"
[3,] "Leia"  "R2D2"
```

From what has been printed to the console, we can tell that everything went fine.
And not just that: We are receiving a lot of information just by looking at how the function did its job.
For instance, we notice that:

- All names appear once and only once.
- The names have been randomly reordered.
- The function created three pairs of names.
- The output is a matrix of strings.

All of this is excellent, but these tests pose a practical problem: if we test by looking at the output of the function, **someone** has to be there to check it went fine.
Is there a way of avoiding this?
The answer is yes. We can use **automated tests** to do this for us.

## Automated tests

Automated tests are tiny scripts that do exactly what we just did: check that everything is fine.
In R packages, R tests are expected to live inside the `tests/testthat/` folder.
The easiest way to start writing tests is by asking the `usethis` package to create the folder structure for us:

```r
usethis::use_testthat()
```

::: discussion
## What happened?
Take a look at the output of `usethis::use_testthat()`.
Take also a look at your folder system (press the refresh button if needed).

What happened?
:::

::: solution
The command above took care of all the folder structure regarding tests.
It also printed some useful information on the console:

```
✓ Setting active project to '~/mysterycoffee'
✓ Adding 'testthat' to Suggests field in DESCRIPTION
✓ Setting Config/testthat/edition field in DESCRIPTION to '3'
✓ Creating 'tests/testthat/'
✓ Writing 'tests/testthat.R'
• Call `use_test()` to initialize a basic test file and open it for editing.
```


It also created a file called `tests/testthat.R`.
This a system file that rarely has to be manually edited.
:::

::: discussion
## Why are we not attaching `usethis`?
In the example above, we used:

```r
usethis::use_testthat() # Recommended
```

but we could have also used:
```r
library(usethis)
use_testthat() # Correct, but not recommended
```

Do you have any idea why? Are the two code snippets above not equivalent?
:::

::: solution
When we are developing a package, we'd like to keep our working space as clean and isolated as possible.
The first, recommended snippet, is bringing exactly one function from the `usethis` package to our environment.
The second one, on the contrary, is bringing **each and every** function contained in `usethis` to our environment.
:::

### Our first test

Let's follow the advice printed in the console and invoke the `use_test()` function:

```r
usethis::use_test('functions')
```


Once again, very useful information will be printed in the console:

```output
✓ Writing 'tests/testthat/test-functions.R'
• Modify 'tests/testthat/test-functions.R'
```

## Use smart names
`usethis::use_test(<name>)` will generate the test file `tests/testthat/test-<name>.R`.
Our functions live in a file called `functions.R`, so choosing `functions` as the name for the tests file is a good idea.

::: callout
Don't forget that projects may grow, and in the future perhaps you'll have several files containing different functions (for instance, one containing the input/output functions, another containing functions used for analysis and a last one containing the plotting ones).
In such a situation, it will be advisable to have three test files, each of them with the corresponding name.
:::

Automated tests are very similar to testing directly in the console, but differ in a crucial aspect: they need to contain _assertions_.
An assertion is a line of code that, typically, warns us if a function behaves in an unexpected manner.
You could say that the assertions take the place of the observer, and check that the function is behaving in the expected way.
Most assertions are contained in the `testthat` package, and have names starting by `expect_`, such as `expect_equal`, `expect_true`, and so on.

::: challenge
## Write your own test
Let's follow the advice printed in the console and modify the file `tests/testthat/test-functions.R`.
In order to do this, we first have to open it and take a look at its contents.
It should contain something like this:

```r
test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
```

This is just an example test, that was created to make your life easier.
You can use it as a template for writing your own tests.
Take 10 minutes to:
1. Figure out what is happening inside this test. Can you understand it?
2. Write another test, just below this one, that checks that addition also works. Tip: you can copy-paste and edit the current test.

:::: solution
The first argument to `test_that` is simply the name of your test, that you choose.
Beyond that, the test is checking that 2 times 2 equals 4.
This may sound silly, but actually something quite interesting is happening.
The test checks that the `*` operator in _R_ works and your human interpretation of multiplication are aligned.

Regarding the test for addition, a possible solution would be:

```r
test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("addition works", {
  expect_equal(2 + 3, 5)
})
```
::::
:::

::: callout
## Expectations vs results
Notice that the _assertions_, also known in R as _expect functions_ often look like:

```r
expect_equal(<actual result>, <expected result>)
```

Where the actual result is obtained using software, and the expected result is provided via expert knowledge.

Other common _expect functions_ are:

```r
expect_true(<statement we expect to be true>)
expect_false(<statement we expect to be false>)
expect_error(<code we expect to fail>)
```

Please refer to [`testthat` documentation](https://testthat.r-lib.org/reference/index.html) for a thorough list of _expect functions_.
:::

## A real test

So, we just used tests to convince ourselves that `R` can multiply and add numbers.
But this was not our original goal.
What we would like to do is to write an automated test that checks that our function `make_groups` works as expected.
In order to do this, it will be useful to create a new testing file:

```r
usethis::use_test('make_groups')
```

This will create a test file in `tests/testthat/test-make_groups.R`.
It will contain an example test that we can delete.

What can we test now?
For instance, the test below will check that the number of elements in the output equals 6:

```r
test_that("number of elements", {
  names <- c("Luke", "Vader", "Leia", "Chewbacca", "Solo", "R2D2")
  grouped_names <- make_groups(names)

  expect_equal(length(grouped_names), 6)
})
```

::: challenge
## Automated vs manual testing
Take a look at the test above, and compare it to the manual test we did at the beginning of this episode.
What differences do you see?

:::: solution
There are two main differences.

One is small: we don't have to attach the library.
The file `tests/testthat.R` takes care of this automatically for us.

The other is more important: we are not checking by looking at the result.
Instead, we have to write down an assertion.
In our case, we instruct `R` to expect that the number of elements of our ouput should be 6.
(Remember the structure `expect_equal(<actual result>, <expected result>)`)
::::
:::

::: challenge
## Test shape
Now it is your turn to write a test.
Using the same input as in the previous examples, I want you to check that the output is a matrix with 3 rows and 2 columns.

Tip 1: tests can contain multiple assertions.

Tip 2: the functions `nrow` and `ncol` may come in handy.

:::: solution
The new test should look similar to:
```r
test_that("shape", {
  names <- c("Luke", "Vader", "Leia", "Chewbacca", "Solo", "R2D2")
  grouped_names <- make_groups(names)

  expect_equal(nrow(grouped_names), 3)
  expect_equal(ncol(grouped_names), 2)
})
```
::::
:::

## Running the tests

The tests can be run from the build tab, usually located in the upper right corner.
Just press `More Test package`.
The menu will also show you the hotkey, typically `Ctrl / Cmd + Alt + T`.

![Test package](fig/test.gif)

After the tests are performed, a handy summary table will be displayed:

```output
==devtools::test()

ℹ Loading mysterycoffee
ℹ Testing mysterycoffee
✓ |  OK F W S | Context
✓ |   2       | functions
✓ |   3       | make_groups

══ Results ══════════════════════════════════════════════════
[ FAIL 0 | WARN 0 | SKIP 0 | PASS 5 ]

Nice code.
```

The table above tells us that all the three tests passed successfully.

## Test coverage
Test coverage is an indirect method to assess the quality of your package: As a rule of thumb, the higher the test coverage, the more you can be confident that your package is working as expected. It works by measuring the amount of lines of code in your package that have been tested by your test set. For example, let's say that we have written 100 lines of code. The number of lines executed via our tests is 30, then my test coverage is `30%`:

```r
(30 / 100) * 100
```


You can measure automatically your test coverage by using the `covr` package via its `report()` function.

```r
library(covr)
report()
```

`report()` provides a nice table summarising the coverage of the functions in your package.

### Why measuring tests' coverage?
Having an idea of how many lines of code you have effectively tested can help you identify what conditions, decision points (i.e., if/else scenario) and thus portions of the code you may have left out from your tests, perhaps because you haven't thought about it.

For more information about how `covr` works:

```r
vignette("how_it_works", package = "covr")
```

## What to do if a test fails?

When writing tests, you are allowed to think a bit evil.
Actually, you are encouraged to.
It is a good idea to think of the many ways the package may fail, and try them.

I think I figured out one: what if we want to use `make_groups` with an uneven number of names?
Let's write a test for testing that.

::: challenge
## Uneven mysterycoffee
Write new a test that passes an uneven number of names to `make_groups`.

You can use our previous test, the one we called _"number of elements"_, as a template, and adapt it to accept a list with one more name.
This should be a new, additional test, so please copypaste it, don't delete it.

Run the tests again.
What happened?

:::: solution
We can add a seventh, annoying and troublemaking character, to our list.
The test will look as below.
Note that we gave this test a descriptive name of what we are testing: _"uneven number of elements"._

```r
test_that("uneven number of elements", {
 names <- c("Luke", "Vader", "Leia", "Chewbacca", "Solo", "R2D2", "Jar Jar Binks")
 grouped_names <- make_groups(names)

 expect_equal(length(grouped_names), 7)
})
```

After we run the test, we get an ugly message:

```output
ℹ Loading mysterycoffee
ℹ Testing mysterycoffee
✓ |  OK F W S | Context
✓ |   2       | functions
✓ |   3   1   | make_groups
───────────────────────────────────────────
Warning (test-make_groups.R:18:3): uneven number of elements
data length [7] is not a sub-multiple or multiple of the number of rows [4]
Backtrace:
 1. mysterycoffee::make_groups(names) test-make_groups.R:18:2
 2. base::matrix(names_shuffled, ncol = 2) ./R/mysterycoffee/R/functions.R:16:2
───────────────────────────────────────────
>
══ Results ════════════════════════════════
[ FAIL 0 | WARN 1 | SKIP 0 | PASS 5 ]
```

Don't let the ugliness of the panel intimidate you.
As usual, we have a lot of high-quality information here.

To begin with, we got a warning and not an error.
This means that the code ran, but it may not behave as expected.

Additionally, we get a human-readable description of what went wrong: the length of the data is 7, and that's not a sub-multiple of the number of rows, which is 4.

It even gives us a backtrace, that points to the exact files and lines in those files where something went wrong.
::::
:::

::: discussion
## What shall we do now?
So, thanks to our test, we discovered a possible problem in our function.
What shall we do now?

There are several possibilities.
We can leave the function just as it is, and modify the test to assert that a warning is thrown.
We can forbid the user to introduce any number that is not even, and throw an error otherwise.
Maybe we can come up with an improved function that fixes this.

All of them are reasonable possibilities.
Just keep one thing in mind: whatever change we make, it ideally shouldn't affect the tests that we already wrote!

What would be your preferred solution?
:::

## What are tests good for?

In this episode we learned how to create, store and run automated tests.
But an even more important question is: why do we want tests for?
Let's reflect for five minutes about this relevant topic.

::: challenge
## What is the added value of automated testing?
Storing tests in the form of a script takes a bit more time and effort than just running them interactively in the console.

Do you have any idea about why is it worth the effort?

:::: solution
There are several reasons why storing your tests is a good idea.
Some of them are:

- **Code is alive**. What works today may fail tomorrow. Keeping the tests will help us identifying future failures.
- **Tests can be used as supporting documentation**. As we'll see soon, tests are often use examples. This can be very valuable for users.
- **Your tests can be run by a colleague**. For instance, in a different computer. If some installation or dependency problem appears, the tests will help discovering it.
::::
:::

## Some caveats

::: callout
## Testing plotting functions
Very often, research packages contain plotting functions.
The way to manually check that these functions work correctly is, usually, to create the plots and look at them.
But this cannot be considered automated testing!

There are, nevertheles, a few things that you can test on a plotting function.
For instance, you can check that it doesn't crash.
Or that it produces a plot object... even if nobody checks if it looks nice.
:::

## Checking (optional)

Also in the build tab there is a button with the text `Check` on it.

![Check package](fig/check.gif)

This button can be understood as an extended version of testing. When pressed, several things will happen:

- It will attach the package.
- It will check that all dependencies are installed.
- It will check that the documentation can be generated.
- It will perform the tests.
- And most importantly, it will show an error with a descriptive message if something failed.

::: callout
## Let's check!
Press check, and discuss what happens.

Do not worry at all if you get some warnings and errors.
Actually, most likely you'll get some.
And we'll explain you why that is good news.
:::

::: discussion
## Checking vs testing
When we check we perform the tests, and much more.
In that sense, we can say that checking is better than testing.
Why would you want to test instead?
When would you test, and when would you check?
:::

:::: solution
Checking is usually significantly slower than testing.
For small changes in the code, it is usually a good idea to test.
For larger changes, or an accumulation of several small ones, it is a good idea to check.

Rule of thumb: test often, check every now and then.
::::

::: keypoints
- Tests help you write a reliable package
- A failing test provides a lot of valuable information
- Checking goes deeper than testing
:::
