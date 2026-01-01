Project Settings
	Went into project settings and changed the textures rendering to nearest for the 
	low clarity pixel images
	
	Additionally, stretch mode is set to canvas items, the window height and width is shrunk
	to accomodate the pixel art, and in the ADVANCED SETTINGS I have ovverided the 
	window width and height to automatically start with a bigger window

Useful Functions
is_on_floor()
	Returns true if the body collided with the floor on the last call of move_and_slide(). 
	Otherwise, returns false. The up_direction and floor_max_angle are used to determine 
	whether a surface is "floor" or not.

Input.get_axis()
	Get axis input by specifying two actions, one negative and one positive.
	
append()
	This is used as an array method. array.append(). This adds an element to the end of the array
remove_at(index)
	removes element at that index
erase(value)
	removes that array index that contains that value, but only 1 of it incase you have multiple
	of that value
