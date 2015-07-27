Better programming
==================

The overview
------------

Well the easiest way to be a better programmer is to embrace this:

	"Everything sucks, your job is to know what sucks less"

	- Scott Carmichael

There are other ways of saying it ("Everything has flaws", "No Silver Bullet"), but I like that more since it gives direction to the things you do. If you need to understand something it's much more efficient to try to find flaws in it. You'll find the good points anyway. If you know the flaws you can make better decisions.

Even this essay has flaws in it, one of them being too general and not validating all the claims, but it hopefully has value nevertheless. Every programming language, framework, design pattern, architecture, rule and idea will have flaws in them - you just need to find them.



Simple, Complex, Easy, Hard
---------------------------

Instead of reading this part you should watch `Rich Hickeys "Simple Made Easy"`__. He gives a great overview and importance of these terms.

.. _SimpleMadeEasy: http://www.infoq.com/presentations/Simple-Made-Easy/

__ SimpleMadeEasy_

Here we'll use these definitions:

* simple - means not compound - not composed of two or more parts
* complex - means braided or tangled - composed of two or more parts
* easy - means not to require great labor or effort
* hard - means requiring great effort

So making things simpler means untangling things. Making things easy means lowering the friction. Simple, complex are objective and easy, hard are subjective.

.. TODO: write longer explanation

Writing
-------

When we talk about programming the most visible thing is writing code. There are several things to consider.

Difference
~~~~~~~~~~

If you wish to write good code you must be able to choose from different ways of writing things.

As an exercise, I once implemented 7 different ways to convert from one temperature unit to another (from Kelvin to Celsius etc.) Each had to some degree different performance charactericstics, configurability, flexibility, extendability, usability etc. Of course there are probably even more ways to doing it - also if you extend it to multiple languages you'll get hundreds of different ways.

