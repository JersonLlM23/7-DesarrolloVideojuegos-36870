
extends Node2D

@onready var hud: Label = $Hud

var cuadros_pulsados := 0
var eventos_recibidos := 0

var clase_ultima := "N/A"
var ultimo_dispositivo_obtenido := "N/A"
var tipo_senal := "N/A"


func _physics_process(delta: float) -> void:
	# Información de las acciones
	var jump_estado = Input.is_action_pressed("jump")
	var axis = Input.get_axis("move_left", "move_right")
	var fuerza = Input.get_action_strength("move_right")

	# Sondeo: preguntamos en cada cuadro de física
	if Input.is_action_pressed("move_right"):
		cuadros_pulsados += 1

	hud.text = """
CONTROL DE ENTRADAS

Jump: %s

Get Axis: %.2f
Get Action Strength: %.2f

ÚLTIMO EVENTO: %s
DISPOSITIVO: %s
TIPO DE SEÑAL: %s

SONDEO:
Move Right: %d cuadros

EVENTOS:
Move Right: %d eventos
""" % [
		jump_estado,
		axis,
		fuerza,
		clase_ultima,
		ultimo_dispositivo_obtenido,
		tipo_senal,
		cuadros_pulsados,
		eventos_recibidos
	]


func _input(event: InputEvent) -> void:
	# Ignorar el eco del teclado
	if event is InputEventKey and event.is_echo():
		return

	# Identificar clase, dispositivo y tipo de señal
	clase_ultima = event.get_class()

	if event is InputEventKey:
		ultimo_dispositivo_obtenido = "Teclado"
		tipo_senal = "Digital"

	elif event is InputEventMouseButton:
		ultimo_dispositivo_obtenido = "Raton"

		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			tipo_senal = "Posición/rueda"
		else:
			tipo_senal = "Digital/clic"

	elif event is InputEventMouseMotion:
		ultimo_dispositivo_obtenido = "Raton"
		tipo_senal = "Posición"

	#Contar eventos de move_right
	if event.is_action("move_right"):
		eventos_recibidos += 1
