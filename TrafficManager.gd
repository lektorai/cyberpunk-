extends Node
@export var npc_car_scene: PackedScene
@export var path_nodes: Array[NodePath]
@export var npc_count := 14

var curves: Array[Curve3D] = []

func _ready():
    for p in path_nodes:
        var n := get_node(p)
        if n and n is Path3D:
            curves.append(n.curve)

    var rng = RandomNumberGenerator.new()
    rng.randomize()

    for i in range(npc_count):
        if curves.is_empty(): break
        var car := npc_car_scene.instantiate()
        add_child(car)
        var curve := curves[i % curves.size()]
        var start := rng.randi_range(0, 1000)
        car.global_transform.origin = curve.sample_baked(start, true)
        car.set_path(curve, float(start))
