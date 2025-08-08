extends VehicleBody3D

@export var max_engine_force := 2800.0
@export var max_brake := 120.0
@export var max_steer := 0.6
@export var steer_lerp := 5.0

var steer := 0.0

func _ready():
    physics_material_override = PhysicsMaterial.new()

func _physics_process(delta):
    var throttle := Input.get_action_strength("ui_accel") - Input.get_action_strength("ui_brake")
    var steer_target := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    steer = lerp(steer, steer_target * max_steer, steer_lerp * delta)

    engine_force = (throttle > 0.0) ? throttle * max_engine_force : 0.0
    brake = (throttle < 0.0) ? -throttle * max_brake : 0.0
    steering = steer
