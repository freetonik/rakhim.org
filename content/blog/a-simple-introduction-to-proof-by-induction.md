+++
title = "A Simple Introduction to Proof by Induction"
author = ["Rakhim Davletkaliyev"]
date = 2018-09-20T17:18:00+03:00
tags = ["good"]
draft = false
creator = "Emacs 26.3 (Org mode 9.1.9 + ox-hugo)"
+++

Now that you're familiar with [direct proof and proof by contradiction](/2018/09/a-simple-introduction-to-proof-by-contradiction/), it's time to discover a powerful technique of proof by induction.

_Aside: do not confuse mathematical induction with inductive or deductive reasoning. Despite the name, mathematical induction is actually a form of deductive reasoning._

Let's say, we want to prove that some statement \\(P\\) is true for all positive integers. In other words:

\\(P(1)\\) is true, \\(P(2)\\) is true, \\(P(3)\\) is true... etc.

We could try and prove each one directly or by contradiction, but the infinite number of positive integers makes this task rather grueling. Proof by induction is a sort of generalization that starts with the basis:

**Basis:** Prove that \\(P(1)\\) is true.

Then makes one generic step that can be applied indefinitely:

**Induction step:** Prove that for all \\(n\geq1\\), the following statement holds: If \\(P(n)\\) is true, then \\(P(n+1)\\) is also true.

See what we did there? We've devised another problem to solve, and it's seemingly the same. But if the basis is true, then proving this _inductive step_ will prove the theorem.

To do this, we chose an arbitrary \\(n\geq1\\) and assume that \\(P(n)\\) is true. This assumption is called the _inductive hypothesis_. The tricky part is this: we don't prove the hypothesis directly, but prove the \\(n+1\\) version of it.

This is all rather amorphous, so let's prove a real theorem.

**Theorem 1.** For all positive integers \\(n\\), the following is true:

\begin{equation}
\label{eq:1}
1 + 2 + 3 + ... + n = \frac{n(n+1)}{2}
\end{equation}

**Proof**. Start with the basis when \\(n\\) is \\(1\\). Just calculate it:

\\[ 1 = \frac{1(1+1)}{2}. \\]

This is correct, so, the basis is proven. Now, assume that the theorem is true for any \\(n\geq1\\):

\begin{equation}
\label{eq:2}
1 + 2 + 3 + ... + n = \frac{n(n+1)}{2}
\end{equation}

In the induction step we have to prove that it's true for \\(n+1\\):

\begin{equation}
\label{eq:3}
1 + 2 + 3 + ... + (n+1) = \frac{(n+1)(n+2)}{2}
\end{equation}

Having this equation, we should just try to expand it and prove directly. Since the last member on the left side is \\(n+1\\), the second last must be \\(n\\), so:

\\[ 1 + 2 + 3 + ... + (n + 1) = 1 + 2 + 3 + ... + n + (n+1) \\]

From our assumption, we know, that

\\[ 1 + 2 + 3 + ... + n = \frac{n(n+1)}{2}. \\]

So, let's replace it on the right hand side:

\\[ 1 + 2 + 3 + ... + (n + 1) = \frac{n(n+1)}{2} + (n+1) \\]

And then make that addition so that the right hand side is a single fraction:

\\[ 1 + 2 + 3 + ... + (n + 1) = \frac{n(n+1)}{2} + \frac{2(n+1)}{2} \\]

\\[ = \frac{n(n+1) + 2(n+1)}{2} \\]

\\[ = \frac{(n+1)(n+2)}{2}. \\]

Done, we have proven that the inductive step (\ref{eq:3}) is true.

There are two results:

1.  The theorem is true for \\(n=1\\).
2.  If the theorem is true for any \\(n\\), then it's also true for \\(n+1\\).

Combining these two results we can conclude that the theorem is true for all positive integers \\(n\\).

---

I had troubles with this technique because for a long time I couldn't for the life of me understand why is this _enough_ and how is the basis _helping_?! The basis seemed redundant. We assume \\(P(n)\\) is true, then prove that \\(P(n+1)\\) is true given that \\(P(n)\\) is true, but so what? We didn't prove the thing we assumed!

It clicked after I understood that we don't have to prove \\(P(n)\\), we just take the concrete value from the basis and use it as \\(n\\). Since we have a proof of \\(P(n+1)\\) being true **if** \\(P(n)\\) is true, we conclude that if \\(P(1)\\) is true, then \\(P(1+1)\\) is true.

Well, if \\(P(1+1)\\) is true, then, using the same idea, \\(P(1+1+1)\\) is true, and so forth.

The basis was the cheat-code to kick-start the process by avoiding the need to prove the assumption \ref{eq:2}.
