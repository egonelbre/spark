Basics of programming
=====================

We first introduce a model for understanding how skill, knowledge and language affect the programmer. Then we try to figure out what makes a programmer a programmer.

A model of problem solving
--------------------------

In the simplest terms programmer is a problem solver. There are some things that make reaching solution easier, some that make it harder. Programming can also create quite extreme emotional states - therefore to understand the whole picture we must take it into account.

Here's how these things work together:

.. image:: https://raw.githubusercontent.com/egonelbre/spark/master/graphics/model.png

Let's call the things that affect programmer forces and give them some names:

* movement: things that make you move towards your goal
* friction: things that make your movement harder and hinder you from reaching your goal
* uppers: things that make you feel good
* downers: things that make you feel bad

Keep in mind that the "mood" axis is an abstract concept.

It's much easier to explain the model with sudoku, since more people are familiar with it. Also the time frame where you experience all of these steps are much shorter.

When we start solving the sudoku we have some eagerness

1. stage, we realize the actual difficulty of the problem and become focused. We also start filling the easier parts.
2. stage, we have some difficult step, where we need to have more effort to move forward. Once we break this difficult stage, we get this small high of solving a small problem.
3. stage, we realize that we know how to solve the puzzle and quickly fill in the missing parts.
4. stage, we finsihed it, finally we have this "high" from reaching the goal and feeling smart.

This same emotional fluctuation and final high is what causes the addicitiveness of sudokus. This is also the reason why programmers can easily get into this state flow and lose track of time. (Flow as described by Mihaly Csikszentmihalyi.)

Let's see how to decompose the forces into simpler things:

* uppers = progress + solving subgoals + acquiring new skills + understanding + serendipity
* downers = no progress + failures + perceived difficulty + feeling stupid + pressure
* friction = difficulty + bad tools + bad mood
* movement = perceived reward * ( skills + knowledge + good tools + good mood )

In sudoku difficulty means how easy it is to derive the next number. If we use a bad tool such as pen or nothing at all the required skill level must be higher. If we have a pencil we can do try out different things and erase them as neccessary. Skills are things that help us derive new numbers and knowledge is how a number looks like.

Perceived reward makes us want to apply our knowledge and struggle against friction more, hence it affects all other parts of movement. This suggests that learning theory without a goal requires more effort than trying to solve a problem while learning theory as a solution. This means learning must start from a problem, not from theory.

We can see that by learning we can affect knowledge, tools and skills. This also means that learning must affect all of them.

If we consider programming the force decomposition stays the same. One area that is often discussed when starting to learn programming is what language, framework, toolchain to use. The force that these things affect is friction - and to some smaller degree required knowledge.

So the question is actually how much friction is neccessary for learning. If we lower friction we are also lowering the skill required to accomplish a task - which may not be the best solution for learning. Programmers must be able deal with the friction - how to keep going towards goal, even if everything is working against you. So there is a necessity for skills that deal with friction.

The problem with friction is that it makes people feel stressed and stupid - if some limit is crossed then people will cheat or get help. In everyday life this friction is very common. Although it may look that good programmers don't feel the stress and bad feelings it is more likely that they ignore it.

	"Keep trying even if you feel lost, it's just one part of problem solving."

Let us consider what happens if a person "cheats" while learning.

.. image:: https://raw.githubusercontent.com/egonelbre/spark/master/graphics/model-shortcut.png

Imagine you are solving a sudoku and at stage 2, where you hit your first difficult problem, someone else comes and solves the sudoku for you. This would mean that you won't feel the "high" and are less likely to try solving a sudoku again. The perceived reward has also decreased. More importantly you fail to learn skills required to overcome obstacles 2 and 3.

The same applies to programming. This could also include skills how to learn new skills and how to deal with friction. Any hint about solution will increase the knowledge, but it will not increase skills. Therefore any helping should be focused on which skills to apply or use, not what is the quickest way to the solution.

	"You don't train for the olympics by driving a car."

In programming "the skills" are much more important than knowledge and tools. Skills help us learn new skills and gain knowledge. For "how to teach programming" the most important question is "What is the most effective set of skills and knowledge that helps overcome friction and can produce any other skill and knowledge required?" This Doesn't necessarily mean the minimal set, since "learn a new thing" wouldn't work that effectively.

HtDP_ ("How to Design Programs") puts all these ideas together quite nicely:

	"Programming a computer requires patience and concentration. Only attention to minute details will avoid frustrating grammatical mistakes. Only rigorous planning and adherence to the plan will prevent serious logical mistakes in our designs. But when we finally master the design of programs, we will have learned skills that are useful far beyond the realm of programming."

