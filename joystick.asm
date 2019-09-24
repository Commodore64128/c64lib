#importonce

// confusingly, joystick 1 is on port B
.const JOYSTICK1_PORT = $dc01
// joystick 2 is on port A
.const JOYSTICK2_PORT = $dc00

// bitmasks for joystick switches
.const JOYSTICK_UP = $01
.const JOYSTICK_DOWN = $02
.const JOYSTICK_LEFT = $04
.const JOYSTICK_RIGHT = $08
.const JOYSTICK_FIRE = $10
