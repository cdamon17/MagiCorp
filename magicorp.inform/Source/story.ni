"Magicorp" by Cole Damon

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

When play begins: say "This is an exiting day! You have been invited by the board to sit in on a conference about the company's newest product for techno magic. As you open the door, your face contorts in horror to find all the Conference Room littered with the unmoving bodies of the board members, killed by magic, and one shivering witness in the corner. This is a tragedy, the company will be thrown into ruin from this loss unless the true murderer can be caught. It is up to you to find the culprit and save Magicorp."

The description of the player is "Your wearing your nicest suit for the conference. Magician robes did not seem necessary today."


Conference Room is a room. "The room ment to be your next step in the Magicorp ladder, now strewn with the bodies of the dead board members with only one living witness in the corner. You will need to find out exactly what happened. Maybe ask the witness about the murders?"

bodies is a thing. bodies is in Conference Room. bodies is scenery. the description is "The board members seem to have been... disposed of, in different and unnatural ways, some too gruesome to describe. This can only be the work of a corporate magician to undermine the company. The sight is repulsive, but you are determined to find the one who did this."

Offices is a room. Offices is north of Conference Room. "This room is the offices for the basic workers, filled with cubical like work stations. it seems like all are oblivious to what happened in the conference room. It would not help to talk to these guys, so just focus on finding the culprit. The Conference Room is to the south, the Guard Office is to the east, and the Hallway is to the west."

Hallway is a room. Hallway is west of Offices and east of Elevator. "This is just the regular hallway in between most elevators and rooms. The Elevator is to the east, Offices to the west, and a closet to the north."

Elevator is a room. Elevator is east of Hallway. "The elevator going to other floors, but its locked, so this seems to be a dead end."

Closet is a room. Closet is north of Hallway. "This is just a dark closet, not much is in here"

Dark Arts Inc is a room. Dark Arts Inc is north of Void Portal. "Dark Arts Inc is Magicorp's biggest rival, of course they would send some one to sabotage you."

Guard Office is a room. Guard Office is east of Offices. ""

Meeting Room is a room. Meeting Room is east of Conference Room. ""

Security Room is a room. Security Room is east of Security Door. ""

[spin dial locked door from Laboratory Escape by Cole Damon]
Security Door is a door. Security Door is east of Meeting Room. Security Door is fixed in place, locked and lockable, closed and openable. the description is "A locked door protecting the Security room. It seems to be locked with a charmed spin dial so magic can not unlock it. The only way to get inside is to SPIN TO a 4 digit code all at once. The Guard in the Guard Office might know what it is."
Understand "dial" and "dials" as the door.

Instead of opening Security Door when Security Door is locked:
    say "The door is sealed shut and seems like opens only when the correct combination is spun in the spin dial at once. You must SPIN THE DIAL TO the correct 4 digit code."
    
[Create an action for spinning the dials.]
Understand "spin [something] to [a number]" as spinning it to.
spinning it to is an action applying to one thing and one number. 

[Check the action spinning in case its not applied to Genetics door.]
Check spinning it to:
	if the noun is not Security Door:
		say "[The noun] does not spin." instead. 

[If not Genetics door, give this feedback.]
Report spinning it to:
    say "Click, and not much else happens."

[If they spin the correct code, then Genetics door is unlocked.]
Instead of spinning the closed Security Door to 2657:
    now Security Door is unlocked;
    say "The door unlocks and opens with a hiss".
[End of code to open locked Genetics door.]






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
Clamp is a thing. Clamp is in Conference Room.
Spatula is a thing. Spatula is in Conference Room.
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
	repeat through the Table of Imagecaster Parts: 
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


Table of Imagecaster Parts
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



[spell to unlock final door: from documentation 6.13] [with much help from John Nakagawa]
Understand "portasum openab" or "say portasum openab" as casting portasum openab.

Casting portasum openab is an action applying to nothing.

[conditions of casting]
Instead of casting portasum openab:
	if the player does not have Spell Note, say "The words were said correctly, but it seems that they also need the source material of the spell to channel magic through while ."instead;
	if the player has Spell Note: 
		say "In a clap of thunder and a bright flash, a glowing portal appears to the north.";
		increase VoidPortal by 1;
	
[Global:] VoidPortal is a number that varies. VoidPortal is 0.
[action of what happens]
Carry out casting portasum openab:
	now Void Portal is not scenery.[north of Closet and south of Dark Arts Inc.]
	
Instead of doing anything to Void Portal:
	If VoidPortal is 0You can't do that.";
	Otherwise:
		move player to Dark Arts Inc;

	
Instead of going north from Closet when VoidPortal is 0:
	say "There is no where to go."

Spell Note is a thing. Spell Note is in Conference Room. the description is "A scroll with a low level portal spell that: 
		say "even you could cast, it says 'portasum openab."
	
Void Portal is a door. Void Portal is north of Closet and south of Dark Arts Inc. Void Portal is scenery.[Void Portal starts game removed from play.] the description is "A swirling purple portal. It could lead anywhere, but you know you that going through it is the only way to discover the murderer."


	




[code for NPC conversations: from documentation 7.8

A person has a table name called conversation.
					
Instead of asking someone about something: 
    let the source be the conversation of the noun; 
    if topic understood is a topic listed in source: 
        if there is a turn stamp entry: 
            say "[The noun] has already told you that [summary entry]."; 
        otherwise: 
            now turn stamp entry is the turn count; 
            say "[reply entry][paragraph break]"; 
    otherwise: 
        say "[The noun] stares at you blankly."

Instead of telling someone about something:
	try asking the noun about it.
	
Definition: a person is other if it is not the player.

Understand "recap" or "review" as recalling conversations.

Recalling conversations is an action applying to nothing.

Carry out recalling conversations:
	repeat with speaker running through other people:
		let source be the conversation of the speaker;
		sort source in turn stamp order;
		say "[The speaker] has so far told you: [line break]";
		let index be 0;
		repeat through source:
			if there is a turn stamp entry:
				let index be 1;
				say " [summary entry][line break]";
			if index is 0, say " absolutely nothing[line break]";
			say conditional paragraph break.
			

Table of Witness's Chatter
topic	reply	summary	turn stamp
"murder"	"I was behind a board member as it happened, but I saw that a figure clad in black rushed in and started casting spells of black magic to kill every one. Oh I can't even try to describe how they died. I did not see who it was, but he ran off north to the Offices, the Security Room to the east might have video of where he went though."	"Security Room could have video of murderer."	a number
""	""	""	--


Table of Guard's Chatter
topic	reply	summary	turn stamp
]

Every turn rule:
	If player is in Dark Arts Inc:
		end the story finally saying "Oh, no. This is Dark Arts Inc, Magicorp's biggest rival in techno magic innovation! This can only mean this was an act of sabotage!"

[puzzles to use:
	locked dial door
	combination of parts
	say spell to unlock door   ask riely about magic words
	npc conversations]