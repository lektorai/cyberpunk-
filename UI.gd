extends CanvasLayer

func _ready():
    var left = $Control/Left
    var right = $Control/Right
    var accel = $Control/Accel
    var brake = $Control/Brake

    left.pressed.connect(func(): Input.action_press("ui_left"))
    left.released.connect(func(): Input.action_release("ui_left"))
    right.pressed.connect(func(): Input.action_press("ui_right"))
    right.released.connect(func(): Input.action_release("ui_right"))
    accel.pressed.connect(func(): Input.action_press("ui_accel"))
    accel.released.connect(func(): Input.action_release("ui_accel"))
    brake.pressed.connect(func(): Input.action_press("ui_brake"))
    brake.released.connect(func(): Input.action_release("ui_brake"))
