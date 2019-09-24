#importonce

.const CIA_IRQ_CONTROL = $dc0d
.const CIA_NMI_CONTROL = $dd0d
.const CIA_PORT_A = $dc00
.const CIA_PORT_B = $dc01
.const CIA_DDR_PORT_A = $dc02
.const CIA_DDR_PORT_B = $dc03

.macro cia_irq_disable() {
    lda #$7f
    sta CIA_IRQ_CONTROL
    sta CIA_NMI_CONTROL
    lda CIA_IRQ_CONTROL
    lda CIA_NMI_CONTROL
}