(I've included the code in "examples/Temperature".)

Here's an exercise: pick a simple task (unit conversion, logging) and try to find as many different ways of representing it. If you are not getting many - use a different language.

Prototyping
~~~~~~~~~~~

There's a lot of value in prototyping. Often we don't have the whole picture or we miss some important details. Prototyping gives a great overview how things can fit together and where the actual problems are.

.. TODO: write more

Rewriting
~~~~~~~~~

Screen writers often rewrite their scripts 10x to make them really good. This applies also to code - if you want really good code, you need to rewrite it many times (each trying to improve the previous code.)

This may seem a lot of wasted effort, but if this code is a central API or concept how all other code interacts then it's code style will diffuse to all other parts of the code.

This excellent code can also be a great guide for writing other code.

.. TODO: write more


Style
~~~~~

Good code always has good style. Everyone has their own preference which constitutes a good style. The important part is that only single style is used. The 5% benefit you get from the perfect style is not worth discussion. (http://www.artima.com/weblogs/viewpost.jsp?thread=74230)

In this sense Go has made a very good move by specifying the coding style and a formatter. Although quite simple idea, is quite powerful.

Here's the recommendation have a formatter that specifies how you write your code.

.. TODO: write more

.. TODO: what means good style

Comments
~~~~~~~~

When writing comments it's easy to add unneccessary comments and try to hide bad coding by explaining it. Comments are also prone for aging - so called "the comment doesn't compile" problem. For example::

.. TODO: realistic example

	// add one
	i += 2;

	// validate the value of a against b
	// validate b against 4, 31, 41
	if a != b && (b == 4 || b == 31 || b == 41) {
		...
	}

It's much clearer if you wrote::

	a_valid = a != b;
	b_valid = (b == 4) || (b == 31) || (b == 41);

	if a_valid && b_valid {

	}

I have found that these rules, when to write comments, are helpful:

business decisions
  what's the reasoning behind this code

technical decision
  if there's some performance trick that is used or why some simpler method wasn't used

todo
  how to improve this code in the future (only if you don't have time to fix it immediately)

hacks
  if something has been implemented in hackish style due to OS/framework problems it must be clearly marked so. Also it should describe the problem in depth or pointed to some task or document that does.

legacy commenting
  if there is some legacy part and changing it is difficult/dangerous then commenting inner working can be helpful in getting a better overview

architectural
  overview of the API and how to extend it

Anything else should be self-evident from the code itself, and if it's not, it's a programming mistake -- and not a problem of missing comments. Most likely cause is poor naming of things. If you have any other reason for commenting (like this code is too complicated) try to refactor it, or if you can't do it yourself ask someone how to make code easier to read.


Reading 
-------------------

One thing that is often overlooked is reading.

.. TODO: code literacy
.. TODO: shakespeare of code

Code
~~~~

.. TODO: write

	I am unable to imagine a great writer who has never read a book - in the same way I am unable to imagine a great programmer who has never read a program.

	"Reading how to write well."
	state machine
	Nile
	comments

Kevlin Henney - Cool Code

Code Review
~~~~~~~~~~~

.. TODO: write

Aesthetics
~~~~~~~~~~

.. TODO: write

Managing complexity
-------------------

.. TODO: write

	Measuring programming progress by lines of code is like
		measuring aircraft building progress by weight.
	— William Gates

Patterns
~~~~~~~~

.. TODO: write

	Invariants
	Design Patterns
	Architectural Patterns

Immutability
~~~~~~~~~~~~

.. TODO: write

	Clojure
	http://www.infoq.com/presentations/Are-We-There-Yet-Rich-Hickey
	...

Context
~~~~~~~

.. TODO: write


Abstract things
---------------

.. TODO: write

	"Manipulating ideas is much better."
	OOP
	State is Never Simple : Rich Hickey


Making of
~~~~~~~~~

.. TODO: write

Knowing
~~~~~~~

.. TODO: write

Intuition about
~~~~~~~~~~~~~~~

.. TODO: write

	"Physics of software"
	Gravity
	Carlo Pescio

Meta
~~~~

.. TODO: write

Making things
-------------

.. TODO: write

Useful
~~~~~~

.. TODO: write

	"Good abstractions are simple."
	"Simple things are simple if they require no instruction"
	Bret Victor

Reliable
~~~~~~~~

.. TODO: write

	try catch
	err
	assertions
	contracts
	functional

	Writing good tests
	Asserting


	http://www.carlopescio.com/2011/06/cut-red-wire.html

	Crashing against the railings with car

Fast
~~~~

.. TODO: write

	"Measure before optimisation."

Premature Optimisation
Premature Pessimisation

Simple
~~~~~~

.. TODO: write

	"Balancing code and model."
	"Making things simple is hard work!"
	Rich Hickey
	Limits

	"Make simple things simple, complex things doable and visible."
	(avoid making complex things easy, because they are not simple)
	(using complex things can be easy)

	Complect, Compose = make visible complecting


Algorithms
----------

.. TODO: write

	algorithm => specific algorithm
	specific algorithm => algorithm
	need => algorithm

	Algorithm Design Manual - "War Stories"


Concurrency and Parallelism
---------------------------

.. TODO: write

Concurrency is not Parallelism - by Pike

Knowledge
---------

.. TODO: write

	I tend to liken paradigms, languages, and the structures we build with those languages to materials, with a set of expected properties (hence my work on the physics of software). If you build something using steel, you expect some properties. If you use wood, you expect different properties. It's not that steel "is wrong" or wood "is wrong". They're wrong if you expect a different set of properties. And of course, trying to shape wood the way you do with steel ain't gonna work, and you may end up with a burned piece of wood. Fake OO is like claiming, at that point, that burned wood is steel. Except it's not.

	In this sense, I see most criticism of programming paradigms as rather myopic. You frequently see a dangerously good :-) speaker / writer saying the equivalent of "see, stainless steel cannot be shaped into foil thinner than 0.01mm, so we never should use metals at all", which is very much like finding a case that cannot be perfectly covered by one language, and then claiming that the entire paradigm is a failure, and of course they propose a different paradigm ("you should always use graphene instead!"). They argue so convincingly that you really want to believe them.

"Remove friction from programming."

Paradigm
~~~~~~~~

.. TODO: write

http://zedshaw.com/essays/kitchensink.html
https://dl.dropbox.com/u/14031931/Papers/VanRoyChapter.pdf

	Declarative / Imparative

Language
~~~~~~~~

http://learnpythonthehardway.org/book/advice.html

.. TODO: write

	Haskell
	Prolog
	ASP
	Ometa

Growing a Language
	http://www.youtube.com/watch?v=_ahvzDzKdB0

Framework
~~~~~~~~~

.. TODO: write

Architecture
~~~~~~~~~~~~

.. TODO: write

To the metal
------------

.. TODO: write

What every programmer should know about memory

What every programmer should know about floating point numbers

In Real Life
------------