#importonce

// i += 1
.macro math16_inc(i) {
    inc i
    bne return
    inc i+1
return:
}

// i += j
// clobbers: a
.macro math16_add8(i, j8) {
    // lo byte
    clc
    lda i
    adc #j8
    sta i
    bcc return
    inc i+1
return:
}

// i += j
.macro math16_add(i, j) {
    // lo byte
    clc
    lda i
    adc j
    sta i

    // hi byte
    lda i+1
    adc j+1
    sta i+1
}
