extends VehicleBody3D
@export var cruise_speed := 16.0
@export var accel := 1600.0
@export var brake_power := 70.0
@export var look_ahead := 10.0
@onready var ray := $RayCast3D

var path: Curve3D
var distance := 0.0
@export var speed_on_path := 8.0

func _ready():
    ray.target_position = Vector3(0, 0, -look_ahead)

func set_path(c: Curve3D, start_d: float):
    path = c
    distance = start_d

func _physics_process(delta):
    if path == null: return
    distance += speed_on_path * delta
    var pos := path.sample_baked(distance, true)
    var dir := (pos - global_transform.origin).normalized()
    var local := global_transform.basis.inverse() * dir
    steering = clamp(local.x * 1.2, -0.6, 0.6)

    ray.force_raycast_update()
    var desired := cruise_speed
    if ray.is_colliding():
        desired = 0.0

    var v := linear_velocity.length()
    if v < desired:
        engine_force = accel
        brake = 0.0
    else:
        engine_force = 0.0
        brake = brake_power
