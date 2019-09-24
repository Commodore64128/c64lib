#importonce

.const GFX_SCREEN_BASE = $0400
.const GFX_SCREEN_CONTROL_1 = $d011
.const GFX_SCREEN_CONTROL_2 = $d016
.const GFX_COLOR_BORDER = $d020
.const GFX_COLOR_BACKGROUND = $d021

.macro gfx_setbordercolor(color) {
    lda #color
    sta GFX_COLOR_BORDER
}

.macro gfx_setbackgroundcolor(color) {
    lda #color
    sta GFX_COLOR_BACKGROUND
}

.macro gfx_fillscreen(screen, char) {
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
