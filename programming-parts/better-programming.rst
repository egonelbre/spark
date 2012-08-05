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

Prototyping
~~~~~~~~~~~

Difference
~~~~~~~~~~

Comments
~~~~~~~~

Style
~~~~~
http://www.artima.com/weblogs/viewpost.jsp?thread=74230



Reading 
-------------------

Code
~~~~

	"Reading how to write well."
	state machine
	Nile
	comments

Aesthetics
~~~~~~~~~~



Managing complexity
-------------------

	Measuring programming progress by lines of code is like
		measuring aircraft building progress by weight.
	— William Gates

Patterns
~~~~~~~~

	Invariants
	Design Patterns
	Architectural Patterns

Immutability
~~~~~~~~~~~~

	Clojure
	http://www.infoq.com/presentations/Are-We-There-Yet-Rich-Hickey
	...

Context
~~~~~~~




Abstract things
---------------

	"Manipulating ideas is much better."
	OOP
	State is Never Simple : Rich Hickey


Making of
~~~~~~~~~


Knowing
~~~~~~~


Intuition about
~~~~~~~~~~~~~~~
	
	"Physics of software"
	Gravity
	Carlo Pescio

Meta
~~~~



Making things
-------------


Useful
~~~~~~

	"Good abstractions are simple."
	"Simple things are simple if they require no instruction"
	Bret Victor

Reliable
~~~~~~~~

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

	"Measure before optimisation."

Premature Optimisation
Premature Pessimisation

Simple
~~~~~~

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

	algorithm => specific algorithm
	specific algorithm => algorithm
	need => algorithm

	Algorithm Design Manual - "War Stories"


Concurrency and Parallelism
---------------------------

Concurrency is not Parallelism - by Pike

Knowledge
---------

	I tend to liken paradigms, languages, and the structures we build with those languages to materials, with a set of expected properties (hence my work on the physics of software). If you build something using steel, you expect some properties. If you use wood, you expect different properties. It's not that steel "is wrong" or wood "is wrong". They're wrong if you expect a different set of properties. And of course, trying to shape wood the way you do with steel ain't gonna work, and you may end up with a burned piece of wood. Fake OO is like claiming, at that point, that burned wood is steel. Except it's not.

	In this sense, I see most criticism of programming paradigms as rather myopic. You frequently see a dangerously good :-) speaker / writer saying the equivalent of "see, stainless steel cannot be shaped into foil thinner than 0.01mm, so we never should use metals at all", which is very much like finding a case that cannot be perfectly covered by one language, and then claiming that the entire paradigm is a failure, and of course they propose a different paradigm ("you should always use graphene instead!"). They argue so convincingly that you really want to believe them.

"Remove friction from programming."

Paradigm
~~~~~~~~

https://dl.dropbox.com/u/14031931/Papers/VanRoyChapter.pdf

	Declarative / Imparative

Language
~~~~~~~~

	Haskell
	Prolog
	ASP
	Ometa

Growing a Language
	http://www.youtube.com/watch?v=_ahvzDzKdB0

Framework
~~~~~~~~~

Architecture
~~~~~~~~~~~~


To the metal
------------

What every programmer should know about memory

What every programmer should know about floating point numbers

