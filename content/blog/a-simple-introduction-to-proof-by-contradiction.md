+++
title = "A Simple Introduction to Proof by Contradiction"
author = ["Rakhim Davletkaliyev"]
date = 2018-09-12T17:49:00+03:00
categories = ["mathematics"]
draft = false
creator = "Emacs 26.1 (Org mode 9.1.9 + ox-hugo)"
+++

In mathematics, a theorem is a true statement, but the mathematician is expected to be able to prove it rather than take it on faith. The proof is a sequence of mathematical statements, a path from some basic truth to the desired outcome. An impeccable argument, if you will.

One of the basic techniques is proof by contradiction. Here is the idea:

1.  Assume the statement is false.
2.  Derive a contradiction, a paradox, something that doesn't make sense. This will mean that the statement cannot possibly be false, therefore it's true.

When I first saw this formal technique, it puzzled me. It didn't seem to be valid: alright, assuming something is false leads to a paradox, so what? We haven't proven that assuming it's true doesn't lead to another paradox! Or even the same paradox, for that matter. What I failed to understand conceptually is that a statement is a binary thing: it's either true or untrue. Nothing in between. So, if one can definitely declare "X is not false", then no other options are left: "X must be true".


## Direct proof {#direct-proof}

To demonstrate this, let's first use another technique of a _direct proof_ so that we have something to work with.

**Theorem 1.** If \\(n\\) is an odd positive integer, then \\(n^2\\) is odd.

A _direct proof_ just goes head in, trying to see what the statement means if we kinda play with it.

**Proof.** An odd positive integer can be written as \\( n = 2k + 1 \\), since something like \\( 2k \\) is even and adding 1 makes it definitely odd. We're interested in what odd squared looks like, so let's square this definition:

\\[ n^2 = (2k + 1)^2 = \\]
\\[4k^2 + 4k + 1 = \\]
\\[ 2(2k^2 + 2k) + 1 \\]

So, we have this final formula \\( 2(2k^2 + 2k) + 1 \\) and it follows the pattern of \\( 2k + 1 \\). This means it's odd! We have a proof. ■

This theorem is based on an idea that numbers described as \\( 2k + 1 \\) are definitely odd. This might be another theorem that requires another proof, and that proof might be based on some other theorems. The general idea of mathematics is that if you follow any theorem to the very beginning, you'll meet the fundamental axioms, the basis of everything.

Now that we have this proven theorem in our arsenal, let's take a look at another theorem and prove it by contradiction.


## Proof by contradiction {#proof-by-contradiction}

**Theorem 2.** \\(n\\) is a positive integer. If \\( n^2 \\) is even, then \\(n\\) is even.

We may try to construct another direct proof, but creating paradoxes is much more fun!

**Proof.** Let's assume that \\(n^2\\) is even, **but \\(n\\) is odd**. This is the opposite of what we want, and we will show that this scenario is impossible.

\\(n\\) is odd, and from Theorem 1 we know that \\(n^2\\) must be odd. This doesn't make sense! Our assumption and our conclusion are the opposite. This is a paradox, so the assumption was wrong. Meaning, the idea "\\(n^2\\) is even, but \\(n\\) is odd" is false. Therefore, the idea "\\(n^2\\) is even, \\(n\\) is even" is true.■


## Famous irrational \\( \sqrt{2} \\) {#famous-irrational--sqrt-2}

**Theorem 3.** \\( \sqrt{2} \\) is irrational.

Woah, this is... different. In the first two theorems we had formulas, something to play with, something physical. This now is just an idea, so how would we even start?

Let's start with a definition.

> In mathematics, the irrational numbers are all the real numbers which are not rational numbers.[^fn:1]

Doesn't seem helpful, but let's continue. What are rational numbers then? Are they some reasonable beings who make optimal decisions all the time?

> A rational number is any number that can be expressed as the fraction \\(\frac{p}{q}\\) of two integers.[^fn:2]

Oh! They are rational because they are _ratios_!

Just to make things super clear, let's dig one more step and make sure we understand integers.

> An integer (from the Latin _integer_ meaning "whole") is a number that can be written without a fractional component. For example, 21, 4, 0, and −2048 are integers, while \\(9.75\\), \\( 5\frac{1}{2} \\) and \\( \sqrt{2} \\) are not.[^fn:3]

Combining these things, we can construct a comprehensive definition of an irrational number: it's a number that cannot be expressed as the fraction of two whole numbers.

Now, let's apply this to Theorem 3 so that it has some meat:

**Theorem 3.** \\( \sqrt{2} \\) cannot be expressed as \\( \frac{p}{q} \\), where \\(p\\) and \\(q\\) are integers.

Alright, now there is something to play with!

**Proof.** Start by assuming the opposite -- \\( \sqrt{2} \\) is rational. This means it can be written as a fraction of two integers:

\\[ \sqrt{2} = \frac{p}{q}\ \\]

We can assume that \\(p\\) and \\(q\\) are not **both** even, because if they are, we can reduce them by dividing both by a common factor (like, for example, \\( \frac{8}{10}\ \\) should be reduced to \\( \frac{4}{5}\ \\)). In other words, if they are both even, reduce them until at least one is odd and no further reductions are possible.

Now, let's square the square root:

\\[ (\sqrt{2})^2 = \frac{p^2}{q^2}\ \\]

\\[ 2 = \frac{p^2}{q^2}\ \\]

\\[ p^2 = 2q^2 \\]

Remember, something like \\(2k + 1\\) is odd, and \\(2k\\) is even. Here we see this pattern: \\(p^2 = 2q^2\\), which means that \\(p^2\\) is even (it consists of _two_ things).

Then, using Theorem 2, we can say that \\(p\\) is even as well, which means we can write \\(p\\) as \\(p = 2k\\). So:

\\[ 2q^2 = p^2 = (2k)^2 \\]

\\[ 2q^2 = 4k^2 \\]

Divide both by two:

\\[ q^2 = 2k^2 \\]

So, \\(q^2\\) is even. By the same Theorem 2 it follows that \\(q\\) is even.

Let's summarize the two conclusions:

1.  \\(p\\) is even.
2.  \\(q\\) is even.

Wait... We made sure that not both \\(p\\) and \\(q\\) are even before starting this whole thing! We made sure to reduce them until at least one is odd, but then, by applying Theorem 2, we ended up with two even numbers. This is impossible, so the idea that "\\(\sqrt{2}\\) is rational" is not true.

Therefore, \\(\sqrt{2}\\) is irrational.■

_P.S. I often use proof by contradiction in real life by arguing that, for example, not eating the whole bucket of ice cream at once will lead to a paradox that endangers the whole fabric of space-time. It works for me, but your mileage my vary._

[^fn:1]: <https://en.wikipedia.org/wiki/Irrational%5Fnumber>
[^fn:2]: <https://en.wikipedia.org/wiki/Rational%5Fnumber>
[^fn:3]: <https://en.wikipedia.org/wiki/Integer>
