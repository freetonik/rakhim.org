+++
title = "Summary of Truth about Types, a talk by Bartosz Milewski"
date = 2020-02-10T18:29:00+02:00
+++

<script src="{{ "js/mathjax-config.js" | absURL }}"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML"></script>


## Intro {#intro}

Category theory abstracts many branches of math. You can describe topology, logic, Banach spaces and other concepts in terms of category theory. Why is it so? Does category theory describe the nature, the intrinsic reality, and we happened to discover it like physicists discover the laws of the universe?

The main idea of category theory is composition. This is why it is so relevant in programming. Composition is the essence of category theory.

Is composability intrinsic in nature? It seems like that on a larger scale, and classical physics shows how everything is neatly composable. The ancient idea of atoms is the idea of perfect composability: things are composed with indivisible elementary particles, and the higher you go, the more composable everything is. Atoms make molecules, molecules make objects, object make bigger objects and interact using laws that are themselves composable. Newtonian mechanics describes objects in the universe that follow the rules of interaction that are clearly affecting each other, acting like independent agents.

But the deeper you go, the less composable it becomes. Two quantum particles don't interact in a simply composable fashion, their wave functions do not just affect each other in a stable manner. Two quantum particles near one another start to behave like a special two-particle state, not two wave functions. This is why quantum theory is so hard to describe and this is probably why physicists struggle with these theories. They go against our intuition of a composable universe.

So, maybe composability is not intrinsic in nature, maybe it is intrinsic for our limited monkey brains. We need composability in order to deal with the complex reality. Maybe, higher super-beings wouldn't invent category theory at all.


## Truth {#truth}

In logic, there is an axiom that basically says "truth is true", and you don't need to prove it.

\begin{eqnarray}
\frac{}{\top true}\top\_I
\end{eqnarray}

In type theory, it corresponds to unit type:

\begin{eqnarray}
():()
\end{eqnarray}

And in category theory it corresponds to the terminal object, which we will cover later.

Three things look different, but they are actually just different notations for the same concept.

As for proofs, in logic you'd prove a proposition A by providing some statements:

\begin{eqnarray}
\frac{[...]}{A}
\end{eqnarray}

In type theory, you'd prove that type **A** is inhabited (has members):

\begin{eqnarray}
\Gamma\vdash x : A
\end{eqnarray}

In the context of categories, a proof would be a morphism from terminal object:

\begin{eqnarray}
1\rightarrow A
\end{eqnarray}


## Category theory {#category-theory}

