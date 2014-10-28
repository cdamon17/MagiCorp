"Magicorp" by Cole Damon 
The story creation year is 2014. 
The story headline is "A murder in Magicorp". 
The story genre is "Mystery". 
[Release along with cover art ("")]
Release along with an interpreter.

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


Conference Room is a room. "The room ment to be your next step in the Magicorp ladder, now strewn with the bodies of the dead board members with only one living witness in the corner. You will need to find out exactly what happened. Maybe ask the witness about the murders? The Meeting room is to the east and Offices to the north."

bodies is a thing. bodies is in Conference Room. bodies is scenery. the description is "The board members seem to have been... disposed of, in different and unnatural ways, some too gruesome to describe. This can only be the work of a corporate magician to undermine the company. The sight is repulsive, but you are determined to find the one who did this. You could ask the witness about the murders."

Offices is a room. Offices is north of Conference Room. "This room is the offices for the basic workers, filled with closed work stations. it seems like all are oblivious to what happened in the conference room. It would not help to talk to these guys, so just focus on finding the culprit. The Conference Room is to the south, the Guard's Office is to the east, and the Hallway is to the west."

work stations is a container. work stations is closed and openable. work stations is fixed in place. work stations is in Offices. drawers is undescribed. the description is "A place where people work, they are closed right now but could be opened if your looking for something."

Hallway is a room. Hallway is west of Offices and east of Elevator. "This is just the regular hallway in between most elevators and rooms. The Elevator is to the west, Offices to the east, and a closet to the north."

Elevator is a room. Elevator is west of Hallway. "The elevator going to other floors, but its locked, so this seems to be a dead end. The Hallway is to the east."

Closet is a room. Closet is north of Hallway. "This is just a dark closet, not much is in here besides a closed mop bucket. The Hallway is to the south."

mop bucket is a container. mop bucket is closed and openable. mop bucket is in Closet. mob bucket is undescribed. the description is "a bucket with the lid closed, it looks like the kind the janitor uses."

Dark Arts Inc is a room. Dark Arts Inc is north of Void Portal. "Dark Arts Inc is Magicorp's biggest rival, of course they would send some one to sabotage you."

Guard's Office is a room. Guard's Office is east of Offices. "This is the office of the security guard. Its sparse with only an empty desk and the guard. The Offices is to the west."

desk is a supporter. desk is in Guard's Office. desk is undescribed. the description is "A regular wooden desk with nothing on it. Its rather boring."

Meeting Room is a room. Meeting Room is east of Conference Room. "The Meeting room is a secondary room to meet in if the Conference room is being used, it only has a locker to hold stuff. The Conference room is to the west, and Security room to the east."

locker is a container. locker is closed and openable. locker is fixed in place. locker is in Meeting Room. locker is undescribed. the description is "A locker used to store items in. Some times people forget things in there, so make sure you don't"

Security Room is a room. Security Room is east of Security Door. "This room holds security for the entire building. The Imagecaster would have seen what happened, but it seems to be missing! The dust around where it should be suggests that it was broken apart though, the murderer must have done this to cover his tracks! You will need to find the missing peaces and combine them back into an Imagecaster so you can see how the murderer escaped. The Meeting room is to the west."

[spin dial locked door from Laboratory Escape by Cole Damon]
Security Door is a door. Security Door is east of Meeting Room. Security Door is fixed in place, locked and lockable, closed and openable. the description is "A locked door protecting the Security room. It seems to be locked with a charmed spin dial so magic can not unlock it. The only way to get inside is to SPIN TO a 4 digit code all at once. The guard in the Guard's Office might know what it is."
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
    say "The door unlocks and glides open".
[End of code to open locked Genetics door.]






