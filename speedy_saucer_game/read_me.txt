Useful Functions
apply_impulse(Vector2(250,25))
	used to simulate a 1 time impact on an object

apply_force(Vector2(10,0))
	meant to apply force each frame.
	
Good Tips
CanvasLayer Node
	This has its own transform, and we NOT move with the camera. Useful for 
	parallax effects, HUDs. Anytime you want something to stay where you put it.
TextureRect
	If you want the background to adjust based on screen size, use the anchor preset
	FULL RECT
