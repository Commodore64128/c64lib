# c64lib

KickAssembler macros for C64 programming.

Mostly consist of hardware addresses and masks for the ICs in the C64 - SID, VIC etc.

I created this because most future-me has a much better chance of understanding

```
lda #COLOR_GREEN
sta VIC_COLOR_BORDER
```

than

```
lda #5
sta $d020
```

Pull requests welcome.
