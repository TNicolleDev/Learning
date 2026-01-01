extends ParallaxBackground

@onready var sprite_2d: Sprite2D = $ParallaxLayer/Sprite2D
@export var background_texture: CompressedTexture2D = preload("res://martian_mike_game/assets/textures/bg/Green.png")
@export var scroll_speed : float = 100


func _ready() -> void:
	sprite_2d.texture = background_texture

func _process(delta: float) -> void:
	sprite_2d.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
	if sprite_2d.region_rect.position >= Vector2(64,64):
		sprite_2d.region_rect.position = Vector2.ZERO
