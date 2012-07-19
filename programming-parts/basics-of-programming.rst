Basics of programming
=====================

A model of programming
----------------------

Before we go into details we should have some intuition how different things affect the programmer.

In the simplest form what a programmer does is solve a problem or reaches a goal. There are some things that make reaching goal easier, some that make it harder. Programming can create quite extreme emotional states - so to understand the whole picture we must take it into account as well.

Here's my interpretation how these things work together:

.. image:: model.png

I also gave those forces some arbitrary names:

* movement: things that make you move towards your goal
* friction: things that make your movement harder and hinder you from reaching your goal
* uppers: things that make you feel good
* downers: things that make you feel bad

When looking the scale "mood", remember it's more of an abstract scale than manic to depression scale.

The whole process is very similar to solving a sudoku. Since the time frame is much shorter it's much better to look at that example than programming.

When we begin, we have some good state and see the challenge.

* 1: we realize the actual difficulty of the problem and become focused. We also start to fill in some of the blanks.
* 2: we have some difficult stage, where we need to have more effort to move forward. Once we break this difficult stage, we get this small high of solving a small problem.
* 3: we realize that we know how to solve the puzzle and go through with this solving until at...
* 4: we completed it. In stage 4 we have this "high" of reaching a goal.

Here we can see what produces the addictiveness of sudokus. This low mood, struggle and finally the high. This is the same reason why programmers program and get enjoyment out of it.

What are these forces composed of?

* uppers = progress + solving subgoals + new skills + understanding + serendipity
	
	When we make progress we make us feel better. Breaking some difficult subgoals will give us a small high. When we understand or gain new skills we also feel good about ourselves. Serendipity is also sometimes nice to have, when you made a guess and it turned out to be correct.

* downers = no progress + failures + perceived difficulty + feeling stupid + pressure
	
	When we make no progress we feel bad. This "no progress" may also
	make you feel stupid. One part of friction is perceived difficulty,
	whether or not we see the goal achievable. If we are under pressure, we feel more stressed.

* friction = difficulty + bad tools + bad mood

	Difficulty - how many hints you have and how easy it is to derive the
	next number. Bad tools are also a important part of friction. For example
	if you do not have a pen to solve sudoku, remembering all the numbers
	makes things much harder. Also using pen vs pencil make things different.

* movement = perceived reward * ( skills + knowledge + good tools + good mood )
	
	Perceived reward is the thing that makes us want to apply the things we know and struggle against friction more, hence it affects all the other parts of movement. Good tools - when we have a pencil we are more likely to try out different things just by guessing. Knowledge is also an important part of moving forward - if we don't know how to write numbers or use the tools, it's much harder to progress. Also if we have solved many sudokus we have more intuition how to approach the problem.

	Skills - these are the things, the derivation rules. How to cope with difficult situations. There are also skills that help us develop new skills and gain new knowledge.

If we now go back to programming, these things stay the same. Serendpity is when we make a change and something interesting or cool happens... or if we use a difficult toolchain it makes more friction. And so on...

If we now consider what parts of the diagram are affected when we change the language or in which order we teach language constructs (such as "if", "for", "assignment") then we realize that we are not actually focusing on the real problem. Language and language constructs are just tools and knowledge. Currently when considering what to learn first a lot of effort goes to picking the right language, language that has the least friction. Language is just some knowledge and skills are the crucial part of programming.

Since skills are also things that can produce new skills and help us gain knowledge they are invaluable to a programmer. So the actual question is "What is the most effective set of skills and knowledge that helps to overcome friction and can produce any other skill and knowledge required". This doesn't necessarily mean the minimal set, since "learn a new thing" wouldn't work that effectively.

Coming back to the model we can also see what happens, if a person tries to take a shortcut or we teach by explaining the correct solution.

.. image:: modelshortcut.png

Imagine you are solving a sudoku and at stage 2, where you hit your first difficult problem someone else comes and solves the sudoku for you. This would mean that you won't feel the "high" and are less likely to try solving a sudoku again, since the perceived reward has decreased. More importantly what happens is that you fail to learn skills required to overcome obstacles 2 and 3.

