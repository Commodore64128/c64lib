#importonce

// https://problemkaputt.de/pagezero.htm

.const SID_V1_BASE = $d400
.const SID_V1_FREQ_LO = SID_V1_BASE
.const SID_V1_FREQ_HI = $d401
.const SID_V1_PULSE_DUTY_LO = $d402
.const SID_V1_PULSE_DUTY_HI = $d403
.const SID_V1_CTRL = $d404
.const SID_V1_ENV_AD = $d405
.const SID_V1_ENV_SR = $d406

.const SID_V2_BASE = $d407
.const SID_V2_FREQ_LO = SID_V2_BASE
.const SID_V2_FREQ_HI = $d408
.const SID_V2_PULSE_DUTY_LO = $d409
.const SID_V2_PULSE_DUTY_HI = $d40a
.const SID_V2_CTRL = $d40b
.const SID_V2_ENV_AD = $d40c
.const SID_V2_ENV_SR = $d40d

.const SID_V3_BASE = $d40e
.const SID_V3_FREQ_LO = SID_V3_BASE
.const SID_V3_FREQ_HI = $d40f
.const SID_V3_PULSE_DUTY_LO = $d410
.const SID_V3_PULSE_DUTY_HI = $d411
.const SID_V3_CTRL = $d412
.const SID_V3_ENV_AD = $d413
.const SID_V3_ENV_SR = $d414

.const SID_CTRL_TRIGGER = $01
.const SID_CTRL_SYNC = $02
.const SID_CTRL_RINGMOD = $04
.const SID_CTRL_VOICE_DISABLE = $08
.const SID_WAVE_TRIANGLE = $10
.const SID_WAVE_SAWTOOTH = $20
.const SID_WAVE_PULSE = $40
.const SID_WAVE_NOISE = $80

.const SID_FILTER_CUTOFF_LO = $d415
.const SID_FILTER_CUTOFF_HI = $d416
.const SID_FILTER_CTRL = $d417
.const SID_FILTER_MODE = $d418

.const SID_FILTER_CTRL_V1 = $01
.const SID_FILTER_CTRL_V2 = $02
.const SID_FILTER_CTRL_V3 = $04
.const SID_FILTER_CTRL_EXT = $08
.const SID_FILTER_CTRL_RESONANCE = $f0

.const SID_FILTER_MODE_VOLUME = $0f
.const SID_FILTER_MODE_LP = $10
.const SID_FILTER_MODE_BP = $20
.const SID_FILTER_MODE_HP = $40
.const SID_FILTER_MODE_V3_DISABLE = $80

.const SID_PADDLE_X_RO = $d419
.const SID_PADDLE_Y_RO = $d41a
.const SID_V3_OSC_RO = $d41b
.const SID_V3_ENV_RO = $d41c

// initialize voice 3 of the SID to be used as a (fairly poor) RNG
.macro sid_rnd_init() {
    lda #$ff
    sta SID_V3_FREQ_LO
    sta SID_V3_FREQ_HI
    lda #SID_WAVE_NOISE
    sta SID_V3_CTRL
}