A [category](https://en.wikipedia.org/wiki/Category%5Ftheory) is a collection of objects and arrows.

Similar to a directed [graph](https://en.wikipedia.org/wiki/Graph%5Ftheory). Nodes are called **objects** (a, b, c,...). Arrows between objects are called **morphisms**: `f :: a -> b`.


### Composability {#composability}

Arrows are composable:

\begin{eqnarray}
f :: a \rightarrow b
\end{eqnarray}

\begin{eqnarray}
g :: b \rightarrow c
\end{eqnarray}

\begin{eqnarray}
g \circ f :: a \rightarrow c
\end{eqnarray}

The notation \\(g \circ f\\) means "apply `g` after `f`".

So, composition is associative.


### Identity arrows {#identity-arrows}

There always exist identity arrows that point to the same object:

\begin{eqnarray}
id\_a :: a \rightarrow a
\end{eqnarray}

\begin{eqnarray}
id \circ f = f
\end{eqnarray}

\begin{eqnarray}
g \circ id = g
\end{eqnarray}

There could be multiple arrows from `a` to `a`, but at least one is identity.


### Set {#set}

[Set](https://en.wikipedia.org/wiki/Set%5Ftheory) is an example of a category. Set is a category in which:

-   Objects are sets
-   Arrows are functions

In category theory, you cannot "look" inside objects, you only care about their connections. So, two sets are considered to be the same or different based on the arrows, but not the contents.


## Universal constructions in category theory {#universal-constructions-in-category-theory}


### Initial object {#initial-object}

An [initial object](https://en.wikipedia.org/wiki/Initial%5Fand%5Fterminal%5Fobjects) is an object that has a unique arrow to all other objects. Only one arrow per object.

{{< figure src="/images/posts/truth_about_types/initial_object.png" >}}

In Set, the equivalent would be an empty set \\(\varnothing\\). A function \\(varnothing \rightarrow a\\) is a function that maps an element of empty set to any other element of other set. This doesn't make sense: an element of empty set? But this is just an explanation in terms of set theory, and while it doesn't make sense, we can think about this nevertheless, as of "objects defined by their arrow property".

You can always create a function from an empty set, but you'll never be able to call this function. In the abstract, in vacuum this is true.

In Haskell there's Absurd function:

```haskell
Absurd :: Void -> a
```

Which is a reference to "ad absurdum": from falsehood, you can derive anythings. "If pigs can fly, then I am the president".

`Void` here represents a type `Void`, an uninhabited type. This is not the same void-type we use in C/C++.


### Terminal object {#terminal-object}

The inverse of initial object is the [terminal object](https://en.wikipedia.org/wiki/Initial%5Fand%5Fterminal%5Fobjects). An object with a unique arrow from all objects.

{{< figure src="/images/posts/truth_about_types/terminal_object.png" >}}

In set, it's a singleton set. Unique function: for every element of set **a** return the single element of the singleton set. In Haskell, the unit function ignores the argument and returns the one element from the set. The unit type `()` has one element `()`.

Type:

```haskell
unit :: a -> ()
```

Element of this type:

```haskell
unit _ -> ()
```

If there are many singleton sets, they are isomorphic (i.e., a set of one apple is the same as a set of one orange).


## Product {#product}

We need these universal constructions because they provide a way of defining things (since you cannot look inside the objects). One of the things that can be defined is the product.

-   `c` is a product of `a` and `b`
-   two arrows `p` and `q` (projections)
-   in Set: Cartesian product, pairs of elements
-   in logic: logical `AND` (conjuction elimination)

{{< figure src="/images/posts/truth_about_types/product.png" >}}

The only thing we know is that there are two morphisms. If we translate this into logic, it corresponds exactly to the elimination (AND). If `a AND b` is true, then `a` is true:

\begin{eqnarray}
\frac{a \wedge b}{a}
\end{eqnarray}

If `a AND b` is true, `b` is true:

\begin{eqnarray}
\frac{a \wedge b}{b}
\end{eqnarray}

This corresponds to morphisms like so:

```nil
c :: (a, b)
p(a, b) = a
q(a, b) = b
```

There can be many objects like `c` with such two projections. Only one could the product. Which one? We need to pinpoint the correct `c` that corresponds to the Cartesian product. We need a way to evaluate the instance of this pattern of projections.

If we can get all similar patterns in the category, we need a way to distinguish the "top" one, the one that matches the the best. That one would be the product.

Here we have two examples of such pattern:

{{< figure src="/images/posts/truth_about_types/candidate.png" >}}

`c'` is a candidate product and it has `p'` and `q'` projections. `c` is better if there is a unique arrow (morphism) `m` from `c'` to `c` that fulfils these conditions:

\begin{equation}
\begin{aligned}
m :: c' \rightarrow c \\\\\\
p' = p \circ m \\\\\\
q' = q \circ m
\end{aligned}
\end{equation}

Both of these have the common factor `m` (but instead of multiplication you have composition). So they are not really elementary, since we can factor out a common `m` out of them. This makes `c` better ("more pure").

This forms ranking among candidates. In some cases you can indeed use ranking to get the unique best option and that will be the product. Not all categories would have this.

Again, there is a connection to logic:

```nil
if a follows from c'       (p')
and b follows from c'      (q')
a ^ b (c) follows from c'  (m)
```


## Function object {#function-object}

Another universal construction.

What is type function in Haskell? It's not really a morphism. Morphism is not an object. A set of morphisms between two objects corresponds to type `a->b`. Is there an object in the category that corresponds to the set of morphisms? If so, it's called the Function Object.

In order to define the function object (in Haskell, it's `a->b`, which is a type), you have to have products.

{{< figure src="/images/posts/truth_about_types/function.png" >}}

If you take a function `a->b` and apply argument `a`, you get `b`. Similar to product, if there is another candidate object `z`, that evaluates to the same `b`, and you can find unique morphism `h` then you can factor it out and prove that `a->b` candidate is the best.

This corresponds to modus ponens in proof theory.

\begin{eqnarray}
\frac{(a=>b) \wedge a}{b}
\end{eqnarray}

If you have a function from `a` to `b` **and** `a` is true, then `b` is also true.


## Negation {#negation}

Another thing you can construct is negation. `Not A` corresponds to an arrow (morphism) `A -> Void`. Why is this a negation?

In the context of type theory:

-   If `A` is inhabited (has elements), then `A->Void` is not inhabited. Because otherwise you'd be able to create an element of `Void`, which suppose to have no elements.
-   If `A` is not inhabited (is Void), then `Void->Void` is \\(id\_{void}\\).


## Cartesian Closed Category {#cartesian-closed-category}

Combining these three things, we get a Cartesian Closed Category (CCC):

-   Has all products (Cartesian)
-   Has all function objects (exponentials) (this makes it closed)
-   Has terminal object (nullary product)


## Curry-Howard-Lambek {#curry-howard-lambek}

This is an extension of Curry-Howard isomorphism. CCC is a model for simply typed lambda calculus. In addition to the fact that simply typed lambda calculus can be a model for logic.

-   Objects are types
-   Morphisms are terms (in logic/programming)
-   Environment \\(\Gamma\\) is a prodict of judgements `a:A`
-   Empty environment is `() : ()`


## Logical universes {#logical-universes}

There are two major kinds of logic: Classical and Intuitionistic.

{{< figure src="/images/posts/truth_about_types/logics.png" >}}

In classical logic, any proposition is either true or false. But then Kurt Gödel comes along and says "no, there are some statements that are neither false nor true", which leads to intuitionistic logic where a statement can be true, can be false, but you can also have some gray area where you ask what "is" means.


### Intuitionistic logic {#intuitionistic-logic}

-   No LEM: law of excluded middle (either A or not A). `A | (A->Void)` is not provable.
-   We cannot eliminate double negation: `Not Not A` is not the same as `A` (`(A->Void)->Void` is not the same as `A`)

Curry-Howard equivalence says that simple typed lambda calculus is equivalent to intuitionistic logic. You cannot prove LEM or double negation using lambda calculus.

So, we cannot do classical logic? This means it's not relevant to programming then?


### Goedel Gentzen {#goedel-gentzen}

Turns out, classical logic can be embedded in intuitionistic logic. Classical logic = Intuitionistic + double negation elimination (or LEM).

You can take a proposition in classical logic that is provable, you can translate it into some other proposition in intuitionistic logic, and then translate the proof also that does not use double negation elimination or LEM, and you will get something. There is a correspondence between propositions in two types of logic.

The transformation of proposition is simple: invert everything by applying double negation to all assumptions. Get a new theorem, prove it in intuitionistic logic, apply double negation to it, you get back the result of that first theorem.

Double twist, prove, double twist!

What does it mean? It means **continuations**. Double negation is `(a->Void)->Void`, or more general:

\begin{eqnarray}
(a\rightarrow r)\rightarrow r
\end{eqnarray}

This \\((a\rightarrow r)\rightarrow r\\) is a continuation. If you extend lambda calculus with continuation (or do CPS transformation), you have a way to embed classical logic into programming.

<!--list-separator-->

-  Yoneda's Lemma

    This is a deeper topic in category theory, and Bartosz mentions it without explanation just to show the importance of continuation in category theory. [Read more about Yoneda's lemma on Wikipedia](https://en.wikipedia.org/wiki/Yoneda%5Flemma).


## Conclusions {#conclusions}

Type theory (typed lambda calculus), category theory (cartesian closed) and logic are all the same, just different notations. There is a lot of cross-polination between these areas. Is the Grand Unified Theory coming soon? [Homotopy Type Theory](https://en.wikipedia.org/wiki/Homotopy%5Ftype%5Ftheory)?

Maybe.

---

This is a complete summary of an excellent talk by Bartosz Milewski [Truth about types](https://www.youtube.com/watch?v=dgrucfgv2Tw). Illustrations and diagrams are recreated; formulas taken verbatim from the slides, except for comments, which were extended in some places.

_(You can get a set of PDF/HTML/epub/Kindle versions below. Name your price, starting from $1.)_

<script src="https://gumroad.com/js/gumroad.js"></script>
<a class="gumroad-button" href="https://gum.co/zmXzO?wanted=true" target="_blank" data-gumroad-single-product="true">Get set</a>
