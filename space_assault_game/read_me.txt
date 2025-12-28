Useful Functions
move_and_slide()
	Moves the body based on velocity. If the body collides with another,
	 it will slide along the other body (by default only on floor) rather than stop immediately.
	 If the other body is a CharacterBody2D or RigidBody2D,
	 it will also be affected by the motion of the other body. 
	 You can use this to make moving and rotating platforms, or to make nodes push other nodes.
get_viewport_rect()
	Returns the transform from the coordinate system of the canvas coordinate system.

clampf(value: float, min: float, max: float)
	Clamps the value, returning a float not less than min and not more than max.

queue_free()
	Queues this node to be deleted at the end of the current frame. When deleted,
	 all of its children are deleted as well,
	 and all references to the node and its children become invalid.

pick_random()
	Returns a random element from the array. Generates an error and returns null if the array is empty.



Project Settings
	Display => Window => Stretch => Mode => Canvas Items
	This make every canvas item scale to the maximized window size

Rocket Container
	This is a NODE. A NODE does not even have a transform. So now we'll be adding
	childing to the rocket container essentially breaking the parent child position
	relation ship with Player