In programming this means that when you cheat or take a shortcut the necessary skills won't be acquired. This could also include skills how to learn new skills and how to deal with friction. Any hint about solution will increase the knowledge, but it will not increase skills. Therefore any helping should be focused on which skills to apply or use, not what is the quickest way to the solution.

Programmers in real life have to deal with friction whether they like it or not, it is therefore important to learn how deal with it. Friction makes you feel stupid or stressed. Although it may look that good programmers don't have that anymore, in reality, they have just learned to ignore those things.

	"Keep trying even if you feel lost, it's just one stage of problem solving."

If we do not set a goal the perceived reward will be unknown and therefore anyone trying to reach it will be less motivated to do so. This means that learning theory without any practical goal will require more effort than trying to reach a practical goal and learning theory as a solution to the goal.

HtDP_ ("How to Design Programs") puts it all together quite nicely:

	"Programming a computer requires patience and concentration. Only attention to minute details will avoid frustrating grammatical mistakes. Only rigorous planning and adherence to the plan will prevent serious logical mistakes in our designs. But when we finally master the design of programs, we will have learned skills that are useful far beyond the realm of programming."

So what are the programming skills that are the main drivers of movement and what are the skills that also increase the movement speed. Also what is the knowledge that helps us in programming?

	The most important skill is how to acquire skills and knowledge effectively. Everything else can be acquired effectively.


Meaning of things
-----------------

The first important insight about computers is that

	Computers are stupid... very, very stupid.

If a person comes from using computers to programming computers this may feel weird. The computer seems intelligent to a user. We also use language to convey instructions to the computer and that also looks like it understands things.

For example when I say to you "elephant is pink", you probably will imagine a pink elephant, with a trunk, ears, legs and a tail. We have a lot of assumptions about things. Even the color pink is a thing we assume to exist.

Now when we do the same thing in some programming language::

	elephant = "pink"

Language wise we read it the same "elephant is pink", but the actual undelying context is totally different. Elephant isn't an animal anymore it's a reference in memory and "=" is not a descriptive term but an assignment. "pink" is not a color anymore but just a string, an array of numbers. When saying this in a computer, the meaning changes although the language stays the same.

In the same way, if we have a program drawing a rectangle on the screen, then making a new variable and writing::

	y = 50

Doesn't make the rectangle move to that position. It must be used together with everything else to make it work. We need to make things interact before they have an effect on other things.

To make this concept more understandable lets consider this program::

	y = 60;
	x = y;
	y = 30;
	x?

What is the value of x? Here are the options:

1. ``x == 60``
2. ``x == 30``
3. ``y = 30`` is a mistake
4. something else

If you are a good programmer you probably realized that the correct answer is "all of the above".

In the imperative language "=" means assignment, meaning we set this value to this variable. In a functional language "=" means we assign this value to this symbol and any further reassignments is forbidden. In a semantic meaning "=" specifies a condition and that must be held in the future unless it's redefined. Any of these is a valid assumption to have, but as a programmer you must realize that all of them are possible.

