#importonce

// https://problemkaputt.de/pagezero.htm

.const SID_V1_FREQ_LO = $d400
.const SID_V1_FREQ_HI = $d401
.const SID_V1_PULSE_DUTY_LO = $d402
.const SID_V1_PULSE_DUTY_HI = $d403
.const SID_V1_CONTROL_REG = $d404
.const SID_V1_ENV_AD = $d405
.const SID_V1_ENV_SR = $d406

.const SID_V2_FREQ_LO = $d407
.const SID_V2_FREQ_HI = $d408
.const SID_V2_PULSE_DUTY_LO = $d409
.const SID_V2_PULSE_DUTY_HI = $d40a
.const SID_V2_CONTROL_REG = $d40b
.const SID_V2_ENV_AD = $d40c
.const SID_V2_ENV_SR = $d40d

.const SID_V3_FREQ_LO = $d40e
.const SID_V3_FREQ_HI = $d40f
.const SID_V3_PULSE_DUTY_LO = $d410
.const SID_V3_PULSE_DUTY_HI = $d411
.const SID_V3_CONTROL_REG = $d412
.const SID_V3_ENV_AD = $d413
.const SID_V3_ENV_SR = $d414

.const SID_FILTER_CUTOFF_LO = $d415
.const SID_FILTER_CUTOFF_HI = $d416
.const SID_FILTER_RESONANCE_AND_ROUTING = $d417
.const SID_FILTER_MODE_AND_VOLUME = $d418

.const SID_PADDLE_X_RO = $d419
.const SID_PADDLE_Y_RO = $d41a
.const SID_V3_OSC_RO = $d41b
.const SID_V3_ENV_RO = $d41c

.const SID_WAVE_GATE = $1
.const SID_WAVE_SYNC_V3 = $2
.const SID_WAVE_RINGMOD_V3 = $4
.const SID_WAVE_TEST = $8
.const SID_WAVE_TRIANGLE = $10
.const SID_WAVE_SAWTOOTH = $20
.const SID_WAVE_PULSE = $40
.const SID_WAVE_NOISE = $80

// initialize voice 3 of the SID to be used as an RNG
.macro sid_rnd_init() {
    lda #$ff
    sta SID_V3_FREQ_LO
    sta SID_V3_FREQ_HI
    lda #SID_WAVE_NOISE
    sta SID_V3_CONTROL_REG
}
