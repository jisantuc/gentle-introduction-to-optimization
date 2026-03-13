#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= Chapter 1

== Linear Programs

=== 1. Nutrition table

==== Prompt

Consider the following table indicating the nutritional value of different food types:

[...]

Minimize the total cost of food while satisfying the following daily nutritional requirements:

- calories must be at least 2000,
- fat must be at least 50g,
- protein must be 100g,
- carbohydrates must be at least 250g

===== Solution

$ &"min" &&&&&\
  &0.14 x_"carrot" &+ 0.12 x_"potato" &+ 0.2 x_"bread" &+ 0.75 x_"cheese" &+ 0.15 x_"pb" \
  &"subject to" \
  &23 x_"carrot" &+ 171 x_"potato" &+ 65 x_"bread" &+ 112 x_"cheese" &+ 188 x_"pb" >= 2000 \
  &0.1 x_"carrot" &+ 0.2 x_"potato" &+ 0 x_"bread" &+ 9.3 x_"cheese" &+ 16 x_"pb" >= 50 \
  &0.6 x_"carrot" &+ 3.7 x_"potato" &+ 2.2 x_"bread" &+ 7 x_"cheese" &+ 7.7 x_"pb" >= 100 \
  &6 x_"carrot" &+ 30 x_"potato" &+ 13 x_"bread" &+ 0 x_"cheese" &+ 2 x_"pb" >= 100 $

=== 2. Milk production

MUCOW owns a herd of Holstein cows and a herd of Jersey cows. For each herd, the total number of litres produced each
day, and milk-fat content (as a _percentage_) are as follows:

#table(
  columns: (auto, auto, auto),
  table.header([], [*Litres produced*], [*Percent milk-fat*]),
  [*Holstein*], [500], [3.7],
  [*Jersey*], [250], [4.9]
)

The fat is split off and blended again to create various products. For each product, the volume, required milk-fat
percentage, and profit are as follows. In particular, the milk-fat percentage must exactly equal what is specified.

[...]

==== Prompt a

Formulate as an LP the problem of deciding how many items of each type to produce, so that the total profit is
maximized. Don't worry about fractional numbers of items. Write your formulation in matrix notation.

===== Solution a

$
&"max" &&&&& \
&0.1 x_"skim" &+ 0.15 x_"2%" &+ 0.2 x_"whole" &+ 0.5 x_"table cream" &+ 1.2 x_"whipping cream" \
&"subject to" \
&x_"skim" &+ x_"2%" &+ x_"whole" &+ x_"table cream" &+ x_"whipping cream" &- m_"holstein" &- m_"jersey" &<= 0 \
$


==== Prompt b

MUSCOW is told of a regulation change: "simmed milk" can now contain anything up to 0.1% milk-fat, but no more. How does
the formulation of the problem change? Note the resulting formulation should also be an LP.

===== Solution b

=== 3. Wage-minimizing salaries

$
& "let" i in { "Tom", "Peter", "Nina", "Samir", "Gary", "Linda", "Bob" } \
&"in" "min" sum_i "salary"_i \
&"subject to" \
&"salary"_"Tom" >= 20000 \
&"salary"_"Tom" - "salary"_"Peter" <= -5000 \
&"salary"_"Tom" - "salary"_"Nina" <= -5000 \
&"salary"_"Tom" - "salary"_"Samir" <= -5000 \
&"salary"_"Tom" + "salary"_"Peter" - "salary"_"Gary" <= 0 \
&"salary"_"Linda" - "salary"_"Gary" = 200 \
&2 times "salary"_"Tom" + 2 times "salary"_"Peter" - "salary"_"Samir" - "salary"_"Nina" <= 0 \
&"salary"_"Peter" - "salary"_"Bob" <= 0 \
&"salary"_"Samir" - "salary"_"Bob" <= 0 \
&"salary"_"Bob" + "salary"_"Peter" >= 60000 \
&"salary"_"Linda" - "salary"_"Bob" - "salary"_"Tom" <= 0
$

==== Prompt b: 

$
&"min" "max"("salaries") \
&"subject to [...]"
$

that's... weird. Can I have an objective function that `min`s a `max`? My intuition is that these are going
to arrive at the same solution, since given two highest salaries `a` and `b`, if `b` < `a`, and the rest of the
salaries are the same, `b` strictly dominates `a` in the first objective.

=== 4. Building a house

p11

// TODO: fill in precedence relationships, objective function pops out naturally
// #diagram(...)
