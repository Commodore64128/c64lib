#importonce

.const CIA_IRQ_CONTROL = $dc0d
.const CIA_NMI_CONTROL = $dd0d

.macro cia_irq_disable() {
    lda #$7f
    sta CIA_IRQ_CONTROL
    sta CIA_NMI_CONTROL
    lda CIA_IRQ_CONTROL
    lda CIA_NMI_CONTROL
}