So what are the programming skills that are the main drivers of movement. What is the most basic knowledge and skills that makes people programmers?

	"The most important skill is how to acquire skills and knowledge effectively. Everything else can be acquired effectively."


Meaning of things
-----------------

The first important insight about computers is that

	Computers are stupid... very, very stupid.

This insight may feel weird if a person moves from using computers to programming. The computer seems intelligent to a user, we use language to convey instructions to the computer and it also looks like it can understand. The simplest example of such intelligence would be Google.

As humans we have a lot of assumptions about things. For example when I say "elephant is pink", you probably will imagine a pink elephant, with a trunk, a few ears, legs and a tail. Even the color pink is a thing we assume to exist.

When we do the same thing in some programming language::

	elephant = "pink"

We still read the code "elephant is pink", but the actual undelying context is totally different. Elephant isn't an animal anymore, it's a reference in memory, and "=" is not a descriptive term, but an assignment. "pink" is not a color anymore but just a string, an array of numbers. Computer language is different from regular language since everything has a single well defined meaning.

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

In the imperative language "=" means assignment, meaning we assign this value to that variable. In a functional language "=" means we declare a symbol for this valueand any further declaration is forbidden. In semantic meaning "=" could specify a condition and that it must be held in the future unless it's redefined. Any of these is a valid assumption to have, but as a programmer you must realize that all of those contexts are possible.