None of these behaviours is "wrong" (remember computers are stupid and they don't care what the "=" thing means), but some of these behaviours may be more intuitive and favorable depending on the context.

We found several skills here: shifting through the different meanings of the program, destroying your assumptions and misconceptions. Capablity of understanding flaws in your thinking and correct them as needed to match the program. If something seems weird, it's because you assume some invalid behaviour.

	The only thing, that shows what a program does, is what it actually does.


Making things concrete
----------------------

One thing that is most visible thing about programming is writing programs. Since computers are very, very stupid we need to get from some vague idea to the actual implementation. We need to explain every single detail until there is no though required to follow the instrutions.

Let's consider a "box moving from left to right". How to turn this into code? One easy way is to recursively specify each single part in some convenient pseudocode until it resembles the language you are writing in, and finally make it compilable.

We start by specifiying::

	// box moving from left to right and back

Here we should ask questions like, what is "box", "moving", "left", "right", "back". What do we mean by "box is moving".

By moving box we mean we can see the "box" change it's position. Now the question is, when does it change. Let's just take some convenient moment, for example when the screen get's redrawn.

What do we mean by change it's position? It's just change in the "x" coordinate. How much do we need to change? Let's worry about that exact detail later. So moving would look like::

	// when update {
	// 		box.x = box.x + 10
	// }

Now what do we mean by "left to right and back"? From "left to right" means that we start from coordinate "0" and move until the width of the screen, at which point we should go back. Which means that if our box x coordinate has reached width of the screen we should start moving back.

	// left = 0;
	// right = screen.width;
	// box.x = left;
	// when update {
	//    box.x = box.x + 10
	//    when box.x reach right start moving back
	// }

What do we mean by "reach"? This means that when "box.x > right". What do we mean by "moving back"? This means that we should start moving in the opposite direction. We need to change the "+10" to "-10" - we change it if it's a variable.

	// speed = 10;
	// left = 0;
	// right = screen.width;
	// box.x = left;
	// when update {
	//    box.x = box.x + speed
	//    when box.x > right 
	// 		speed = -10
	// }

Converting this into actual code is mostly reasearch how a language exactly works, but here's one possible interpretation::

	var speed = 10,
		left = 0,
		right = screen.width;

	box.x = left;

	function update(){
		ctx.fillRect(box.x, box.y, 10, 10);
		box.x = box.x + speed;
		if ( box.x > right ) {
			speed = -10;
		}
	}

This is actually quite easy, but this way of implementing things does not scale, it is a necessary skill nevertheless.


Programs do what they do
------------------------

When we would run the previous code we would discover that it didn't work the way it supposed to. The box moves first to right and then back and then off the screen. That is a bug.

We need to understand what the program actually does, since the model in our head and the thing program does do not match up. One common mistake is to immeditely start to change the code without actually understanding the code. This understanding is important as this is the only way we can build intution about how code behaves. When we have intution and understanding about the system we can make reasoned bug fixes.

Correct way would be to analyse the code - maybe try changing some parameters, then try to predict what happens and then actually see whether it happens. If there are lot's of "moving parts" then try to reduce the system to the bare minimum where the problem occurrs. Do something to make the problem occur faster.

In the previous code we should finally find that when the box reaches the left side it doesn't turn around again. If we now remember our initial vague idea "box moving from left to right and back", we see that we did not specify that it should do that repeatedly. This means that bugs isn't always in the code it may be also in our head. Maybe we didn't anticipate some corner cases, maybe we didn't specify the behaviour explicitly enough. In this case the solution is simple, just add this extra condition::

	var speed = 10,
		left = 0,
		right = screen.width;

	box.x = left;

	function update(){
		ctx.fillRect(box.x, box.y, 10, 10);
		box.x = box.x + speed;
		if ( box.x > right ) {
			speed = -10;
		}
		if (box.x < left) {
			speed = 10;
		}
	}

Understanding the system and how it behaves and having an intuition is important, otherwise we will be making changes without being able to predict the consequences.

Reaching the goal
-----------------

One misconception about great problem solvers is that they know the solution to any problem. Actually they know how to solve the problem. So what's the difference?

I had this overview of algorithms as some ideas that someone just came up with. They just had this cool idea and then did some analysis on it and finally published an article about it. I've never even thought about this assumption deeply. When I read "The Algorithm Design Manual", especially the "War Story" parts, I realized that my assumptions were wrong.

The "War Story" parts were descriptions of deriving algorithms and putting ideas together and discussion between people and failures and testing of speed. Essentially they were descriptions how algorithms are modified, designed and put together. The process to a complete algorithm was made visible.

After that I had less fear of trying to come up with algorithms or design things, because I understood that I do not have to solve the whole problem at once. This is a trivial point, but has deeper meaning in the process.

If we would consider a student trying to implement an operating system, it would seem that this is unimaginable. Or this would be overestimating the skills of the student, maybe a little. Once we accept that we do not have to know the full solution immediately, we can still make progress towards it.

In the simplest terms, what does the OS do? Well it makes multiple programs work together, it talks to the "metal", it provides some services to the programs. Each of those is a much simpler idea than implementing OS, but if we understand each of those parts we probably have better knowledge and skills to deal with the actual problems. If we have trouble solving each of those problems we can recursively divide those problems until each part is easily solvable.

This process may take time, but the important thing is that it removes the fear of trying to solve hard problems, it makes them reachable, it makes them simpler.

What are the other ways we can make our goals more attainable?

One version of this subdivision is "wishful thinking" from SICP_ (Structure and Interpretation of Computer Programs). The idea is simple - you imagine that you can have anything in the world at your fingertips and you will write your code as such. Then you proceed to make some of the parts of the imagined world in the same way until you have nothing imagined and everything concrete.

Making goal more approachable can also be done by studying similar problems. If we wish to move something on the screen, we may want to study how a car moves. If we wish to write a game we should study other games.

	Great programs, algorithms, solutions, ideas don't just spring into life by a magical wish, they start as a seed and are slowly grown until one day a blossom appears. Seeing a master produce a flower from his hands in a blink of an eye, is not because he wished for it, but because he has a garden he cares for.


Limits
------

As humans we have several limitations in our processing power. We can't think over 5 things at once (not an exact number) nor can we remember everything. If we just keep adding things and modifying out code we will reach this limit quite quickly. If the code isn't in our capabilities there is a large risk of introducing bugs.

First limititation is typing speed. The solution to this is reducing the repetetive code. In it's simplest form, if we have three places where we use similar source code, we can group it and replace those places with functions. In a more complex way, we can implement a domain specific language to do the grunt work and leave us writing about the important things. These two skills are lazyness and recognizing repetition. This also removes friction from the coding process, since we don't have to repeat ourselves.

Next limitation is reading speed and our memory. If our whole code base is above 10,000,000 LOC it would require several weeks to read it through, let alone understand and remember it. The only solution here is to keep your LOC down by removing repetition and building abstractions.

Finally the most important limitation is our brain processing power. If we need to simulate and understand how 10 things interact with each other, we won't able to think about simultanously. Since most of the time there are hundreds or more things interacting, knowing how to reason about them is the most important skill of any good developer.

This skill can be called "handling complexity", although there are several sides to it. So what are the ways to handle complexity?

The first is by training your processing capabilities and memory. This can be done by studying several systems and trying to understand them. There's a big problem with this, it doesn't scale, also building something that's near our limitations then debugging, adding and modifying probably lies outside of our limitations.

Next rather simple way to handle complexity is by setting limitations, using consistent style and using idioms. These can remove a lot of thinking required to read code.

One example would be::
	
	x = 4; 
	y = (++x)*x;
	
	// compared to
	x = 4;
	x += 1;
	y = x*x;

If we use inconsistent style our code will become hard to read similarly to a book that is written in different languages and in mid-sentence goes over to a poem. Keeping consistent style is easy and has good benefits.

When using idioms we can start to intuitively reason about code. If you have had a lot of experience in C-style for loops then some of those will feel weirder than others:

	for( i = 0; i <= length-1; i += 1) {}
	for( i = 0; i < length; i++ ) {}
	for( i = 0; length > i; i++ ) {}
	for( i = 0; length-1 >= i; i = i + 1 ) {}

Although all of them say the same thing our intuition will notify, if it's not our usual idiomatic way. If our intuition tells us that our code is wrong, although it is correct, it would be better to rewrite code such that it feels nice.

	If our language use is pure and beautiful many mistakes and errors will pop out like a red dot on a black screen.

The next strategy for handling complexity is ignoring things. We run our code on an OS that we can most of the time ignore. In a similar sense there are parts of code that do not affect other parts of code - so called invariants. But with ignoring things we can also ignore important things - so the question is how to write code such that it is easy to ignore things?

One strategy is to divide code into parts that are not dependent on each other. The other strategy for ignoring things is abstraction. Abstractions gives us ability to think about things without dealing details. Understanding different ways of abstractions, how to make and use them is needed to make well written programs. When trying to make good abstractions it's important to know several ways of doing something. Never be satisfied with the first solution because it rarely is the best solution.

It's also important to realize that abstraction is not the end goal in itself. By over-abstracting we can start to increase the complexity again. Code and model (abstraction) should be in balance. In the same we can have too much code, we can have too many abstract ideas.

Finally, when making things simpler it's also necessary to have a good understanding what "simple" and "complex", "easy" and "hard", "complecting" and "composing" mean. An excellent overview of simplicity was given by Rich Hickey in "Simple Made Easy".

	Making complexity is easy.
	Using complexity is hard.
	Understanding complexity is impossible.	
	
	---

	Understanding simplicity is possible.
	Using simplicity is easy.
	Making simplicity is hard.


Summary
-------

HtDP_ gives a nice summary about programming:

	"Programming is far more than the mechanics of language acquisition. It is about reading problem statements, extracting the important concepts. It is about figuring out what is really wanted. It is about exploring examples to strengthen your intuitive understanding of the problem. It is about organizing knowledge and it is about knowing what you don’t know yet. It is about filling those last few gaps. It is about making sure that you know how and why your code works, and that you and your readers will do so in the future. In short, it is really about solving problems systematically."

Unfortunately it doesn't give such precise and short overview of the "systematic process" that helps you do all of that.

If we wish to teach/learn programming we must understand this "systematic process" throughly, otherwise we will be just hoping that people somehow manage to derive this process themselves. We must understand the fundamental skills and knowledge.

I can't yet give this process, but I can give some questions that can help exercise those underlying skills.

* Concreteness or how do I make the computer do what I want?
	
	* How would I state the general concept?
	* What does that word exactly mean?
	* What tools can I use to implement that concept?

* Misconceptions or what parts do I misunderstand?

	* Why does this problem happen?
	* Why didn't my change make things better?
	* Why my change produced this result?

* Understanding or how can I understand things?

	* What happens if I comment out part of my code?
	* What happens if I tweak some parameter?
	* What happens if I do something to the code?
	* Is there some knowledge that can help me?

* Sub-goaling or how can I make my goal more achievable?
	
	* Can I understand just part of the problem?
	* Can I implement just part of the problem?
	* Can I understand something similar to my problem?
	* What could I have, that would make this problem much simpler?

* Complexity or how can I make things simpler?
	
	* Can I write it more nicely?
	* Can I find a different way how to write this?
	* Can I find a thing that makes other things simpler?
	* Can I find similar things and group them?
	* Can I find things that do not affect each and group them?
	* Can I make an abstract thing that simplifies my thinking?
	* Can I make an abstraction that hides my decisions?

Each of these questions requires more in-depth analysis, but we'll just skip that part for now. These questions may seem quite concrete, but they are not. For example "What happens if I comment out part of my code?" doesn't say how to find which part should I comment out neither does it say how can I come to the conclusion that I need to ask this question.

Any programmer does these things automatically and effortlessly, without even thinking that he needs to do them. These are fundamental parts of any problem solving. 

First course of programming therefore must make students ask these questions all of the time until it becomes second nature. If we structure programming courses based on the language constructs then we may not teach them the skills. Programming course should be structured around the skills and then language constructs introduced as necessary. Any helping should be done through these questions, because these reinforce skills not knowledge. When teaching "knowledge" it's important to explain the need for that knowledge and how to come up with that knowledge and even how to have the idea that you would need such knowledge. (Knowledge meaning language constructs, paradigms, frameworks, code etc.)


.. _HtDP: http://www.htdp.org/
.. _SICP: http://mitpress.mit.edu/sicp/