[Code for a combination puzzle from Tonic by Brianna Hartner]
[The combining action]
Base is a thing. Base is in locker. [Base is undescribed until player walks in Security Room for the first time.] the description is "The base of an Imagecaster, but its useless unless it is combined with the other parts."
Projector is a thing. Projector is in Elevator. the description is "The projector of an Imagecaster, but it does nothing unless combined with the rest."
Crystal is a thing. Crystal is in work stations. the description is "The power crystal of the an Imagecaster. Combine it with the other 2 parts to make the Imagecaster."

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
{Base, Projector}				Empty machine
{Base, Crystal}				Powered machine
{Projector, Crystal}				Imager
{Empty machine, Crystal}				Imagecaster
{Powered machine, Projector}				Imagecaster
{Imager, Base}				Imagecaster
{Base, Projector, Crystal}				Imagecaster

The Empty machine is an object. The description of the Empty machine is "That is an Imagecaster, but it has nothing in it's crystal core to power it."
The Powered machine is an object. The description of the Powered machine is "Its most of the Imagecaster, but there is no way to project the images."
The Imager is an object. The description of the Imager is "It can cast images, but it has no data from the Base to show."
Imagecaster is a device. The description is "[if Imagecaster is switched on] You see the murder run into the Conference room, and after finishing what he did in there, he ran through the offices into the hallway and went into the closet. He must have escaped through there!"

Imagecaster is in the off position.



[spell to unlock final door: from documentation 6.13] [with much help from John Nakagawa]
Understand "portasum openab" or "say portasum openab" as casting portasum openab.

Casting portasum openab is an action applying to nothing.

[conditions of casting]
Instead of casting portasum openab:
	if the player does not have Spell Note, say "The words were said correctly, but it seems that they also need the source material of the spell to channel magic through while ."instead;
	if the player has Spell Note: 
		say "In a clap of thunder and a bright flash, a glowing portal appears to the north.";
		increase VoidPortal by 1.
	
[Global:] VoidPortal is a number that varies. VoidPortal is 0.
[action of what happens]
Carry out casting portasum openab:
	now Void Portal is not scenery.[north of Closet and south of Dark Arts Inc.]
	
	[If player examines Void Portal:
	say "A swirling purple portal. It could lead anywhere, but you know you that going through it is the only way to discover the murderer.";
Otherwise:]
Instead of doing anything to Void Portal: [This code tells player that he cannot go through the door]
	If VoidPortal is 0:
		say "You can't do that.";
	Otherwise:
		Move player to Dark Arts Inc.

	
Instead of going north from Closet when VoidPortal is 0:
	say "There is no where to go."

Spell Note is a thing. Spell Note is in mop bucket. the description is "A scroll with a low level portal spell that even you could cast, it says 'portasum openab."
	
Void Portal is a door. Void Portal is north of Closet and south of Dark Arts Inc. Void Portal is scenery.[Void Portal starts game removed from play.] the description is "A swirling purple portal. It could lead anywhere, but you know you that going through it is the only way to discover the murderer."



[code for simple npc conversations, borrowed from MiltonManor by Philip Tanton]
understand "talk to [something]" as talking. Talking is an action applying to one thing.
Instead of talking something: say "Try asking about something instead."

witness is a man. witness is in Conference Room. the description is "A shivering office worker who's suit is splattered with the blood of the deceased. You could ask him about the murders to find out what happened".

After asking witness about "murders": say "'I was behind a board member as it happened, but I saw that a figure clad in black rushed in and started casting spells of black magic to kill every one. Oh I can't even try to describe how they died. I did not see who it was, but he ran off north to the Offices, the Security Room to the east might have video of where he went though.'".
Understand "murder", "deaths", and "death" as "[murders]".

After asking witness about "murderer": say "The murderer was in a black cloak with the hood up, so I was unable to see who it was. He ran away afterwards, but the Imagecaster inPlease find him, this could ruin the company!".

After asking witness about "Magicorp": say "Our company? We are one of the biggest innovators for techno magical products. We are at the top of the market, our biggest rival, Dark Arts Inc, doesn't even come close, but that might change now with all the board members dead. Please, you have to find the murderer, if you don't. we might all lose our jobs, or even lives.".
Understand "company", "job", "jobs", and "work" as "[Magicorp]".