None of these behaviours is "wrong" (remember computers are stupid and they don't care what the "=" thing means), but some of these behaviours may be more intuitive and favorable depending on the context.

In the same way, if we have a program drawing a rectangle on the screen, then making a new variable and writing::

	y = 50

Doesn't make the rectangle move to that position. It must be used together with everything else to make it work. We need to make things interact before they have an effect on other things.

Programmers need this capability of understanding their assumptions and misconceptions to understand the program better. They also must correct misconceptions to match the actual context.

Making things concrete
----------------------

The most visible thing about programming is writing programs. Since computers are very, very stupid we need to get from our vague idea to the actual implementation. We need to explain every single detail until there is no thought required to follow the instructions.

Let's consider code for "box moving from left to right". How to turn this into code? One easy way is to specify each single part in some convenient pseudocode until it resembles the language you are writing in.

We start by specifiying::

	// box moving from left to right and back

Here we should be asking questions, what is "box", "moving", "left", "right", "back". What do we mean by "box is moving".

By "box is moving" we mean that we can see the "box" change it's position. Now the question is, when does it change. Let's just take some convenient moment, for example when the screen get's redrawn.

What do we mean by "change its position"? It is just a change in the "x" coordinate. How much do we need to change? Let's worry about that exact detail later. So moving would look like::

	// when update {
	// 		box.x = box.x + 10
	// }

Now what do we mean by "left to right and back"? From "left to right" means that we start from coordinate "0" and move until the width of the screen, at which point we should go back. Which means that if our box x coordinate has reached width of the screen we should start moving back::

	// left = 0;
	// right = screen.width;
	// box.x = left;
	// when update {
	//    box.x = box.x + 10
	//    when box.x reach right start moving back
	// }

What do we mean by "reach"? This means that when "box.x > right". What do we mean by "moving back"? This means that we should start moving in the opposite direction. We need to change the "+10" to "-10" - we change it if it's a variable::

	// speed = 10;
	// left = 0;
	// right = screen.width;
	// box.x = left;
	// when update {
	//    box.x = box.x + speed
	//    when box.x > right
	// 		speed = -10
	// }

Converting this into actual code is mostly research how a language exactly works, but here's one possible interpretation::

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

As we can see we didn't start from writing in the programming language from the start. It may look like many programmers start from writing in a programming language - in reality they just do the first parts in their head and translate the result into code.

There are other ways of explaining things to the computer, but for beginners this is enough. The whole process is quite easy if the programming language is taken out.


Programs do what they do
------------------------

If we run the previous code we will discover that it didn't work the way it supposed to. The box moves to right and then back and then off the screen. That is a bug.

We need to understand what the program actually does, since the model in our head and the thing program does do not match up. One common mistake is to immeditely start to change the code without actually understanding the code. This understanding is important as this is the only way we can build intution about how code behaves. When we have intution and understanding about the system we can make reasoned fixes.

	"The only thing, that shows what a program does, is what it actually does."

Correct way would be to analyse the code - maybe try changing some parameters and try to predict what happens and finally test whether it happens. If there are lots of "moving parts" then try to reduce the system to the bare minimum where the problem occurs. This can be done by commenting out irrelevant code or making an other simpler program.

After studying the code we finally notice that when the box reaches the left side it doesn't turn around again. If we now consider our initial vague idea "box moving from left to right and back", we see that we did not specify that it should start moving right again. Here is another important insight bugs aren't always in the code they can be in the specification and in our head. Maybe we didn't anticipate some corner cases, maybe we didn't specify the behaviour explicitly enough. In this case the solution is simple, just add this extra condition::

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

	I had this overview of algorithms as some ideas that someone just came up with. The whole process would look like: idea -> analysis -> article. I actually didn't even think about this assumption deeply. After I read "The Algorithm Design Manual", especially the "War Story" parts, I realized that my assumptions were wrong.

	The "War Story" parts were descriptions of deriving algorithms and putting ideas together and discussions between people, failures and testing. Essentially they were descriptions how algorithms are modified, designed and put together. The process of designing algorithms was made visible.

	After that I had less fear of trying to come up with algorithms or design things, because I understood that I do not have to solve the whole problem at once. And failure is always an option. This is a trivial point, but has deeper meaning in the process.

If we consider a beginner programmer trying to implement an operating system, it would seem unimaginable or it is overestimating the skills of the beginner. Once we accept that it's not necessary to know the full solution immediately, the problem becomes easier.

In the simplest terms, what does the OS do? Well it makes multiple programs work together, it talks to the "metal", it provides some services to the programs. Each of those is a much simpler idea than implementing an OS, but if we understand each of those parts we probably have better knowledge and skills to deal with the actual problem. If we have trouble solving each of those problems we can recursively divide those problems until each part is easily solvable.

This process may take time, but it removes the fear of trying to solve hard problems, it makes them reachable, it makes them simpler. So when learning programming try to solve very big problems as well, otherwise it's harder to learn this "sub-goaling".

What are the other ways we can make our goals more attainable?

One version of this "sub-goaling" for programming is "wishful thinking" as described in SICP_ (Structure and Interpretation of Computer Programs). The idea is simple - you imagine that you can have anything in the world at your fingertips and you will write your code as such. Then you proceed to make some of the parts of the imagined world in the same way until you have nothing imagined and everything is concrete. (link to thorough explanation)

Making goal more approachable can also be done by studying similar problems. If we wish to move something on the screen, we could study how a car moves. If we wish to write a game could study how other games are implemented.

	Great programs, algorithms, solutions, ideas don't just spring into life by a magical wish, they start as a seed and are slowly grown until one day a blossom appears. Seeing a master produce a flower from his hands in a blink of an eye, is not because he wished for it, but because he has a Sgarden he cares for.

Limits
------

As humans we have several limitations in our processing power. We can hold in our head at most 7+-2 things at once (not an exact number). We can only remember some finite amount and we aren't infinitely fast. So, if we just keep adding things to our code we will reach this limit quite quickly and we won't be able to reason about our code. If the code isn't in our capabilities there is a large risk of introducing bugs.

First limititation is typing speed. The solution to this is reducing the repetetive code. In it's simplest form, if we have three places that uses similar code or structure, we can group it and replace it with functions. In a more complex way, we can implement a domain specific language to do the grunt work and leave us writing about the important things. This also removes friction from the coding process, since we don't have to repeat ourselves.

Next limitation is reading speed and our memory. If our whole code base is above 10,000,000 LOC it would require several weeks to read it through, let alone understand and remember it. The only solution here is to keep your LOC down by removing repetition and building abstractions.

Finally the most important limitation is our brain processing power. If we need to simulate and understand how 10 things interact with each other, we won't able to think about simultanously. Since most of the time there are hundreds or more things interacting, knowing how to reason about them is the most important skill of any good developer.

This skill can be called "handling complexity", although there are several sides to it. This skill is the most difficult to learn as a programmer, since the essence of it is how to deal with things that you are not capable of understanding entierly. So what are the basic ways to handle complexity?

The first is by training your processing capabilities and memory. This can be done by studying systems and trying to understand them. There's a big problem with this, it doesn't scale. We may now be able to think about 10 things, but when we need to modify or add to it our brain will still make mistakes.

Next rather simple way to handle complexity is by setting limitations, using consistent style and using idioms. These can remove a lot of thinking required to read code.

One example would be::

	x = 4;
	y = (++x)*x;

	// compared to
	x = 4;
	x += 1;
	y = x*x;

If we use inconsistent style our code will become hard to read similarly to a book that is written in different languages and in mid-sentence goes over to a poem.Keeping consistent style is easy and has great benefits.

When we use idioms we can start to intuitively reason about code. If you've had a lot of experience in C-style `for` loops then some of these will feel more natural than others::

	for( i = 0; i <= length-1; i += 1) {
		...
	}

	for( i = 0; i < length; i++ ) {
		...
	}

	for( i = 0; length > i; i++ ) {
		...
	}

	for( i = 0; length-1 >= i; i = i + 1 ) {
		...
	}

Although all of them say the same thing our intuition will say "this feels weird". If our intuition tells us that our code is wrong, although it is correct, it would be better to rewrite code such that it feels correct.

	If our language use is pure and beautiful many mistakes and errors will pop out like a red dot on a black screen.

The next strategy for handling complexity is ignoring things. We run our code on an OS that we can most of the time ignore. In a similar sense there are parts of code that do not affect other parts of code. By ignoring we can also accidentally ignore important things - so the question is how to write code such that it is easy to ignore things?

One strategy is to divide code into parts that are not dependent on each other. The other strategy for ignoring things is abstraction. Abstractions gives us ability to think about things without dealing details. Understanding different abstractions, how to make and use them is needed to make simple programs.

To choose best abstractions it is necessary to know several ways of doing something. Never be satisfied with the first solution because it rarely is the best solution.

It's also important to realize that abstraction is not an end goal in itself. By over-abstracting we can start to increase the complexity again. Code and model (abstraction) should be in balance. In the same we can have too much code, we can have too many abstract ideas.

Finally, when making things simpler it's also necessary to have a good understanding what "simple" and "complex", "easy" and "hard", "complecting" and "composing" mean. An excellent overview of those words was given by Rich Hickey in "Simple Made Easy".
When we do not understand what "simple" exactly means we won't understand what our goal is.

	Making complexity is easy.
	Using complexity is hard.
	Understanding complexity is impossible.

	Understanding simplicity is possible.
	Using simplicity is easy.
	Making simplicity is hard.


Summary
-------

HtDP_ gives a nice summary about programming:

	"Programming is far more than the mechanics of language acquisition. It is about reading problem statements, extracting the important concepts. It is about figuring out what is really wanted. It is about exploring examples to strengthen your intuitive understanding of the problem. It is about organizing knowledge and it is about knowing what you don’t know yet. It is about filling those last few gaps. It is about making sure that you know how and why your code works, and that you and your readers will do so in the future. In short, it is really about solving problems systematically."

Unfortunately it doesn't give such precise and short overview of the "systematic process" that helps you do all of that. If we wish to teach/learn programming effectively we must understand this "systematic process" throughly, not just hope that people somehow manage to derive this process themselves. We must understand the fundamental skills and knowledge.

I can't yet give this process, but I can give some questions that can help exercise those underlying skills.

* Concreteness or how do I make the computer do what I want?

  - How would I state the general concept?
  - What does that word exactly mean?
  - What tools can I use to implement that concept?

* Misconceptions or what parts do I misunderstand?

  - Why does this problem happen?
  - Why didn't my change make things better?
  - Why my change produced this result?

* Understanding or how can I understand things?

  - What happens if I comment out part of my code?
  - What happens if I tweak some parameter?
  - What happens if I do something to the code?
  - Is there some knowledge that can help me?

* Sub-goaling or how can I make my goal more achievable?

  - Can I understand just part of the problem?
  - Can I implement just part of the problem?
  - Can I understand something similar to my problem?
  - What could I have, that would make this problem much simpler?

* Complexity or how can I make things simpler?

  - Can I write it more nicely?
  - Can I find a different way how to write this?
  - Can I find a thing that makes other things simpler?
  - Can I find similar things and group them?
  - Can I find things that do not affect each and group them?
  - Can I make an abstract thing that simplifies my thinking?
  - Can I make an abstraction that hides my decisions?

These questions may seem quite concrete, but they are not. For example "What happens if I comment out part of my code?" doesn't say how to find which part should I comment out neither does it say how can I come to the conclusion that I need to ask this question. Each of these questions requires in-depth analysis, but I'll just skip that part. Every programmer asks these questions automatically and effortlessly, without thinking that he needs to do them.

Similar questions, but more general, have already been written by G. Polya in "How to Solve It". The only book that introduces all of these things is SICP_. It is a masterpiece for learning programming as it goes through the mental process of a programmer, not just the technical implementation. It is therefore a must read for any programmer.

Programming tutorial/course must make students ask these questions all of the time until it becomes second nature. If we structure learning based on the language constructs then we may not teach them skills. Programming course should be structured around skills - and the language constructs introduced as necessary. Any helping should be done through these questions, because they reinforce skills not knowledge. When teaching "knowledge" we need to explain the need for that knowledge and how to come up with that knowledge and even how to have the idea that you would need such knowledge [1]_.

.. [1] Knowledge meaning language constructs, paradigms, frameworks, code style.

.. _HtDP: http://www.htdp.org/
.. _SICP: http://mitpress.mit.edu/sicp/
