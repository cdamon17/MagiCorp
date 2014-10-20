"magicorp" by Cole Damon

[Code to display a player's location in the game and possible exits in the header.
code from Tonic by Brianna Hartner]
When play begins:
	now left hand status line is "Exits: [exit list]";
	now right hand status line is "[location]".
	
To say exit list:
	let place be location;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room, say " [way] ".

Confrence Room is a room. 

Offices is a room. Offices is north of Confrence Room.

Hallway is a room. Hallway is west of Offices and east of Elevator.

Elevator is a room. Elevator is east of Hallway.

Closet is a room. Closet is north of Hallway.

Dark Arts Inc is a room. Dark Arts Inc is north of Closet.

Gaurd Office is a room. Gaurd Office is east of Offices.

Meeting Room is a room. Meeting Room is east of Confrence Room.

Security Room is a room. Security Room is east of Meeting Room.





[Code for a combination puzzle from Tonic by Brianna Hartner
[The combining action]
Understand "combine [something] with [something]" as combining it with.
Combining it with is an action applying to two things.

[The line below tells Inform7 that combining produces something.]
The combining it with action has an object called the Contraption.

Setting action variables for combining something with something: 
	let X be a list of objects;
	add the noun to X;
	add the second noun to X;
	sort X; 
	repeat through the Table of Holoprojector Parts: 
		let Y be the parts list entry; 
		sort Y; 
		if X is Y: 
			now the Contraption is the results entry.

[if there is no match for the combination of things, there is no result for the combining, so STOP the action]
Check combining it with:
	if Contraption is nothing:
		say "You can't combine [the noun] and [the second noun] into anything useful.[line break]Try another combination of things.";
		stop the action.

[If action is not stopped, continue to…]
Carry out combining it with: 
	say "You fuse together [the noun] and [the second noun].";
	remove the noun from play;
	remove the second noun from play;
	move the Contraption to the player.

Report combining it with:
	say "You now have a [a Contraption]."


Table of Holoprojector Parts
Parts List	Results
{Clamp, Spatula}	Clamp Spatula Thingy
{Clamp, Tongs}	Clamp Tong Thingy
{Spatula, Tongs}	Spatula Tong Thingy
{Clamp Spatula Thingy, Tongs}	Arm Thingy
{Clamp Tong Thingy, Spatula}	Arm Thingy
{Spatula Tong Thingy, Clamp}	Arm Thingy
{Clamp, Spatula, Tongs}	Arm Thingy

The Clamp Spatula Thingy is an object. The description of the Clamp Spatula Thingy is "Clamp and Spatula… Need anything else?"
The Clamp Tong Thingy is an object. The description of the Clamp Tong Thingy is "Clamp and Pair of Tongs… Need anything else?"
The Spatula Tong Thingy is an object. The description of the Spatula Tong Thingy is "Spatula and Pair of Tongs… Need anything else?"]


[spell to unlock final door:
Understand "   " or "say    " as casting ______  .

Casting   ______  is an action applying to nothing.

[conditions of casting]
Check casting  ____  :
	if the player does not have Spell Note, say "The words were said correctly, but it seems that they also need the source material of the spell to chanel magic through."instead;
	if the player has Spell Note, say ""
	

[action of what happens]
Carry out casting  ___  :
	move Void door to north of Closet.]


[puzzles to use:
	locked dial door
	combination of parts
	say spell to unlock door   ask riely about magic words
	npc conversations]