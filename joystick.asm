#importonce
#import "cia.asm"

// confusingly, joystick 1 is on port B
.const JOYSTICK1_PORT = CIA_PORT_B
.const JOYSTICK1_DDR = CIA_DDR_PORT_B

// joystick 2 is on port A
.const JOYSTICK2_PORT = CIA_PORT_A
.const JOYSTICK2_DDR = CIA_DDR_PORT_A


// bitmasks for joystick switches
.const JOYSTICK_UP = $01
.const JOYSTICK_DOWN = $02
.const JOYSTICK_LEFT = $04
.const JOYSTICK_RIGHT = $08
.const JOYSTICK_FIRE = $10
.const JOYSTICK_MASK = $1f
