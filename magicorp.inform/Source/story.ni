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
		
[Code to disable take all from Ragnarok by Marissa Takebayashi]
Rule for deciding whether all includes something: it does not.
[Code for snide remark after take all from A Day for Spelling by Mary Kiang]
Rule for printing a parser error when the latest parser error is the nothing to do error: say "That would make things to easy, try to have some fun :)" instead.

[code needed to change what is said for take all
if player takes all, say "That would make things to easy."]

When play begins: say "This is an exiting day! You have been invited by the board to sit in on a conference about the company's newest product for techno magic. As you open the door, your face contorts in horror to find all the Conference Room littered with the unmoving bodies of the board members. This is a tragidy, the company will be thrown into ruin from this loss unless the true murderer can be caught. It is up to you to find the culprate and save Magicorp."

The description of the player is ""

bodies is a thing. bodies is in Conference Room. bodies is scenery. the description is ""

Conference Room is a room. ""

Offices is a room. Offices is north of Conference Room. ""

Hallway is a room. Hallway is west of Offices and east of Elevator. ""

Elevator is a room. Elevator is east of Hallway. ""

Closet is a room. Closet is north of Hallway. ""

Dark Arts Inc is a room. Dark Arts Inc is north of Closet. ""

Guard Office is a room. Guard Office is east of Offices. ""

Meeting Room is a room. Meeting Room is east of Conference Room. ""

Security Room is a room. Security Room is east of Meeting Room. ""







[sample of NPC code from Loose Dragon by EJ Talevera
In Training room is a male person called Alfred. The description of Alfred is "Your personal butler who has been with you for 15 years. He can assist you with anything."

Instead of asking the Alfred about "Draco":
say "No sir, I haven't seen Draco around here recently. He's probably wondering around. I think I closed all the windows. Better find him quick."

Instead of asking the Alfred about "Dragon Gloves":
say "Yes I might know where those gloves are, but I think I need a little cash to jog my memory."

Instead of giving Money to Alfred:
say "Oh yes the gloves are in my back pocket. Here you go.";
remove money from play;
move pair of Dragon Gloves to player.]



[Code for a combination puzzle from Tonic by Brianna Hartner]
[The combining action]
Clapm is a thing. Clamp is in Conference Room.
Spatula is a thing. Spatuala is in Conference Room.
Tongs is a thing. Tongs is in Conference Room.

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
Parts List				Results
{Clamp, Spatula}				Clamp Spatula Thingy
{Clamp, Tongs}				Clamp Tong Thingy
{Spatula, Tongs}				Spatula Tong Thingy
{Clamp Spatula Thingy, Tongs}				Arm Thingy
{Clamp Tong Thingy, Spatula}				Arm Thingy
{Spatula Tong Thingy, Clamp}				Arm Thingy
{Clamp, Spatula, Tongs}				Arm Thingy

The Clamp Spatula Thingy is an object. The description of the Clamp Spatula Thingy is "Clamp and Spatula… Need anything else?"
The Clamp Tong Thingy is an object. The description of the Clamp Tong Thingy is "Clamp and Pair of Tongs… Need anything else?"
The Spatula Tong Thingy is an object. The description of the Spatula Tong Thingy is "Spatula and Pair of Tongs… Need anything else?"
The Arm Thingy is an object. The description is ""



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