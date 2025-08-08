extends CharacterBody3D

@export var speed := 1.4
@onready var target_points := get_tree().get_nodes_in_group("ped_targets")
var target: Node3D

func _ready():
    _pick()

func _physics_process(delta):
    if target == null:
        _pick()
        return
    var dir := (target.global_transform.origin - global_transform.origin)
    if dir.length() < 0.5:
        _pick()
        return
    dir.y = 0
    dir = dir.normalized()
    velocity.x = dir.x * speed
    velocity.z = dir.z * speed
    move_and_slide()

func _pick():
    if target_points.is_empty(): return
    target = target_points[randi() % target_points.size()]
