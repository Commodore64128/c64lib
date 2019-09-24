#importonce

.const TIMER_KERNAL_JIFFY = $00a0
.const TIMER_KERNAL_JIFFY_LSB = TIMER_KERNAL_JIFFY + 2

.macro timer_nop_jiffies(j) {
    lda TIMER_KERNAL_JIFFY_LSB
    adc #(j-1)
nop_loop:
    cmp TIMER_KERNAL_JIFFY_LSB
    bcs nop_loop
}