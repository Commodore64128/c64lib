#importonce

#import "irq.asm"

.const VIC_SCREEN_BASE = $0400
.const VIC_SCREEN_CONTROL_1 = $d011
.const VIC_RASTER_LINE = $d012
.const VIC_SCREEN_CONTROL_2 = $d016

.const VIC_IRQ_STATUS = $d019
.const VIC_IRQ_CONTROL = $d01a
.const VIC_IRQ_MASK_RASTER = $01
.const VIC_IRQ_MASK_SPRITE_BG = $02
.const VIC_IRQ_MASK_INTER_SPRITE = $04
.const VIC_IRQ_MASK_LIGHT_PEN = $08

.const VIC_COLOR_BORDER = $d020
.const VIC_COLOR_BACKGROUND = $d021

.const VIC_SCREEN_WIDTH_PIXELS = 320
.const VIC_SCREEN_HEIGHT_PIXELS = 200


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

.macro vic_fillscreen(screen, char) {
    lda #char
    ldx #0
loop:
    sta screen, x
    sta screen + $100, x
    sta screen + $200, x
    sta screen + $300, x
    inx
    bne loop
}