guard is a man. guard is in Guard's Office. the description is "He is a stern looking man in the blue guard uniform and sunglasses. He is in charge of the security on this level. He would know the spin dial code to the Security room, you could ask him about it."

After asking guard about "code": say "Hi, I remember you, your that new rising worker, but why do you need to know the code for the security door, aren't you suppose to be in a meeting with the board members? Wait, what? Dead? All of them? Ofcourse I'll help you, we need to find this murder fast! The code is this year, so just spin the dial to 2657.".
Understand "security door", and "door" as "[code]".




[other npc talking code for more understanding from Clementine Way by Brent Uramoto]
[nstead of asking Jennifer about "[dinner]":
	If Story Line is 1:
		Say "'Hmm... Sure.' Says Jennifer. 'Oh! Remember that old recipie that we used to make as teens? What was it called? Umm...  Margret's Casserole!' [paragraph break] 'Yes,' you say. 'I think I still have that recipe in my recipe drawer.' [paragraph break] 'Ok, cool' responds Jennifer. I still have a lot of work to do, so could you call me back when you have it ready?' [paragraph break] 'Sure,' you say. 'I'll call you later.'";
		Now Story Line is 2;
	Otherwise:
		Say "I already asked Jennifer about dinner, and she said yes. No need to ask her again.".
		
Understand "a dinner", "meal", "dinner", and "a meal" as "[dinner]".
		
Understand "plans tonight", "this evening", "later on", "plans", and "activites" as "[tonight]".
[Code from Inform Handbook]

Instead of asking Jennifer about "[tonight]":
	If Story Line is 1:
		Say "Um, I dont think I have any plans for tonight. Why? Do you want to do something?"]



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

Every turn rule when the location of the player is Dark Arts Inc:
	If player is carrying the Spell Note:
		end the story finally saying "The portal sucks you in, and you find your self in a lobby, filled with many people in both dark suits and black magician robes. Oh, no. This is Dark Arts Inc, Magicorp's biggest rival in techno magic innovation! This can only mean this was an act of sabotage!";
	Otherwise: [will trigger if player is in Dark Arts Inc not carrying Spell Note]
		end the story finally saying "The portal sucks you in but on the other side, oh, no. This is Dark Arts Inc, Magicorp's biggest rival in techno magic innovation! You are met with magicians pointing wands at you, and one with a black hood on. Its a trap! The murderer knew you were following him and was expecting you to come through. The portal has closed behind you and theres no escape. It seems all is lost for Magicorp now :("
			

[Every turn when the location of the player is Dark Arts Inc:
          If the player is carrying the Spell Note:
                 end the story finally saying "The portal sucks you in, and you find your self in a lobby, filled with many people in both dark suits and black magician robes. Oh, no. This is Dark Arts Inc, Magicorp's biggest rival in techno magic innovation! This can only mean this was an act of sabotage!";
        Otherwise: [will trigger if player is in Dark Arts Inc not carrying Spell Note.]
                 end the story finally saying "The portal sucks you in but on the other side, oh, no. This is Dark Arts Inc, Magicorp's biggest rival in techno magic innovation! You are met with magicians pointing wands at you, and one with a black hood on. Its a trap! The murderer knew you were following him and was expecting you to come through. The portal has closed behind you and theres no escape. It seems all is lost for Magicorp now. :("]

[short route to finish game:
(steps for non-story completion):
n
w
n
open bucked
take note
portasum openab
n
(steps for story completion)
ask witness about murders
e
x door
w
n
e
ask guard about code
w
s
e
spin dial to 2657
e
w
open locker
take base
w
n
open work stations
take crystal
combine crystal and base
w
w
take projector
combine projector and powered machine
x imagecaster
e
n
open bucket
take note
portasum openab
n]