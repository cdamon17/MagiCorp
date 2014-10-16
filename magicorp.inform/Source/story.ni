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

Enemy Company is a room. Enemy Company is north of Closet.

Gaurd Office is a room. Gaurd Office is east of Offices.

Meeting Room is a room. Meeting Room is east of Confrence Room.

Security Room is a room. Security Room is east of Meeting Room.



[puzzles to use:
	locked dial door
	combination of parts
	say spell to unlock door
	npc conversations]