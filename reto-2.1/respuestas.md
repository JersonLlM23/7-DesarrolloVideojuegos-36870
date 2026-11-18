# UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE

## CARRERA DE SOFTWARE

## DESARROLLO DE VIDEOJUEGOS

# Respuestas del reto 2.1

### 1. Mantén D dos segundos y suéltala: ¿qué contador subió más y por qué?

El contador de cuadros aumentó más porque el sondeo se ejecuta en cada cuadro de física mientras la tecla permanece presionada. En cambio, el contador de eventos registra los cambios de estado de la tecla, es decir, cuando se presiona y cuando se libera.

### 2. Mantén A: ¿qué valor muestran get_axis y get_action_strength("move_right"), y por qué difieren?

get_axis muestra -1, mientras que get_action_strength("move_right") muestra 0.

Esto ocurre porque get_axis("move_left", "move_right") compara las dos acciones: al mantener A (move_left) obtiene -1 porque se está desplazando hacia la izquierda. En cambio, get_action_strength("move_right") solamente consulta la acción move_right; como D no está presionada, su valor es 0.

### 3. Gira la rueda del ratón: ¿qué clase de evento aparece y por qué su rama va antes que la del clic?

Aparece un evento InputEventMouseButton. La rueda utiliza identificadores: MOUSE_BUTTON_WHEEL_UP y MOUSE_BUTTON_WHEEL_DOWN. La rama de la rueda va antes que la del clic porque ambos utilizan la misma clase de evento. Primero se debe comprobar si el botón corresponde a MOUSE_BUTTON_WHEEL_UP o MOUSE_BUTTON_WHEEL_DOWN; de lo contrario, la rueda podría clasificarse incorrectamente como un clic.
