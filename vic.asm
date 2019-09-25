#importonce

#import "irq.asm"

.const VIC_SCREEN_BASE = $0400
.const VIC_SCREEN_CONTROL_1 = $d011
.const VIC_RASTER_LINE = $d012
.const VIC_SCREEN_CONTROL_2 = $d016
.const VIC_MASK_MULTICOLOR_MODE = $10

.const VIC_IRQ_STATUS = $d019
.const VIC_IRQ_CONTROL = $d01a
.const VIC_IRQ_MASK_RASTER = $01
.const VIC_IRQ_MASK_SPRITE_BG = $02
.const VIC_IRQ_MASK_INTER_SPRITE = $04
.const VIC_IRQ_MASK_LIGHT_PEN = $08

.const VIC_COLOR_BORDER = $d020
.const VIC_COLOR_BACKGROUND = $d021
.const VIC_COLOR_BACKGROUND_1 = $d022
.const VIC_COLOR_BACKGROUND_2 = $d023
.const VIC_COLOR_BACKGROUND_3 = $d024

.const VIC_VIEWPORT_WIDTH = 320
.const VIC_VIEWPORT_HEIGHT = 200
.const VIC_BORDER_WIDTH = 24
.const VIC_BORDER_HEIGHT = 30

.macro vic_irq_raster_enable(i_line, isr) {
    // set raster line
    lda #$7f    // clear MSB
    and VIC_SCREEN_CONTROL_1
    lda #i_line
    sta VIC_RASTER_LINE
    // set ISR address
    lda #<isr
    sta IRQ_ISR_LO
    lda #>isr
    sta IRQ_ISR_HI
    // enable raster interrupt
    lda #VIC_IRQ_MASK_RASTER
    sta VIC_IRQ_CONTROL
}

.macro vic_setbordercolor(color) {
    lda #color
    sta VIC_COLOR_BORDER
}

.macro vic_setbackgroundcolor(color) {
    lda #color
    sta VIC_COLOR_BACKGROUND
}

.macro vic_enablemulticolor() {
    lda VIC_SCREEN_CONTROL_2
    ora VIC_MASK_MULTICOLOR_MODE
    sta VIC_SCREEN_CONTROL_2
}