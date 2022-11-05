; Disassembly of the file "C:\Users\Windows 10\Desktop\MSX\_SHINOBI\P_ROM.rom"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Wednesday, 02 of November 2022 at 04:53 PM
; 
8000 76        halt    
8001 18fd      jr      8000h
8003 320a80    ld      (800ah),a
8006 cd0c80    call    800ch
8009 3e00      ld      a,00h
800b c9        ret     

800c 78        ld      a,b
800d a7        and     a
800e c0        ret     nz

800f 79        ld      a,c
8010 a7        and     a
8011 c9        ret     

8012 cd1580    call    8015h
8015 3e75      ld      a,75h
8017 210018    ld      hl,1800h
801a cd4d00    call    004dh
801d 1800      jr      801fh
801f fe00      cp      00h
8021 c9        ret     

8022 eb        ex      de,hl
8023 cb3a      srl     d
8025 cb3a      srl     d
8027 cb3a      srl     d
8029 cb3a      srl     d
802b cb3a      srl     d
802d cd3801    call    0138h
8030 5a        ld      e,d
8031 0f        rrca    
8032 1d        dec     e
8033 c23180    jp      nz,8031h
8036 e603      and     03h
8038 4f        ld      c,a
8039 0600      ld      b,00h
803b 21c1fc    ld      hl,0fcc1h
803e 09        add     hl,bc
803f 4f        ld      c,a
8040 7e        ld      a,(hl)
8041 e680      and     80h
8043 b1        or      c
8044 4f        ld      c,a
8045 23        inc     hl
8046 23        inc     hl
8047 23        inc     hl
8048 23        inc     hl
8049 7e        ld      a,(hl)
804a 5a        ld      e,d
804b cb3f      srl     a
804d 1d        dec     e
804e c24b80    jp      nz,804bh
8051 cb27      sla     a
8053 cb27      sla     a
8055 e60c      and     0ch
8057 b1        or      c
8058 c9        ret     

8059 cd3801    call    0138h
805c 0f        rrca    
805d 0f        rrca    
805e 0f        rrca    
805f 0f        rrca    
8060 e603      and     03h
8062 4f        ld      c,a
8063 0600      ld      b,00h
8065 21c1fc    ld      hl,0fcc1h
8068 09        add     hl,bc
8069 4f        ld      c,a
806a 7e        ld      a,(hl)
806b e680      and     80h
806d b1        or      c
806e 4f        ld      c,a
806f 23        inc     hl
8070 23        inc     hl
8071 23        inc     hl
8072 23        inc     hl
8073 7e        ld      a,(hl)
8074 cb3f      srl     a
8076 cb3f      srl     a
8078 cb3f      srl     a
807a cb3f      srl     a
807c cb27      sla     a
807e cb27      sla     a
8080 e60c      and     0ch
8082 b1        or      c
8083 210040    ld      hl,4000h
8086 c32400    jp      0024h
8089 cd1580    call    8015h
808c cdc380    call    80c3h
808f 060d      ld      b,0dh
8091 cb22      sla     d
8093 cb13      rl      e
8095 cb14      rl      h
8097 cb15      rl      l
8099 10f6      djnz    8091h
809b cdca80    call    80cah
809e cdc380    call    80c3h
80a1 0611      ld      b,11h
80a3 cb3d      srl     l
80a5 cb1c      rr      h
80a7 cb1b      rr      e
80a9 cb1a      rr      d
80ab 10f6      djnz    80a3h
80ad cdca80    call    80cah
80b0 cdc380    call    80c3h
80b3 0605      ld      b,05h
80b5 cb22      sla     d
80b7 cb13      rl      e
80b9 cb14      rl      h
80bb cb15      rl      l
80bd 10f6      djnz    80b5h
80bf cdca80    call    80cah
80c2 c9        ret     

80c3 21d204    ld      hl,04d2h
80c6 112e16    ld      de,162eh
80c9 c9        ret     

80ca 3ac580    ld      a,(80c5h)
80cd ac        xor     h
80ce 32c580    ld      (80c5h),a
80d1 3ac480    ld      a,(80c4h)
80d4 ad        xor     l
80d5 32c480    ld      (80c4h),a
80d8 3ac880    ld      a,(80c8h)
80db aa        xor     d
80dc 32c880    ld      (80c8h),a
80df 3ac780    ld      a,(80c7h)
80e2 ab        xor     e
80e3 32c780    ld      (80c7h),a
80e6 c9        ret     

80e7 c9        ret     

80e8 cd1580    call    8015h
80eb f5        push    af
80ec cdf580    call    80f5h
80ef f1        pop     af
80f0 c9        ret     

80f1 c9        ret     

80f2 cd1580    call    8015h
80f5 11ff7f    ld      de,7fffh
80f8 cde631    call    31e6h
80fb e5        push    hl
80fc cd8c80    call    808ch
80ff cbbc      res     7,h
8101 eb        ex      de,hl
8102 e1        pop     hl
8103 23        inc     hl
8104 cde631    call    31e6h
8107 c9        ret     

8108 c9        ret     

8109 cd1580    call    8015h
810c cb7c      bit     7,h
810e c8        ret     z

810f 110000    ld      de,0000h
8112 eb        ex      de,hl
8113 a7        and     a
8114 ed52      sbc     hl,de
8116 c9        ret     

8117 c9        ret     

8118 cd1580    call    8015h
811b e5        push    hl
811c a7        and     a
811d ed42      sbc     hl,bc
811f cb7c      bit     7,h
8121 e1        pop     hl
8122 2803      jr      z,8127h
8124 60        ld      h,b
8125 69        ld      l,c
8126 c9        ret     

8127 e5        push    hl
8128 a7        and     a
8129 ed52      sbc     hl,de
812b cb7c      bit     7,h
812d e1        pop     hl
812e c0        ret     nz

812f eb        ex      de,hl
8130 c9        ret     

8131 c9        ret     

8132 cd1580    call    8015h
8135 f5        push    af
8136 c5        push    bc
8137 e5        push    hl
8138 210000    ld      hl,0000h
813b 0604      ld      b,04h
813d af        xor     a
813e cb25      sla     l
8140 cb14      rl      h
8142 17        rla     
8143 cb25      sla     l
8145 cb14      rl      h
8147 17        rla     
8148 cb25      sla     l
814a cb14      rl      h
814c 17        rla     
814d cb25      sla     l
814f cb14      rl      h
8151 17        rla     
8152 cd6481    call    8164h
8155 10e6      djnz    813dh
8157 3e20      ld      a,20h
8159 cdcf81    call    81cfh
815c e1        pop     hl
815d c1        pop     bc
815e f1        pop     af
815f c9        ret     

8160 c9        ret     

8161 cd1580    call    8015h
8164 fe0a      cp      0ah
8166 d26e81    jp      nc,816eh
8169 c630      add     a,30h
816b c3cf81    jp      81cfh
816e c637      add     a,37h
8170 c3cf81    jp      81cfh
8173 c9        ret     

8174 cd1580    call    8015h
8177 cdcf81    call    81cfh
817a 18fe      jr      817ah
817c c9        ret     

817d cd1580    call    8015h
8180 f5        push    af
8181 e5        push    hl
8182 3a9d81    ld      a,(819dh)
8185 21e01a    ld      hl,1ae0h
8188 cdcf81    call    81cfh
818b cd4d00    call    004dh
818e 3c        inc     a
818f 329d81    ld      (819dh),a
8192 3e20      ld      a,20h
8194 cdcf81    call    81cfh
8197 e1        pop     hl
8198 f1        pop     af
8199 c9        ret     

819a cd1580    call    8015h
819d 41        ld      b,c
819e cd1580    call    8015h
81a1 f5        push    af
81a2 2805      jr      z,81a9h
81a4 3e4e      ld      a,4eh
81a6 cdcf81    call    81cfh
81a9 3e5a      ld      a,5ah
81ab cdcf81    call    81cfh
81ae 3e20      ld      a,20h
81b0 cdcf81    call    81cfh
81b3 f1        pop     af
81b4 c9        ret     

81b5 cd1580    call    8015h
81b8 f5        push    af
81b9 3805      jr      c,81c0h
81bb 3e4e      ld      a,4eh
81bd cdcf81    call    81cfh
81c0 3e43      ld      a,43h
81c2 cdcf81    call    81cfh
81c5 3e20      ld      a,20h
81c7 cdcf81    call    81cfh
81ca f1        pop     af
81cb c9        ret     

81cc cd1580    call    8015h
81cf e5        push    hl
81d0 f5        push    af
81d1 210018    ld      hl,1800h
81d4 cd4d00    call    004dh
81d7 23        inc     hl
81d8 7c        ld      a,h
81d9 fe1b      cp      1bh
81db 3802      jr      c,81dfh
81dd 2618      ld      h,18h
81df 22d281    ld      (81d2h),hl
81e2 f1        pop     af
81e3 e1        pop     hl
81e4 c9        ret     

81e5 c9        ret     

81e6 cd1580    call    8015h
81e9 7e        ld      a,(hl)
81ea fe00      cp      00h
81ec c8        ret     z

81ed cdcf81    call    81cfh
81f0 23        inc     hl
81f1 18f6      jr      81e9h
81f3 c9        ret     

81f4 cd1580    call    8015h
81f7 210682    ld      hl,8206h
81fa cde981    call    81e9h
81fd e1        pop     hl
81fe 223981    ld      (8139h),hl
8201 cd3581    call    8135h
8204 18fe      jr      8204h
8206 75        ld      (hl),l
8207 6e        ld      l,(hl)
8208 72        ld      (hl),d
8209 65        ld      h,l
820a 61        ld      h,c
820b 63        ld      h,e
820c 68        ld      l,b
820d 00        nop     
820e c9        ret     

820f 00        nop     
8210 00        nop     
8211 00        nop     
8212 cd1580    call    8015h
8215 3ae0f3    ld      a,(0f3e0h)
8218 cbaf      res     5,a
821a 47        ld      b,a
821b 0e01      ld      c,01h
821d c34700    jp      0047h
8220 c9        ret     

8221 cd1580    call    8015h
8224 3ae0f3    ld      a,(0f3e0h)
8227 cbef      set     5,a
8229 47        ld      b,a
822a 0e01      ld      c,01h
822c c34700    jp      0047h
822f c9        ret     

8230 cd1580    call    8015h
8233 cd3e01    call    013eh
8236 cb7f      bit     7,a
8238 c9        ret     

8239 cd3382    call    8233h
823c 2807      jr      z,8245h
823e 216082    ld      hl,8260h
8241 34        inc     (hl)
8242 cd4682    call    8246h
8245 c9        ret     

8246 cd5e82    call    825eh
8249 c9        ret     

824a cd1580    call    8015h
824d 224782    ld      (8247h),hl
8250 c9        ret     

8251 cd1580    call    8015h
8254 215e82    ld      hl,825eh
8257 c34d82    jp      824dh
825a c9        ret     

825b cd1580    call    8015h
825e c9        ret     

825f c9        ret     

8260 00        nop     
8261 3e01      ld      a,01h
8263 cd5f00    call    005fh
8266 3ae0f3    ld      a,(0f3e0h)
8269 cbcf      set     1,a
826b 47        ld      b,a
826c 0e01      ld      c,01h
826e cd4700    call    0047h
8271 c9        ret     

8272 cd1580    call    8015h
8275 cd7200    call    0072h
8278 3ae0f3    ld      a,(0f3e0h)
827b cbcf      set     1,a
827d 47        ld      b,a
827e 0e01      ld      c,01h
8280 cd4700    call    0047h
8283 c9        ret     

8284 cd1580    call    8015h
8287 2efc      ld      l,0fch
8289 7e        ld      a,(hl)
828a fec9      cp      0c9h
828c c9        ret     

828d cd1580    call    8015h
8290 2100c6    ld      hl,0c600h
8293 1100da    ld      de,0da00h
8296 010001    ld      bc,0100h
8299 cd2000    call    0020h
829c d2b782    jp      nc,82b7h
829f e5        push    hl
82a0 d5        push    de
82a1 c5        push    bc
82a2 cdae82    call    82aeh
82a5 c1        pop     bc
82a6 d1        pop     de
82a7 e1        pop     hl
82a8 dab782    jp      c,82b7h
82ab 09        add     hl,bc
82ac 18eb      jr      8299h
82ae cd8782    call    8287h
82b1 2002      jr      nz,82b5h
82b3 37        scf     
82b4 c9        ret     

82b5 b7        or      a
82b6 c9        ret     

82b7 d0        ret     nc

82b8 2efc      ld      l,0fch
82ba 3631      ld      (hl),31h
82bc 23        inc     hl
82bd 36fc      ld      (hl),0fch
82bf 7c        ld      a,h
82c0 23        inc     hl
82c1 77        ld      (hl),a
82c2 23        inc     hl
82c3 36c9      ld      (hl),0c9h
82c5 2e00      ld      l,00h
82c7 37        scf     
82c8 c9        ret     

82c9 c9        ret     

82ca cd1580    call    8015h
82cd 3ec6      ld      a,0c6h
82cf feda      cp      0dah
82d1 d2ed82    jp      nc,82edh
82d4 f5        push    af
82d5 67        ld      h,a
82d6 2e00      ld      l,00h
82d8 cde782    call    82e7h
82db e3        ex      (sp),hl
82dc 7c        ld      a,h
82dd e1        pop     hl
82de 67        ld      h,a
82df 2e00      ld      l,00h
82e1 daed82    jp      c,82edh
82e4 3c        inc     a
82e5 18e8      jr      82cfh
82e7 2efc      ld      l,0fch
82e9 36c9      ld      (hl),0c9h
82eb b7        or      a
82ec c9        ret     

82ed 219ffd    ld      hl,0fd9fh
82f0 36c9      ld      (hl),0c9h
82f2 cd1582    call    8215h
82f5 c9        ret     

82f6 c9        ret     

82f7 cd1580    call    8015h
82fa 3ec6      ld      a,0c6h
82fc feda      cp      0dah
82fe d23a83    jp      nc,833ah
8301 f5        push    af
8302 67        ld      h,a
8303 2e00      ld      l,00h
8305 cd1483    call    8314h
8308 e3        ex      (sp),hl
8309 7c        ld      a,h
830a e1        pop     hl
830b 67        ld      h,a
830c 2e00      ld      l,00h
830e da3a83    jp      c,833ah
8311 3c        inc     a
8312 18e8      jr      82fch
8314 22b783    ld      (83b7h),hl
8317 cd8782    call    8287h
831a 2002      jr      nz,831eh
831c b7        or      a
831d c9        ret     

831e cd5483    call    8354h
8321 210000    ld      hl,0000h
8324 22b783    ld      (83b7h),hl
8327 3a5083    ld      a,(8350h)
832a fe00      cp      00h
832c 2002      jr      nz,8330h
832e b7        or      a
832f c9        ret     

8330 67        ld      h,a
8331 cd3e83    call    833eh
8334 af        xor     a
8335 325083    ld      (8350h),a
8338 b7        or      a
8339 c9        ret     

833a c9        ret     

833b cd1580    call    8015h
833e 3ab883    ld      a,(83b8h)
8341 bc        cp      h
8342 2805      jr      z,8349h
8344 2efc      ld      l,0fch
8346 36c9      ld      (hl),0c9h
8348 c9        ret     

8349 325083    ld      (8350h),a
834c c9        ret     

834d cd1580    call    8015h
8350 00        nop     
8351 cd1580    call    8015h
8354 ed736f83  ld      (836fh),sp
8358 2ab783    ld      hl,(83b7h)
835b 2efc      ld      l,0fch
835d e9        jp      (hl)
835e c9        ret     

835f cd1580    call    8015h
8362 2ab783    ld      hl,(83b7h)
8365 2efd      ld      l,0fdh
8367 226c83    ld      (836ch),hl
836a ed730000  ld      (0000h),sp
836e 310000    ld      sp,0000h
8371 c33982    jp      8239h
8374 c9        ret     

8375 cd1580    call    8015h
8378 2ab783    ld      hl,(83b7h)
837b 2efc      ld      l,0fch
837d 36c9      ld      (hl),0c9h
837f 18ed      jr      836eh
8381 c9        ret     

8382 cd1580    call    8015h
8385 ed739d83  ld      (839dh),sp
8389 2efd      ld      l,0fdh
838b 229a83    ld      (839ah),hl
838e 229383    ld      (8393h),hl
8391 ed7b0000  ld      sp,(0000h)
8395 c30000    jp      0000h
8398 ed730000  ld      (0000h),sp
839c 310000    ld      sp,0000h
839f c9        ret     

83a0 cd1580    call    8015h
83a3 e5        push    hl
83a4 21af83    ld      hl,83afh
83a7 229683    ld      (8396h),hl
83aa e1        pop     hl
83ab cd8583    call    8385h
83ae c9        ret     

83af c5        push    bc
83b0 c39883    jp      8398h
83b3 c9        ret     

83b4 cd1580    call    8015h
83b7 00        nop     
83b8 00        nop     
83b9 cd1580    call    8015h


83bc cd5e82    call    825eh
83bf 3a6082    ld      a,(8260h)
83c2 f5        push    af
83c3 cdfa82    call    82fah
83c6 cd5e82    call    825eh
83c9 f1        pop     af
83ca 216082    ld      hl,8260h
83cd be        cp      (hl)
83ce 2007      jr      nz,83d7h
83d0 f5        push    af
83d1 cd3982    call    8239h
83d4 f1        pop     af
83d5 18f3      jr      83cah
83d7 18e3      jr      83bch
83d9 c9        ret     

83da 00        nop     
83db 00        nop     
83dc 00        nop     
83dd 00        nop     
83de 00        nop     
83df 00        nop     
83e0 00        nop     
83e1 00        nop     
83e2 00        nop     
83e3 00        nop     
83e4 00        nop     
83e5 00        nop     
83e6 e1        pop     hl
83e7 e5        push    hl
83e8 c9        ret     

83e9 21adde    ld      hl,0deadh
83ec 223981    ld      (8139h),hl
83ef cd3581    call    8135h
83f2 e5        push    hl
83f3 2ada83    ld      hl,(83dah)
83f6 223981    ld      (8139h),hl
83f9 cd3581    call    8135h
83fc e1        pop     hl
83fd e5        push    hl
83fe 2ade83    ld      hl,(83deh)
8401 223981    ld      (8139h),hl
8404 cd3581    call    8135h
8407 e1        pop     hl
8408 e5        push    hl
8409 2ae083    ld      hl,(83e0h)
840c 223981    ld      (8139h),hl
840f cd3581    call    8135h
8412 e1        pop     hl
8413 e5        push    hl
8414 2ae283    ld      hl,(83e2h)
8417 223981    ld      (8139h),hl
841a cd3581    call    8135h
841d e1        pop     hl
841e e5        push    hl
841f 2adc83    ld      hl,(83dch)
8422 223981    ld      (8139h),hl
8425 cd3581    call    8135h
8428 e1        pop     hl
8429 e5        push    hl
842a 2ae483    ld      hl,(83e4h)
842d 223981    ld      (8139h),hl
8430 cd3581    call    8135h
8433 e1        pop     hl
8434 cd0080    call    8000h
8437 cd1580    call    8015h
843a e1        pop     hl
843b 226484    ld      (8464h),hl
843e e1        pop     hl
843f 229683    ld      (8396h),hl
8442 326284    ld      (8462h),a
8445 cd9082    call    8290h
8448 301c      jr      nc,8466h
844a e5        push    hl
844b cd8583    call    8385h
844e e1        pop     hl
844f 7c        ld      a,h
8450 c1        pop     bc
8451 0c        inc     c
8452 0d        dec     c
8453 280b      jr      z,8460h
8455 e1        pop     hl
8456 67        ld      h,a
8457 225c84    ld      (845ch),hl
845a e1        pop     hl
845b 225e84    ld      (845eh),hl
845e 18f2      jr      8452h
8460 67        ld      h,a
8461 3e00      ld      a,00h
8463 c30000    jp      0000h
8466 c1        pop     bc
8467 41        ld      b,c
8468 0c        inc     c
8469 0d        dec     c
846a 2804      jr      z,8470h
846c e1        pop     hl
846d e1        pop     hl
846e 18f9      jr      8469h
8470 210000    ld      hl,0000h
8473 18ec      jr      8461h
8475 c9        ret     

8476 00        nop     
8477 cd1580    call    8015h
847a 00        nop     
847b 00        nop     
847c 017c84    ld      bc,847ch
847f c5        push    bc
8480 010000    ld      bc,0000h
8483 c5        push    bc
8484 cd1580    call    8015h
8487 3ab883    ld      a,(83b8h)
848a 327684    ld      (8476h),a
848d 329284    ld      (8492h),a
8490 2af800    ld      hl,(00f8h)
8493 229784    ld      (8497h),hl
8496 cd9984    call    8499h
8499 3a7684    ld      a,(8476h)
849c c9        ret     

849d cd1580    call    8015h
84a0 7c        ld      a,h
84a1 fec6      cp      0c6h
84a3 3806      jr      c,84abh
84a5 feda      cp      0dah
84a7 3002      jr      nc,84abh
84a9 37        scf     
84aa c9        ret     

84ab a7        and     a
84ac c9        ret     

84ad cd1580    call    8015h
84b0 32b584    ld      (84b5h),a
84b3 2afa00    ld      hl,(00fah)
84b6 c3c984    jp      84c9h
84b9 c9        ret     

84ba cd1580    call    8015h
84bd 2b        dec     hl
84be 2b        dec     hl
84bf 22c384    ld      (84c3h),hl
84c2 2a0000    ld      hl,(0000h)
84c5 c9        ret     

84c6 cd1580    call    8015h
84c9 e7        rst     20h
84ca c8        ret     z

84cb cdbd84    call    84bdh
84ce d5        push    de
84cf 110000    ld      de,0000h
84d2 e7        rst     20h
84d3 d1        pop     de
84d4 20f3      jr      nz,84c9h
84d6 e7        rst     20h
84d7 c9        ret     

84d8 cd1580    call    8015h
84db 7c        ld      a,h
84dc 84        add     a,h
84dd 01dd84    ld      bc,84ddh
84e0 c5        push    bc
84e1 010000    ld      bc,0000h
84e4 c5        push    bc
84e5 016400    ld      bc,0064h
84e8 c5        push    bc
84e9 016400    ld      bc,0064h
84ec c5        push    bc
84ed 010000    ld      bc,0000h
84f0 c5        push    bc
84f1 010200    ld      bc,0002h
84f4 c5        push    bc
84f5 cd1580    call    8015h
84f8 21001b    ld      hl,1b00h
84fb cd5300    call    0053h
84fe 3ec6      ld      a,0c6h
8500 feda      cp      0dah
8502 d24d85    jp      nc,854dh
8505 f5        push    af
8506 67        ld      h,a
8507 2e00      ld      l,00h
8509 cd1885    call    8518h
850c e3        ex      (sp),hl
850d 7c        ld      a,h
850e e1        pop     hl
850f 67        ld      h,a
8510 2e00      ld      l,00h
8512 da4d85    jp      c,854dh
8515 3c        inc     a
8516 18e8      jr      8500h
8518 7c        ld      a,h
8519 322785    ld      (8527h),a
851c 323385    ld      (8533h),a
851f 323f85    ld      (853fh),a
8522 324885    ld      (8548h),a
8525 2af400    ld      hl,(00f4h)
8528 cb3c      srl     h
852a cb1d      rr      l
852c 7d        ld      a,l
852d d608      sub     08h
852f d398      out     (98h),a
8531 2af600    ld      hl,(00f6h)
8534 cb3c      srl     h
8536 cb1d      rr      l
8538 7d        ld      a,l
8539 d608      sub     08h
853b d398      out     (98h),a
853d 3af200    ld      a,(00f2h)
8540 cb27      sla     a
8542 cb27      sla     a
8544 d398      out     (98h),a
8546 3af000    ld      a,(00f0h)
8549 d398      out     (98h),a
854b b7        or      a
854c c9        ret     

854d c9        ret     

854e cd1580    call    8015h
8551 cd7785    call    8577h
8554 3a8585    ld      a,(8585h)
8557 fe01      cp      01h
8559 2006      jr      nz,8561h
855b 3e13      ld      a,13h
855d 328585    ld      (8585h),a
8560 c9        ret     

8561 3e01      ld      a,01h
8563 328585    ld      (8585h),a
8566 3a7e85    ld      a,(857eh)
8569 3c        inc     a
856a feda      cp      0dah
856c 3802      jr      c,8570h
856e d614      sub     14h
8570 327e85    ld      (857eh),a
8573 c9        ret     

8574 cd1580    call    8015h
8577 21001b    ld      hl,1b00h
857a cd5300    call    0053h
857d 3ec6      ld      a,0c6h
857f 0614      ld      b,14h
8581 cd9685    call    8596h
8584 c601      add     a,01h
8586 feda      cp      0dah
8588 3802      jr      c,858ch
858a d614      sub     14h
858c 10f3      djnz    8581h
858e 3ed0      ld      a,0d0h
8590 d398      out     (98h),a
8592 c9        ret     

8593 cd1580    call    8015h
8596 f5        push    af
8597 32ab85    ld      (85abh),a
859a 32b785    ld      (85b7h),a
859d 32c385    ld      (85c3h),a
85a0 32cc85    ld      (85cch),a
85a3 67        ld      h,a
85a4 cd8782    call    8287h
85a7 2826      jr      z,85cfh
85a9 2af400    ld      hl,(00f4h)
85ac cb3c      srl     h
85ae cb1d      rr      l
85b0 7d        ld      a,l
85b1 d608      sub     08h
85b3 d398      out     (98h),a
85b5 2af600    ld      hl,(00f6h)
85b8 cb3c      srl     h
85ba cb1d      rr      l
85bc 7d        ld      a,l
85bd d608      sub     08h
85bf d398      out     (98h),a
85c1 3af200    ld      a,(00f2h)
85c4 cb27      sla     a
85c6 cb27      sla     a
85c8 d398      out     (98h),a
85ca 3af000    ld      a,(00f0h)
85cd d398      out     (98h),a
85cf f1        pop     af
85d0 c9        ret     

85d1 a7        and     a
85d2 ed52      sbc     hl,de
85d4 2004      jr      nz,85dah
85d6 21ffff    ld      hl,0ffffh
85d9 c9        ret     

85da 210000    ld      hl,0000h
85dd c9        ret     

85de a7        and     a
85df ed52      sbc     hl,de
85e1 2804      jr      z,85e7h
85e3 21ffff    ld      hl,0ffffh
85e6 c9        ret     

85e7 210000    ld      hl,0000h
85ea c9        ret     

85eb a7        and     a
85ec ed52      sbc     hl,de
85ee 2004      jr      nz,85f4h
85f0 210000    ld      hl,0000h
85f3 c9        ret     

85f4 cb7c      bit     7,h
85f6 2004      jr      nz,85fch
85f8 21ffff    ld      hl,0ffffh
85fb c9        ret     

85fc 210000    ld      hl,0000h
85ff c9        ret     

8600 a7        and     a
8601 ed52      sbc     hl,de
8603 cb7c      bit     7,h
8605 2804      jr      z,860bh
8607 21ffff    ld      hl,0ffffh
860a c9        ret     

860b 210000    ld      hl,0000h
860e c9        ret     

860f a7        and     a
8610 ed52      sbc     hl,de
8612 2004      jr      nz,8618h
8614 21ffff    ld      hl,0ffffh
8617 c9        ret     

8618 cb7c      bit     7,h
861a 2004      jr      nz,8620h
861c 21ffff    ld      hl,0ffffh
861f c9        ret     

8620 210000    ld      hl,0000h
8623 c9        ret     

8624 a7        and     a
8625 ed52      sbc     hl,de
8627 2004      jr      nz,862dh
8629 21ffff    ld      hl,0ffffh
862c c9        ret     

862d cb7c      bit     7,h
862f 2804      jr      z,8635h
8631 21ffff    ld      hl,0ffffh
8634 c9        ret     

8635 210000    ld      hl,0000h
8638 c9        ret     

8639 324086    ld      (8640h),a
863c cd4286    call    8642h
863f 3e00      ld      a,00h
8641 c9        ret     

8642 3e00      ld      a,00h
8644 bc        cp      h
8645 c0        ret     nz

8646 bd        cp      l
8647 c9        ret     

8648 cd1580    call    8015h
864b cd3986    call    8639h
864e ca5586    jp      z,8655h
8651 210000    ld      hl,0000h
8654 c9        ret     

8655 21ffff    ld      hl,0ffffh
8658 c9        ret     


; scan controllers 
;
8659 cd1580    call    8015h ; marker ??
; save last scan
865c 21b986    ld      hl,86b9h    ; transfer last reading to 86c9h 
865f 11c986    ld      de,86c9h
8662 010d00    ld      bc,000dh
8665 edb0      ldir                 ; 

; perform new scan in controllers and keyboard
8667 3e00      ld      a,00h
8669 21b986    ld      hl,86b9h      ; address of present keyboard scan - 11 lines

; save the contents of keyboard matrix       -> 86b9h to                        
866c f5        push    af            ; save current line number
866d cd4101    call    0141h         ; read keyboard
8670 eeff      xor     0ffh          ; invert bits
8672 77        ld      (hl),a        ; 
8673 f1        pop     af
8674 23        inc     hl
8675 3c        inc     a
8676 fe0b      cp      0bh
8678 38f2      jr      c,866ch

; read the contents of joystick 1 and 2
867a 3e01      ld      a,01h
867c cd8b86    call    868bh
867f 72        ld      (hl),d
8680 23        inc     hl
8681 3e02      ld      a,02h
8683 cd8b86    call    868bh
8686 72        ld      (hl),d
8687 c9        ret     

8688 cd1580    call    8015h

; read joystick
868b e5        push    hl      ; save destiny address   
868c 5f        ld      e,a     ; save which joystick port to be read
868d d5        push    de
868e cdd500    call    00d5h   ; GTSTCK read joystick return position as 0..8 range
8691 d1        pop     de       
                               ; convert 0..8 into equivalent line of matrix keyboard line 8
							   ; RIGHT DOWN  UP  LEFT DEL INS HOME SPACE 
8692 4f        ld      c,a     ;  table index in range 0--8
8693 0600      ld      b,00h
8695 21d986    ld      hl,86d9h ; table address
8698 09        add     hl,bc    
8699 56        ld      d,(hl)  ; transform 0..8 into   RIGHT DOWN UP  LEFT  0   0   0   0 , active HIGH
869a 7b        ld      a,e     ; restore which joystick port to be read (same as trigger A)
869b d5        push    de

869c cdd800    call    00d8h   ; GTTRIG read trigger A for current joystick port 
869f d1        pop     de
86a0 fe00      cp      00h     ; button A pressed?
86a2 2802      jr      z,86a6h ; no check button B
86a4 cbc2      set     0,d     ; yes, set bit 0 (equivalent to SPACE)
86a6 7b        ld      a,e     ; restore which joystick port to be read (same as trigger A)
86a7 3c        inc     a
86a8 3c        inc     a       ; increment twice to get the number of Trigger B
86a9 d5        push    de
86aa cdd800    call    00d8h   ; read trigger B for current joystick port 
86ad d1        pop     de
86ae fe00      cp      00h     ; is pressed ?
86b0 2802      jr      z,86b4h ; no, skip 
86b2 cbca      set     1,d     ; yes, set bit 1 (equivalent to HOME)
86b4 e1        pop     hl
86b5 c9        ret     

86b6 cd1580    call    8015h
; present reading of keyboard and joysticks    
86b9 00        nop     ; kbd  row 00  7  6  5  4  3  2  1  0
86ba 00        nop     ; kbd  row 01  ;  ]  [  \  =  -  9  8
86bb 00        nop     ; kbd  row 02  B  A  £  /  .  ,  `  ' 
86bc 00        nop     ; kbd  row 03  J  I  H  G  F  E  D  C 
86bd 00        nop     ; kbd  row 04  R  Q  P  O  N  M  L  K
86be 00        nop     ; kbd  row 05  Z  Y  X  W  V  U  T  S
86bf 00        nop     ; kbd  row 06  F3 F2 F1 CD CP GR CT SH  
86c0 00        nop     ; kbd  row 07  CR SL BS ST TB ES F5 F4
86c1 00        nop     ; kbd  row 08  RG DW UP LF DL IN HP SP
86c2 00        nop     ; kbd  row 09  4  3  2  1  0
86c3 00        nop     ; kbd  row 0a  .  ,  -  9  8  7  6  5
86c4 00        nop     ; Joystick 01  RG DW UP LF 0  0  TB TA
86c5 00        nop     ; Joystick 02  RG DW UP LF 0  0  TB TA
86c6 cd1580    call    8015h
; last reading of keyboard and joysticks
86c9 00        nop     
86ca 00        nop     
86cb 00        nop     
86cc 00        nop     
86cd 00        nop     
86ce 00        nop     
86cf 00        nop     
86d0 00        nop     
86d1 00        nop     
86d2 00        nop     
86d3 00        nop     
86d4 00        nop     
86d5 00        nop     
86d6 cd1580    call    8015h

; table for converting the data 
;          IN  ->  RG DW UP LF 0  0  0  0
86d9 00  ;  0      0  0  0  0  0  0  0  0       
86da 20  ;  1  N   0  0  1  0  0  0  0  0   
89db a0  ;  2  NE  1  0  1  0  0  0  0  0       
86dc 80  ;  3  E   1  0  0  0  0  0  0  0       
86dd c0  ;  4  SE  1  1  0  0  0  0  0  0       
86de 40  ;  5  S   0  1  0  0  0  0  0  0       
86df 50  ;  6  SW  0  1  0  1  0  0  0  0      
86e0 10  ;  7  W   0  0  0  1  0  0  0  0    
86e1 30  ;  8  NW  0  0  1  1  0  0  0  0        
  ; end of table



86e2 cd1580    call    8015h
86e5 eb        ex      de,hl
86e6 21b986    ld      hl,86b9h
86e9 cdff86    call    86ffh
86ec 210000    ld      hl,0000h
86ef c8        ret     z

86f0 21c986    ld      hl,86c9h
86f3 cdff86    call    86ffh
86f6 210100    ld      hl,0001h
86f9 c8        ret     z

86fa 23        inc     hl
86fb c9        ret     

86fc cd1580    call    8015h
86ff d5        push    de
8700 7a        ld      a,d
8701 1600      ld      d,00h
8703 19        add     hl,de
8704 a6        and     (hl)
8705 d1        pop     de
8706 c9        ret     

8707 cd1580    call    8015h
870a f5        push    af
870b cde586    call    86e5h
870e f1        pop     af
870f c9        ret     

8710 cd1580    call    8015h

; Process players movement data from keyboard and joystick
;
8713 fe00      cp      00h
8715 200f      jr      nz,8726h
8717 3ac186    ld      a,(86c1h) ; present kbd matrix line 08  RG DW UP LF DL IN HP SP
871a cb7f      bit     7,a       ; is key RIGHT pressed ? 
871c c0        ret     nz

871d cb67      bit     4,a       ; is key LEFT pressed ?
871f c20f81    jp      nz,810fh
8722 210000    ld      hl,0000h
8725 c9        ret     

8726 fe01      cp      01h         ; player on joystick port 1
8728 200f      jr      nz,8739h
872a 3ac486    ld      a,(86c4h)    ; present Joystick 01  - RG DW UP LF 0  0  TB TA
872d cb7f      bit     7,a          ; is RIGHT pressed ?
872f c0        ret     nz

8730 cb67      bit     4,a          ; is key LEFT pressed ?
8732 c20f81    jp      nz,810fh
8735 210000    ld      hl,0000h
8738 c9        ret     

8739 fe02      cp      02h          ; player on joystick port 2  
873b 200f      jr      nz,874ch    
873d 3ac586    ld      a,(86c5h)     ; present Joystick 01  - RG DW UP LF 0  0  TB TA
8740 cb7f      bit     7,a           ; is RIGHT pressed ?
8742 c0        ret     nz          

8743 cb67      bit     4,a           ; is key LEFT pressed ?
8745 c20f81    jp      nz,810fh
8748 210000    ld      hl,0000h
874b c9        ret     

874c 3abc86    ld      a,(86bch) ; present kbd matrix line 03  J  I  H  G  F  E  D  C 
874f cb4f      bit     1,a       ; is key D pressed (left)
8751 c0        ret     nz

8752 3abb86    ld      a,(86bbh) ; present kbd matrix line 02  B  A  £  /  .  ,  `  ' 
8755 cb77      bit     6,a       ; is key A pressed ?
8757 c20f81    jp      nz,810fh
875a 210000    ld      hl,0000h
875d c9        ret     

875e cd1580    call    8015h
8761 fe00      cp      00h
8763 200f      jr      nz,8774h
8765 3ac186    ld      a,(86c1h) ; present kbd matrix line 08  RG DW UP LF DL IN HP SP
8768 cb77      bit     6,a       ; is key DOWN pressed ?
876a c0        ret     nz

876b cb6f      bit     5,a       ; is key RIGHT pressed? 
876d c20f81    jp      nz,810fh
8770 210000    ld      hl,0000h
8773 c9        ret     

8774 fe01      cp      01h
8776 200f      jr      nz,8787h
8778 3ac486    ld      a,(86c4h)   ; present Joystick 01  - RG DW UP LF 0  0  TB TA
877b cb77      bit     6,a         ; is DOWN pressed ?
877d c0        ret     nz

877e cb6f      bit     5,a         ; is UP pressed ?
8780 c20f81    jp      nz,810fh
8783 210000    ld      hl,0000h
8786 c9        ret     

8787 fe02      cp      02h
8789 200f      jr      nz,879ah
878b 3ac586    ld      a,(86c5h)    ; present Joystick 02  - RG DW UP LF 0  0  TB TA
878e cb77      bit     6,a          ; is DOWN pressed ?
8790 c0        ret     nz

8791 cb6f      bit     5,a          ; is UP pressed ?
8793 c20f81    jp      nz,810fh
8796 210000    ld      hl,0000h
8799 c9        ret     

879a 3abe86    ld      a,(86beh)  ; present kbd matrix line 05  Z  Y  X  W  V  U  T  S
879d cb47      bit     0,a        ; is S pressed (down)?
879f c0        ret     nz

87a0 cb67      bit     4,a        ; is W pressed (up)? 
87a2 c20f81    jp      nz,810fh
87a5 210000    ld      hl,0000h
87a8 c9        ret     

87a9 cd1580    call    8015h
87ac dd84      add     a,ixh
87ae 01ae87    ld      bc,87aeh
87b1 c5        push    bc
87b2 01e987    ld      bc,87e9h
87b5 c5        push    bc
87b6 010000    ld      bc,0000h
87b9 c5        push    bc
87ba 0100fc    ld      bc,0fc00h
87bd c5        push    bc
87be 010000    ld      bc,0000h
87c1 c5        push    bc
87c2 010300    ld      bc,0003h
87c5 c5        push    bc
87c6 011788    ld      bc,8817h
87c9 c5        push    bc
87ca 01f687    ld      bc,87f6h
87cd c5        push    bc
87ce 011888    ld      bc,8818h
87d1 c5        push    bc
87d2 014f88    ld      bc,884fh
87d5 c5        push    bc
87d6 016588    ld      bc,8865h
87d9 c5        push    bc
87da 01c188    ld      bc,88c1h
87dd c5        push    bc
87de 013b88    ld      bc,883bh
87e1 c5        push    bc
87e2 018784    ld      bc,8487h
87e5 c5        push    bc
87e6 c39883    jp      8398h
87e9 dde5      push    ix
87eb dd210000  ld      ix,0000h
87ef dd39      add     ix,sp
87f1 ddf9      ld      sp,ix
87f3 dde1      pop     ix
87f5 c9        ret     

87f6 32fb87    ld      (87fbh),a
87f9 2aee00    ld      hl,(00eeh)
87fc 220088    ld      (8800h),hl
87ff cd0288    call    8802h
8802 3a7684    ld      a,(8476h)
8805 3a7684    ld      a,(8476h)
8808 f5        push    af
8809 dde5      push    ix
880b cd6283    call    8362h
880e dde1      pop     ix
8810 e3        ex      (sp),hl
8811 7c        ld      a,h
8812 e1        pop     hl
8813 327684    ld      (8476h),a
8816 c9        ret     

8817 c9        ret     

8818 321d88    ld      (881dh),a
881b 2af600    ld      hl,(00f6h)
881e cb4c      bit     1,h
8820 2014      jr      nz,8836h
8822 322788    ld      (8827h),a
8825 2af400    ld      hl,(00f4h)
8828 118001    ld      de,0180h
882b e7        rst     20h
882c 3a7684    ld      a,(8476h)
882f 3005      jr      nc,8836h
8831 210000    ld      hl,0000h
8834 af        xor     a
8835 c9        ret     

8836 210100    ld      hl,0001h
8839 37        scf     
883a c9        ret     

883b 324088    ld      (8840h),a
883e 2aec00    ld      hl,(00ech)
8841 224588    ld      (8845h),hl
8844 cd4788    call    8847h
8847 3a7684    ld      a,(8476h)
884a 18ef      jr      883bh
884c cd1580    call    8015h
884f dde5      push    ix
8851 dd210000  ld      ix,0000h
8855 dd39      add     ix,sp
8857 67        ld      h,a
8858 f5        push    af
8859 cd3e83    call    833eh
885c f1        pop     af
885d ddf9      ld      sp,ix
885f dde1      pop     ix
8861 c9        ret     

8862 cd1580    call    8015h
8865 dde5      push    ix
8867 dd210000  ld      ix,0000h
886b dd39      add     ix,sp
886d dd6e04    ld      l,(ix+04h)
8870 dd6605    ld      h,(ix+05h)
8873 44        ld      b,h
8874 4d        ld      c,l
8875 cd0380    call    8003h
8878 ca9d88    jp      z,889dh
887b c5        push    bc
887c cd8c88    call    888ch
887f c1        pop     bc
8880 da9d88    jp      c,889dh
8883 0b        dec     bc
8884 cd0380    call    8003h
8887 20f2      jr      nz,887bh
8889 c39d88    jp      889dh
888c 329188    ld      (8891h),a
888f 2aec00    ld      hl,(00ech)
8892 229688    ld      (8896h),hl
8895 cd9888    call    8898h
8898 3a7684    ld      a,(8476h)
889b b7        or      a
889c c9        ret     

889d ddf9      ld      sp,ix
889f dde1      pop     ix
88a1 d9        exx     
88a2 c1        pop     bc
88a3 33        inc     sp
88a4 33        inc     sp
88a5 c5        push    bc
88a6 d9        exx     
88a7 c9        ret     

88a8 cd1580    call    8015h
88ab 32b088    ld      (88b0h),a
88ae 2af600    ld      hl,(00f6h)
88b1 220589    ld      (8905h),hl
88b4 32b988    ld      (88b9h),a
88b7 2af400    ld      hl,(00f4h)
88ba 221889    ld      (8918h),hl
88bd c9        ret     

88be cd1580    call    8015h
88c1 dde5      push    ix
88c3 dd210000  ld      ix,0000h
88c7 dd39      add     ix,sp
88c9 cdab88    call    88abh
88cc dd6e04    ld      l,(ix+04h)
88cf dd6605    ld      h,(ix+05h)
88d2 cda084    call    84a0h
88d5 3803      jr      c,88dah
88d7 cd1580    call    8015h
88da 3a7684    ld      a,(8476h)
88dd cdf888    call    88f8h
88e0 3805      jr      c,88e7h
88e2 210000    ld      hl,0000h
88e5 1803      jr      88eah
88e7 21ffff    ld      hl,0ffffh
88ea ddf9      ld      sp,ix
88ec dde1      pop     ix
88ee d9        exx     
88ef c1        pop     bc
88f0 33        inc     sp
88f1 33        inc     sp
88f2 c5        push    bc
88f3 d9        exx     
88f4 c9        ret     

88f5 cd1580    call    8015h
88f8 f5        push    af
88f9 7c        ld      a,h
88fa 320389    ld      (8903h),a
88fd 321689    ld      (8916h),a
8900 f1        pop     af
8901 2af600    ld      hl,(00f6h)
8904 010000    ld      bc,0000h
8907 a7        and     a
8908 ed42      sbc     hl,bc
890a cd0c81    call    810ch
890d 011000    ld      bc,0010h
8910 a7        and     a
8911 ed42      sbc     hl,bc
8913 d0        ret     nc

8914 2af400    ld      hl,(00f4h)
8917 010000    ld      bc,0000h
891a a7        and     a
891b ed42      sbc     hl,bc
891d cd0c81    call    810ch
8920 011000    ld      bc,0010h
8923 a7        and     a
8924 ed42      sbc     hl,bc
8926 c9        ret     

8927 cd1580    call    8015h
892a 3a7684    ld      a,(8476h)
892d f5        push    af
892e 3ec6      ld      a,0c6h
8930 feda      cp      0dah
8932 d26189    jp      nc,8961h
8935 f5        push    af
8936 67        ld      h,a
8937 2e00      ld      l,00h
8939 cd4889    call    8948h
893c e3        ex      (sp),hl
893d 7c        ld      a,h
893e e1        pop     hl
893f 67        ld      h,a
8940 2e00      ld      l,00h
8942 da6189    jp      c,8961h
8945 3c        inc     a
8946 18e8      jr      8930h
8948 cd8782    call    8287h
894b 2002      jr      nz,894fh
894d b7        or      a
894e c9        ret     

894f 7c        ld      a,h
8950 327684    ld      (8476h),a
8953 325889    ld      (8958h),a
8956 2ae800    ld      hl,(00e8h)
8959 225d89    ld      (895dh),hl
895c cd5f89    call    895fh
895f b7        or      a
8960 c9        ret     

8961 e3        ex      (sp),hl
8962 7c        ld      a,h
8963 e1        pop     hl
8964 327684    ld      (8476h),a
8967 c9        ret     

8968 cd1580    call    8015h
896b cb23      sla     e
896d cb12      rl      d
896f cb23      sla     e
8971 cb12      rl      d
8973 cb23      sla     e
8975 cb12      rl      d
8977 cb23      sla     e
8979 cb12      rl      d
897b cb23      sla     e
897d cb12      rl      d
897f 19        add     hl,de
8980 110018    ld      de,1800h
8983 19        add     hl,de
8984 c9        ret     

8985 cd1580    call    8015h
8988 cd6b89    call    896bh
898b cd4d00    call    004dh
898e c9        ret     

898f cd1580    call    8015h
8992 cd6b89    call    896bh
8995 cd4a00    call    004ah
8998 c9        ret     

8999 cd1580    call    8015h
899c cb3c      srl     h
899e cb1d      rr      l
89a0 7d        ld      a,l
89a1 cb3f      srl     a
89a3 cb3f      srl     a
89a5 cb3f      srl     a
89a7 f5        push    af
89a8 eb        ex      de,hl
89a9 cb3c      srl     h
89ab cb1d      rr      l
89ad 7d        ld      a,l
89ae cb3f      srl     a
89b0 cb3f      srl     a
89b2 cb3f      srl     a
89b4 1600      ld      d,00h
89b6 5f        ld      e,a
89b7 e1        pop     hl
89b8 6c        ld      l,h
89b9 2600      ld      h,00h
89bb cd6b89    call    896bh
89be c9        ret     

89bf cd1580    call    8015h
89c2 cd9c89    call    899ch
89c5 cd4a00    call    004ah
89c8 c9        ret     

89c9 cd1580    call    8015h
89cc f5        push    af
89cd cd9c89    call    899ch
89d0 f1        pop     af
89d1 cd4d00    call    004dh
89d4 c9        ret     

89d5 cd1580    call    8015h
89d8 cd6b89    call    896bh
89db 22d281    ld      (81d2h),hl
89de c9        ret     

89df 00        nop     
89e0 00        nop     
89e1 00        nop     
89e2 00        nop     
89e3 00        nop     
89e4 00        nop     
89e5 00        nop     
89e6 00        nop     
89e7 00        nop     
89e8 00        nop     
89e9 00        nop     
89ea 00        nop     
89eb 00        nop     
89ec 00        nop     
89ed 00        nop     
89ee 00        nop     
89ef 00        nop     
89f0 00        nop     
89f1 00        nop     
89f2 00        nop     
89f3 00        nop     
89f4 00        nop     
89f5 00        nop     
89f6 00        nop     
89f7 00        nop     
89f8 00        nop     
89f9 00        nop     
89fa 00        nop     
89fb 00        nop     
89fc 00        nop     
89fd 00        nop     
89fe 00        nop     
89ff 00        nop     
8a00 00        nop     
8a01 00        nop     
8a02 00        nop     
8a03 00        nop     
8a04 00        nop     
8a05 00        nop     
8a06 00        nop     
8a07 00        nop     
8a08 00        nop     
8a09 00        nop     
8a0a 00        nop     
8a0b 00        nop     
8a0c 00        nop     
8a0d 00        nop     
8a0e 00        nop     
8a0f 00        nop     
8a10 00        nop     
8a11 00        nop     
8a12 00        nop     
8a13 00        nop     
8a14 00        nop     
8a15 00        nop     
8a16 00        nop     
8a17 00        nop     
8a18 00        nop     
8a19 00        nop     
8a1a 00        nop     
8a1b 00        nop     
8a1c 00        nop     
8a1d 00        nop     
8a1e 00        nop     
8a1f 00        nop     
8a20 00        nop     
8a21 00        nop     
8a22 00        nop     
8a23 00        nop     
8a24 00        nop     
8a25 00        nop     
8a26 00        nop     
8a27 00        nop     
8a28 00        nop     
8a29 00        nop     
8a2a 00        nop     
8a2b 00        nop     
8a2c 00        nop     
8a2d 00        nop     
8a2e 00        nop     
8a2f 00        nop     
8a30 00        nop     
8a31 00        nop     
8a32 00        nop     
8a33 00        nop     
8a34 00        nop     
8a35 00        nop     
8a36 00        nop     
8a37 00        nop     
8a38 00        nop     
8a39 00        nop     
8a3a 00        nop     
8a3b 00        nop     
8a3c 00        nop     
8a3d 00        nop     
8a3e 00        nop     
8a3f 00        nop     
8a40 00        nop     
8a41 00        nop     
8a42 00        nop     
8a43 00        nop     
8a44 00        nop     
8a45 00        nop     
8a46 00        nop     
8a47 00        nop     
8a48 00        nop     
8a49 00        nop     
8a4a 00        nop     
8a4b 00        nop     
8a4c 00        nop     
8a4d 00        nop     
8a4e 00        nop     
8a4f 00        nop     
8a50 00        nop     
8a51 00        nop     
8a52 00        nop     
8a53 00        nop     
8a54 00        nop     
8a55 00        nop     
8a56 00        nop     
8a57 00        nop     
8a58 00        nop     
8a59 00        nop     
8a5a 00        nop     
8a5b 00        nop     
8a5c 00        nop     
8a5d 00        nop     
8a5e 00        nop     
8a5f 00        nop     
8a60 00        nop     
8a61 00        nop     
8a62 00        nop     
8a63 00        nop     
8a64 00        nop     
8a65 00        nop     
8a66 00        nop     
8a67 00        nop     
8a68 00        nop     
8a69 00        nop     
8a6a 00        nop     
8a6b 00        nop     
8a6c 00        nop     
8a6d 00        nop     
8a6e 00        nop     
8a6f 00        nop     
8a70 00        nop     
8a71 00        nop     
8a72 00        nop     
8a73 00        nop     
8a74 00        nop     
8a75 00        nop     
8a76 00        nop     
8a77 00        nop     
8a78 00        nop     
8a79 00        nop     
8a7a 00        nop     
8a7b 00        nop     
8a7c 00        nop     
8a7d 00        nop     
8a7e 00        nop     
8a7f 00        nop     
8a80 00        nop     
8a81 00        nop     
8a82 00        nop     
8a83 00        nop     
8a84 00        nop     
8a85 00        nop     
8a86 00        nop     
8a87 00        nop     
8a88 00        nop     
8a89 00        nop     
8a8a 00        nop     
8a8b 00        nop     
8a8c 00        nop     
8a8d 00        nop     
8a8e 00        nop     
8a8f 00        nop     
8a90 00        nop     
8a91 00        nop     
8a92 00        nop     
8a93 00        nop     
8a94 00        nop     
8a95 00        nop     
8a96 00        nop     
8a97 00        nop     
8a98 00        nop     
8a99 00        nop     
8a9a 00        nop     
8a9b 00        nop     
8a9c 00        nop     
8a9d 00        nop     
8a9e 00        nop     
8a9f 00        nop     
8aa0 00        nop     
8aa1 00        nop     
8aa2 00        nop     
8aa3 00        nop     
8aa4 00        nop     
8aa5 00        nop     
8aa6 00        nop     
8aa7 00        nop     
8aa8 00        nop     
8aa9 00        nop     
8aaa 00        nop     
8aab 00        nop     
8aac 00        nop     
8aad 00        nop     
8aae 00        nop     
8aaf 00        nop     
8ab0 00        nop     
8ab1 00        nop     
8ab2 00        nop     
8ab3 00        nop     
8ab4 00        nop     
8ab5 00        nop     
8ab6 00        nop     
8ab7 00        nop     
8ab8 00        nop     
8ab9 00        nop     
8aba 00        nop     
8abb 00        nop     
8abc 00        nop     
8abd 00        nop     
8abe 00        nop     
8abf 00        nop     
8ac0 00        nop     
8ac1 00        nop     
8ac2 00        nop     
8ac3 00        nop     
8ac4 00        nop     
8ac5 00        nop     
8ac6 00        nop     
8ac7 00        nop     
8ac8 00        nop     
8ac9 00        nop     
8aca 00        nop     
8acb 00        nop     
8acc 00        nop     
8acd 00        nop     
8ace 00        nop     
8acf 00        nop     
8ad0 00        nop     
8ad1 00        nop     
8ad2 00        nop     
8ad3 00        nop     
8ad4 00        nop     
8ad5 00        nop     
8ad6 00        nop     
8ad7 00        nop     
8ad8 00        nop     
8ad9 00        nop     
8ada 00        nop     
8adb 00        nop     
8adc 00        nop     
8add 00        nop     
8ade 00        nop     
8adf 00        nop     
8ae0 00        nop     
8ae1 00        nop     
8ae2 00        nop     
8ae3 00        nop     
8ae4 00        nop     
8ae5 00        nop     
8ae6 00        nop     
8ae7 00        nop     
8ae8 00        nop     
8ae9 00        nop     
8aea 00        nop     
8aeb 00        nop     
8aec 00        nop     
8aed 00        nop     
8aee 00        nop     
8aef 00        nop     
8af0 00        nop     
8af1 00        nop     
8af2 00        nop     
8af3 00        nop     
8af4 00        nop     
8af5 00        nop     
8af6 00        nop     
8af7 00        nop     
8af8 00        nop     
8af9 00        nop     
8afa 00        nop     
8afb 00        nop     
8afc 00        nop     
8afd 00        nop     
8afe 00        nop     
8aff 00        nop     
8b00 00        nop     
8b01 00        nop     
8b02 00        nop     
8b03 00        nop     
8b04 00        nop     
8b05 00        nop     
8b06 00        nop     
8b07 00        nop     
8b08 00        nop     
8b09 00        nop     
8b0a 00        nop     
8b0b 00        nop     
8b0c 00        nop     
8b0d 00        nop     
8b0e 00        nop     
8b0f 00        nop     
8b10 00        nop     
8b11 00        nop     
8b12 00        nop     
8b13 00        nop     
8b14 00        nop     
8b15 00        nop     
8b16 00        nop     
8b17 00        nop     
8b18 00        nop     
8b19 00        nop     
8b1a 00        nop     
8b1b 00        nop     
8b1c 00        nop     
8b1d 00        nop     
8b1e 00        nop     
8b1f 00        nop     
8b20 00        nop     
8b21 00        nop     
8b22 00        nop     
8b23 00        nop     
8b24 00        nop     
8b25 00        nop     
8b26 00        nop     
8b27 00        nop     
8b28 00        nop     
8b29 00        nop     
8b2a 00        nop     
8b2b 00        nop     
8b2c 00        nop     
8b2d 00        nop     
8b2e 00        nop     
8b2f 00        nop     
8b30 00        nop     
8b31 00        nop     
8b32 00        nop     
8b33 00        nop     
8b34 00        nop     
8b35 00        nop     
8b36 00        nop     
8b37 00        nop     
8b38 00        nop     
8b39 00        nop     
8b3a 00        nop     
8b3b 00        nop     
8b3c 00        nop     
8b3d 00        nop     
8b3e 00        nop     
8b3f 00        nop     
8b40 00        nop     
8b41 00        nop     
8b42 00        nop     
8b43 00        nop     
8b44 00        nop     
8b45 00        nop     
8b46 00        nop     
8b47 00        nop     
8b48 00        nop     
8b49 00        nop     
8b4a 00        nop     
8b4b 00        nop     
8b4c 00        nop     
8b4d 00        nop     
8b4e 00        nop     
8b4f 00        nop     
8b50 00        nop     
8b51 00        nop     
8b52 00        nop     
8b53 00        nop     
8b54 00        nop     
8b55 00        nop     
8b56 00        nop     
8b57 00        nop     
8b58 00        nop     
8b59 00        nop     
8b5a 00        nop     
8b5b 00        nop     
8b5c 00        nop     
8b5d 00        nop     
8b5e 00        nop     
8b5f 00        nop     
8b60 00        nop     
8b61 00        nop     
8b62 00        nop     
8b63 00        nop     
8b64 00        nop     
8b65 00        nop     
8b66 00        nop     
8b67 00        nop     
8b68 00        nop     
8b69 00        nop     
8b6a 00        nop     
8b6b 00        nop     
8b6c 00        nop     
8b6d 00        nop     
8b6e 00        nop     
8b6f 00        nop     
8b70 00        nop     
8b71 00        nop     
8b72 00        nop     
8b73 00        nop     
8b74 00        nop     
8b75 00        nop     
8b76 00        nop     
8b77 00        nop     
8b78 00        nop     
8b79 00        nop     
8b7a 00        nop     
8b7b 00        nop     
8b7c 00        nop     
8b7d 00        nop     
8b7e 00        nop     
8b7f 00        nop     
8b80 00        nop     
8b81 00        nop     
8b82 00        nop     
8b83 00        nop     
8b84 00        nop     
8b85 00        nop     
8b86 00        nop     
8b87 00        nop     
8b88 00        nop     
8b89 00        nop     
8b8a 00        nop     
8b8b 00        nop     
8b8c 00        nop     
8b8d 00        nop     
8b8e 00        nop     
8b8f 00        nop     
8b90 00        nop     
8b91 00        nop     
8b92 00        nop     
8b93 00        nop     
8b94 00        nop     
8b95 00        nop     
8b96 00        nop     
8b97 00        nop     
8b98 00        nop     
8b99 00        nop     
8b9a 00        nop     
8b9b 00        nop     
8b9c 00        nop     
8b9d 00        nop     
8b9e 00        nop     
8b9f 00        nop     
8ba0 00        nop     
8ba1 00        nop     
8ba2 00        nop     
8ba3 00        nop     
8ba4 00        nop     
8ba5 00        nop     
8ba6 00        nop     
8ba7 00        nop     
8ba8 00        nop     
8ba9 00        nop     
8baa 00        nop     
8bab 00        nop     
8bac 00        nop     
8bad 00        nop     
8bae 00        nop     
8baf 00        nop     
8bb0 00        nop     
8bb1 00        nop     
8bb2 00        nop     
8bb3 00        nop     
8bb4 00        nop     
8bb5 00        nop     
8bb6 00        nop     
8bb7 00        nop     
8bb8 00        nop     
8bb9 00        nop     
8bba 00        nop     
8bbb 00        nop     
8bbc 00        nop     
8bbd 00        nop     
8bbe 00        nop     
8bbf 00        nop     
8bc0 00        nop     
8bc1 00        nop     
8bc2 00        nop     
8bc3 00        nop     
8bc4 00        nop     
8bc5 00        nop     
8bc6 00        nop     
8bc7 00        nop     
8bc8 00        nop     
8bc9 00        nop     
8bca 00        nop     
8bcb 00        nop     
8bcc 00        nop     
8bcd 00        nop     
8bce 00        nop     
8bcf 00        nop     
8bd0 00        nop     
8bd1 00        nop     
8bd2 00        nop     
8bd3 00        nop     
8bd4 00        nop     
8bd5 00        nop     
8bd6 00        nop     
8bd7 00        nop     
8bd8 00        nop     
8bd9 00        nop     
8bda 00        nop     
8bdb 00        nop     
8bdc 00        nop     
8bdd 00        nop     
8bde 00        nop     
8bdf 00        nop     
8be0 00        nop     
8be1 00        nop     
8be2 00        nop     
8be3 00        nop     
8be4 00        nop     
8be5 00        nop     
8be6 00        nop     
8be7 00        nop     
8be8 00        nop     
8be9 00        nop     
8bea 00        nop     
8beb 00        nop     
8bec 00        nop     
8bed 00        nop     
8bee 00        nop     
8bef 00        nop     
8bf0 00        nop     
8bf1 00        nop     
8bf2 00        nop     
8bf3 00        nop     
8bf4 00        nop     
8bf5 00        nop     
8bf6 00        nop     
8bf7 00        nop     
8bf8 00        nop     
8bf9 00        nop     
8bfa 00        nop     
8bfb 00        nop     
8bfc 00        nop     
8bfd 00        nop     
8bfe 00        nop     
8bff 00        nop     
8c00 00        nop     
8c01 00        nop     
8c02 00        nop     
8c03 00        nop     
8c04 00        nop     
8c05 00        nop     
8c06 00        nop     
8c07 00        nop     
8c08 00        nop     
8c09 00        nop     
8c0a 00        nop     
8c0b 00        nop     
8c0c 00        nop     
8c0d 00        nop     
8c0e 00        nop     
8c0f 00        nop     
8c10 00        nop     
8c11 00        nop     
8c12 00        nop     
8c13 00        nop     
8c14 00        nop     
8c15 00        nop     
8c16 00        nop     
8c17 00        nop     
8c18 00        nop     
8c19 00        nop     
8c1a 00        nop     
8c1b 00        nop     
8c1c 00        nop     
8c1d 00        nop     
8c1e 00        nop     
8c1f 00        nop     
8c20 00        nop     
8c21 00        nop     
8c22 00        nop     
8c23 00        nop     
8c24 00        nop     
8c25 00        nop     
8c26 00        nop     
8c27 00        nop     
8c28 00        nop     
8c29 00        nop     
8c2a 00        nop     
8c2b 00        nop     
8c2c 00        nop     
8c2d 00        nop     
8c2e 00        nop     
8c2f 00        nop     
8c30 00        nop     
8c31 00        nop     
8c32 00        nop     
8c33 00        nop     
8c34 00        nop     
8c35 00        nop     
8c36 00        nop     
8c37 00        nop     
8c38 00        nop     
8c39 00        nop     
8c3a 00        nop     
8c3b 00        nop     
8c3c 00        nop     
8c3d 00        nop     
8c3e 00        nop     
8c3f 00        nop     
8c40 00        nop     
8c41 00        nop     
8c42 00        nop     
8c43 00        nop     
8c44 00        nop     
8c45 00        nop     
8c46 00        nop     
8c47 00        nop     
8c48 00        nop     
8c49 00        nop     
8c4a 00        nop     
8c4b 00        nop     
8c4c 00        nop     
8c4d 00        nop     
8c4e 00        nop     
8c4f 00        nop     
8c50 00        nop     
8c51 00        nop     
8c52 00        nop     
8c53 00        nop     
8c54 00        nop     
8c55 00        nop     
8c56 00        nop     
8c57 00        nop     
8c58 00        nop     
8c59 00        nop     
8c5a 00        nop     
8c5b 00        nop     
8c5c 00        nop     
8c5d 00        nop     
8c5e 00        nop     
8c5f 00        nop     
8c60 00        nop     
8c61 00        nop     
8c62 00        nop     
8c63 00        nop     
8c64 00        nop     
8c65 00        nop     
8c66 00        nop     
8c67 00        nop     
8c68 00        nop     
8c69 00        nop     
8c6a 00        nop     
8c6b 00        nop     
8c6c 00        nop     
8c6d 00        nop     
8c6e 00        nop     
8c6f 00        nop     
8c70 00        nop     
8c71 00        nop     
8c72 00        nop     
8c73 00        nop     
8c74 00        nop     
8c75 00        nop     
8c76 00        nop     
8c77 00        nop     
8c78 00        nop     
8c79 00        nop     
8c7a 00        nop     
8c7b 00        nop     
8c7c 00        nop     
8c7d 00        nop     
8c7e 00        nop     
8c7f 00        nop     
8c80 00        nop     
8c81 00        nop     
8c82 00        nop     
8c83 00        nop     
8c84 00        nop     
8c85 00        nop     
8c86 00        nop     
8c87 00        nop     
8c88 00        nop     
8c89 00        nop     
8c8a 00        nop     
8c8b 00        nop     
8c8c 00        nop     
8c8d 00        nop     
8c8e 00        nop     
8c8f 00        nop     
8c90 00        nop     
8c91 00        nop     
8c92 00        nop     
8c93 00        nop     
8c94 00        nop     
8c95 00        nop     
8c96 00        nop     
8c97 00        nop     
8c98 00        nop     
8c99 00        nop     
8c9a 00        nop     
8c9b 00        nop     
8c9c 00        nop     
8c9d 00        nop     
8c9e 00        nop     
8c9f 00        nop     
8ca0 00        nop     
8ca1 00        nop     
8ca2 00        nop     
8ca3 00        nop     
8ca4 00        nop     
8ca5 00        nop     
8ca6 00        nop     
8ca7 00        nop     
8ca8 00        nop     
8ca9 00        nop     
8caa 00        nop     
8cab 00        nop     
8cac 00        nop     
8cad 00        nop     
8cae 00        nop     
8caf 00        nop     
8cb0 00        nop     
8cb1 00        nop     
8cb2 00        nop     
8cb3 00        nop     
8cb4 00        nop     
8cb5 00        nop     
8cb6 00        nop     
8cb7 00        nop     
8cb8 00        nop     
8cb9 00        nop     
8cba 00        nop     
8cbb 00        nop     
8cbc 00        nop     
8cbd 00        nop     
8cbe 00        nop     
8cbf 00        nop     
8cc0 00        nop     
8cc1 00        nop     
8cc2 00        nop     
8cc3 00        nop     
8cc4 00        nop     
8cc5 00        nop     
8cc6 00        nop     
8cc7 00        nop     
8cc8 00        nop     
8cc9 00        nop     
8cca 00        nop     
8ccb 00        nop     
8ccc 00        nop     
8ccd 00        nop     
8cce 00        nop     
8ccf 00        nop     
8cd0 00        nop     
8cd1 00        nop     
8cd2 00        nop     
8cd3 00        nop     
8cd4 00        nop     
8cd5 00        nop     
8cd6 00        nop     
8cd7 00        nop     
8cd8 00        nop     
8cd9 00        nop     
8cda 00        nop     
8cdb 00        nop     
8cdc 00        nop     
8cdd 00        nop     
8cde 00        nop     
8cdf 00        nop     
8ce0 00        nop     
8ce1 00        nop     
8ce2 00        nop     
8ce3 00        nop     
8ce4 00        nop     
8ce5 00        nop     
8ce6 00        nop     
8ce7 00        nop     
8ce8 00        nop     
8ce9 00        nop     
8cea 00        nop     
8ceb 00        nop     
8cec 00        nop     
8ced 00        nop     
8cee 00        nop     
8cef 00        nop     
8cf0 00        nop     
8cf1 00        nop     
8cf2 00        nop     
8cf3 00        nop     
8cf4 00        nop     
8cf5 00        nop     
8cf6 00        nop     
8cf7 00        nop     
8cf8 00        nop     
8cf9 00        nop     
8cfa 00        nop     
8cfb 00        nop     
8cfc 00        nop     
8cfd 00        nop     
8cfe 00        nop     
8cff 00        nop     
8d00 00        nop     
8d01 00        nop     
8d02 00        nop     
8d03 00        nop     
8d04 00        nop     
8d05 00        nop     
8d06 00        nop     
8d07 00        nop     
8d08 00        nop     
8d09 00        nop     
8d0a 00        nop     
8d0b 00        nop     
8d0c 00        nop     
8d0d 00        nop     
8d0e 00        nop     
8d0f 00        nop     
8d10 00        nop     
8d11 00        nop     
8d12 00        nop     
8d13 00        nop     
8d14 00        nop     
8d15 00        nop     
8d16 00        nop     
8d17 00        nop     
8d18 00        nop     
8d19 00        nop     
8d1a 00        nop     
8d1b 00        nop     
8d1c 00        nop     
8d1d 00        nop     
8d1e 00        nop     
8d1f 00        nop     
8d20 00        nop     
8d21 00        nop     
8d22 00        nop     
8d23 00        nop     
8d24 00        nop     
8d25 00        nop     
8d26 00        nop     
8d27 00        nop     
8d28 00        nop     
8d29 00        nop     
8d2a 00        nop     
8d2b 00        nop     
8d2c 00        nop     
8d2d 00        nop     
8d2e 00        nop     
8d2f 00        nop     
8d30 00        nop     
8d31 00        nop     
8d32 00        nop     
8d33 00        nop     
8d34 00        nop     
8d35 00        nop     
8d36 00        nop     
8d37 00        nop     
8d38 00        nop     
8d39 00        nop     
8d3a 00        nop     
8d3b 00        nop     
8d3c 00        nop     
8d3d 00        nop     
8d3e 00        nop     
8d3f 00        nop     
8d40 00        nop     
8d41 00        nop     
8d42 00        nop     
8d43 00        nop     
8d44 00        nop     
8d45 00        nop     
8d46 00        nop     
8d47 00        nop     
8d48 00        nop     
8d49 00        nop     
8d4a 00        nop     
8d4b 00        nop     
8d4c 00        nop     
8d4d 00        nop     
8d4e 00        nop     
8d4f 00        nop     
8d50 00        nop     
8d51 00        nop     
8d52 00        nop     
8d53 00        nop     
8d54 00        nop     
8d55 00        nop     
8d56 00        nop     
8d57 00        nop     
8d58 00        nop     
8d59 00        nop     
8d5a 00        nop     
8d5b 00        nop     
8d5c 00        nop     
8d5d 00        nop     
8d5e 00        nop     
8d5f 00        nop     
8d60 00        nop     
8d61 00        nop     
8d62 00        nop     
8d63 00        nop     
8d64 00        nop     
8d65 00        nop     
8d66 00        nop     
8d67 00        nop     
8d68 00        nop     
8d69 00        nop     
8d6a 00        nop     
8d6b 00        nop     
8d6c 00        nop     
8d6d 00        nop     
8d6e 00        nop     
8d6f 00        nop     
8d70 00        nop     
8d71 00        nop     
8d72 00        nop     
8d73 00        nop     
8d74 00        nop     
8d75 00        nop     
8d76 00        nop     
8d77 00        nop     
8d78 00        nop     
8d79 00        nop     
8d7a 00        nop     
8d7b 00        nop     
8d7c 00        nop     
8d7d 00        nop     
8d7e 00        nop     
8d7f 00        nop     
8d80 00        nop     
8d81 00        nop     
8d82 00        nop     
8d83 00        nop     
8d84 00        nop     
8d85 00        nop     
8d86 00        nop     
8d87 00        nop     
8d88 00        nop     
8d89 00        nop     
8d8a 00        nop     
8d8b 00        nop     
8d8c 00        nop     
8d8d 00        nop     
8d8e 00        nop     
8d8f 00        nop     
8d90 00        nop     
8d91 00        nop     
8d92 00        nop     
8d93 00        nop     
8d94 00        nop     
8d95 00        nop     
8d96 00        nop     
8d97 00        nop     
8d98 00        nop     
8d99 00        nop     
8d9a 00        nop     
8d9b 00        nop     
8d9c 00        nop     
8d9d 00        nop     
8d9e 00        nop     
8d9f 00        nop     
8da0 00        nop     
8da1 00        nop     
8da2 00        nop     
8da3 00        nop     
8da4 00        nop     
8da5 00        nop     
8da6 00        nop     
8da7 00        nop     
8da8 00        nop     
8da9 00        nop     
8daa 00        nop     
8dab 00        nop     
8dac 00        nop     
8dad 00        nop     
8dae 00        nop     
8daf 00        nop     
8db0 00        nop     
8db1 00        nop     
8db2 00        nop     
8db3 00        nop     
8db4 00        nop     
8db5 00        nop     
8db6 00        nop     
8db7 00        nop     
8db8 00        nop     
8db9 00        nop     
8dba 00        nop     
8dbb 00        nop     
8dbc 00        nop     
8dbd 00        nop     
8dbe 00        nop     
8dbf 00        nop     
8dc0 00        nop     
8dc1 00        nop     
8dc2 00        nop     
8dc3 00        nop     
8dc4 00        nop     
8dc5 00        nop     
8dc6 00        nop     
8dc7 00        nop     
8dc8 00        nop     
8dc9 00        nop     
8dca 00        nop     
8dcb 00        nop     
8dcc 00        nop     
8dcd 00        nop     
8dce 00        nop     
8dcf 00        nop     
8dd0 00        nop     
8dd1 00        nop     
8dd2 00        nop     
8dd3 00        nop     
8dd4 00        nop     
8dd5 00        nop     
8dd6 00        nop     
8dd7 00        nop     
8dd8 00        nop     
8dd9 00        nop     
8dda 00        nop     
8ddb 00        nop     
8ddc 00        nop     
8ddd 00        nop     
8dde 00        nop     
8ddf 00        nop     
8de0 00        nop     
8de1 00        nop     
8de2 00        nop     
8de3 00        nop     
8de4 00        nop     
8de5 00        nop     
8de6 00        nop     
8de7 00        nop     
8de8 00        nop     
8de9 00        nop     
8dea 00        nop     
8deb 00        nop     
8dec 00        nop     
8ded 00        nop     
8dee 00        nop     
8def 00        nop     
8df0 00        nop     
8df1 00        nop     
8df2 00        nop     
8df3 00        nop     
8df4 00        nop     
8df5 00        nop     
8df6 00        nop     
8df7 00        nop     
8df8 00        nop     
8df9 00        nop     
8dfa 00        nop     
8dfb 00        nop     
8dfc 00        nop     
8dfd 00        nop     
8dfe 00        nop     
8dff 00        nop     
8e00 00        nop     
8e01 00        nop     
8e02 00        nop     
8e03 00        nop     
8e04 00        nop     
8e05 00        nop     
8e06 00        nop     
8e07 00        nop     
8e08 00        nop     
8e09 00        nop     
8e0a 00        nop     
8e0b 00        nop     
8e0c 00        nop     
8e0d 00        nop     
8e0e 00        nop     
8e0f 00        nop     
8e10 00        nop     
8e11 00        nop     
8e12 00        nop     
8e13 00        nop     
8e14 00        nop     
8e15 00        nop     
8e16 00        nop     
8e17 00        nop     
8e18 00        nop     
8e19 00        nop     
8e1a 00        nop     
8e1b 00        nop     
8e1c 00        nop     
8e1d 00        nop     
8e1e 00        nop     
8e1f 00        nop     
8e20 00        nop     
8e21 00        nop     
8e22 00        nop     
8e23 00        nop     
8e24 00        nop     
8e25 00        nop     
8e26 00        nop     
8e27 00        nop     
8e28 00        nop     
8e29 00        nop     
8e2a 00        nop     
8e2b 00        nop     
8e2c 00        nop     
8e2d 00        nop     
8e2e 00        nop     
8e2f 00        nop     
8e30 00        nop     
8e31 00        nop     
8e32 00        nop     
8e33 00        nop     
8e34 00        nop     
8e35 00        nop     
8e36 00        nop     
8e37 00        nop     
8e38 00        nop     
8e39 00        nop     
8e3a 00        nop     
8e3b 00        nop     
8e3c 00        nop     
8e3d 00        nop     
8e3e 00        nop     
8e3f 00        nop     
8e40 00        nop     
8e41 00        nop     
8e42 00        nop     
8e43 00        nop     
8e44 00        nop     
8e45 00        nop     
8e46 00        nop     
8e47 00        nop     
8e48 00        nop     
8e49 00        nop     
8e4a 00        nop     
8e4b 00        nop     
8e4c 00        nop     
8e4d 00        nop     
8e4e 00        nop     
8e4f 00        nop     
8e50 00        nop     
8e51 00        nop     
8e52 00        nop     
8e53 00        nop     
8e54 00        nop     
8e55 00        nop     
8e56 00        nop     
8e57 00        nop     
8e58 00        nop     
8e59 00        nop     
8e5a 00        nop     
8e5b 00        nop     
8e5c 00        nop     
8e5d 00        nop     
8e5e 00        nop     
8e5f 00        nop     
8e60 00        nop     
8e61 00        nop     
8e62 00        nop     
8e63 00        nop     
8e64 00        nop     
8e65 00        nop     
8e66 00        nop     
8e67 00        nop     
8e68 00        nop     
8e69 00        nop     
8e6a 00        nop     
8e6b 00        nop     
8e6c 00        nop     
8e6d 00        nop     
8e6e 00        nop     
8e6f 00        nop     
8e70 00        nop     
8e71 00        nop     
8e72 00        nop     
8e73 00        nop     
8e74 00        nop     
8e75 00        nop     
8e76 00        nop     
8e77 00        nop     
8e78 00        nop     
8e79 00        nop     
8e7a 00        nop     
8e7b 00        nop     
8e7c 00        nop     
8e7d 00        nop     
8e7e 00        nop     
8e7f 00        nop     
8e80 00        nop     
8e81 00        nop     
8e82 00        nop     
8e83 00        nop     
8e84 00        nop     
8e85 00        nop     
8e86 00        nop     
8e87 00        nop     
8e88 00        nop     
8e89 00        nop     
8e8a 00        nop     
8e8b 00        nop     
8e8c 00        nop     
8e8d 00        nop     
8e8e 00        nop     
8e8f 00        nop     
8e90 00        nop     
8e91 00        nop     
8e92 00        nop     
8e93 00        nop     
8e94 00        nop     
8e95 00        nop     
8e96 00        nop     
8e97 00        nop     
8e98 00        nop     
8e99 00        nop     
8e9a 00        nop     
8e9b 00        nop     
8e9c 00        nop     
8e9d 00        nop     
8e9e 00        nop     
8e9f 00        nop     
8ea0 00        nop     
8ea1 00        nop     
8ea2 00        nop     
8ea3 00        nop     
8ea4 00        nop     
8ea5 00        nop     
8ea6 00        nop     
8ea7 00        nop     
8ea8 00        nop     
8ea9 00        nop     
8eaa 00        nop     
8eab 00        nop     
8eac 00        nop     
8ead 00        nop     
8eae 00        nop     
8eaf 00        nop     
8eb0 00        nop     
8eb1 00        nop     
8eb2 00        nop     
8eb3 00        nop     
8eb4 00        nop     
8eb5 00        nop     
8eb6 00        nop     
8eb7 00        nop     
8eb8 00        nop     
8eb9 00        nop     
8eba 00        nop     
8ebb 00        nop     
8ebc 00        nop     
8ebd 00        nop     
8ebe 00        nop     
8ebf 00        nop     
8ec0 00        nop     
8ec1 00        nop     
8ec2 00        nop     
8ec3 00        nop     
8ec4 00        nop     
8ec5 00        nop     
8ec6 00        nop     
8ec7 00        nop     
8ec8 00        nop     
8ec9 00        nop     
8eca 00        nop     
8ecb 00        nop     
8ecc 00        nop     
8ecd 00        nop     
8ece 00        nop     
8ecf 00        nop     
8ed0 00        nop     
8ed1 00        nop     
8ed2 00        nop     
8ed3 00        nop     
8ed4 00        nop     
8ed5 00        nop     
8ed6 00        nop     
8ed7 00        nop     
8ed8 00        nop     
8ed9 00        nop     
8eda 00        nop     
8edb 00        nop     
8edc 00        nop     
8edd 00        nop     
8ede 00        nop     
8edf 00        nop     
8ee0 00        nop     
8ee1 00        nop     
8ee2 00        nop     
8ee3 00        nop     
8ee4 00        nop     
8ee5 00        nop     
8ee6 00        nop     
8ee7 00        nop     
8ee8 00        nop     
8ee9 00        nop     
8eea 00        nop     
8eeb 00        nop     
8eec 00        nop     
8eed 00        nop     
8eee 00        nop     
8eef 00        nop     
8ef0 00        nop     
8ef1 00        nop     
8ef2 00        nop     
8ef3 00        nop     
8ef4 00        nop     
8ef5 00        nop     
8ef6 00        nop     
8ef7 00        nop     
8ef8 00        nop     
8ef9 00        nop     
8efa 00        nop     
8efb 00        nop     
8efc 00        nop     
8efd 00        nop     
8efe 00        nop     
8eff 00        nop     
8f00 00        nop     
8f01 00        nop     
8f02 00        nop     
8f03 00        nop     
8f04 00        nop     
8f05 00        nop     
8f06 00        nop     
8f07 00        nop     
8f08 00        nop     
8f09 00        nop     
8f0a 00        nop     
8f0b 00        nop     
8f0c 00        nop     
8f0d 00        nop     
8f0e 00        nop     
8f0f 00        nop     
8f10 00        nop     
8f11 00        nop     
8f12 00        nop     
8f13 00        nop     
8f14 00        nop     
8f15 00        nop     
8f16 00        nop     
8f17 00        nop     
8f18 00        nop     
8f19 00        nop     
8f1a 00        nop     
8f1b 00        nop     
8f1c 00        nop     
8f1d 00        nop     
8f1e 00        nop     
8f1f 00        nop     
8f20 00        nop     
8f21 00        nop     
8f22 00        nop     
8f23 00        nop     
8f24 00        nop     
8f25 00        nop     
8f26 00        nop     
8f27 00        nop     
8f28 00        nop     
8f29 00        nop     
8f2a 00        nop     
8f2b 00        nop     
8f2c 00        nop     
8f2d 00        nop     
8f2e 00        nop     
8f2f 00        nop     
8f30 00        nop     
8f31 00        nop     
8f32 00        nop     
8f33 00        nop     
8f34 00        nop     
8f35 00        nop     
8f36 00        nop     
8f37 00        nop     
8f38 00        nop     
8f39 00        nop     
8f3a 00        nop     
8f3b 00        nop     
8f3c 00        nop     
8f3d 00        nop     
8f3e 00        nop     
8f3f 00        nop     
8f40 00        nop     
8f41 00        nop     
8f42 00        nop     
8f43 00        nop     
8f44 00        nop     
8f45 00        nop     
8f46 00        nop     
8f47 00        nop     
8f48 00        nop     
8f49 00        nop     
8f4a 00        nop     
8f4b 00        nop     
8f4c 00        nop     
8f4d 00        nop     
8f4e 00        nop     
8f4f 00        nop     
8f50 00        nop     
8f51 00        nop     
8f52 00        nop     
8f53 00        nop     
8f54 00        nop     
8f55 00        nop     
8f56 00        nop     
8f57 00        nop     
8f58 00        nop     
8f59 00        nop     
8f5a 00        nop     
8f5b 00        nop     
8f5c 00        nop     
8f5d 00        nop     
8f5e 00        nop     
8f5f 00        nop     
8f60 00        nop     
8f61 00        nop     
8f62 00        nop     
8f63 00        nop     
8f64 00        nop     
8f65 00        nop     
8f66 00        nop     
8f67 00        nop     
8f68 00        nop     
8f69 00        nop     
8f6a 00        nop     
8f6b 00        nop     
8f6c 00        nop     
8f6d 00        nop     
8f6e 00        nop     
8f6f 00        nop     
8f70 00        nop     
8f71 00        nop     
8f72 00        nop     
8f73 00        nop     
8f74 00        nop     
8f75 00        nop     
8f76 00        nop     
8f77 00        nop     
8f78 00        nop     
8f79 00        nop     
8f7a 00        nop     
8f7b 00        nop     
8f7c 00        nop     
8f7d 00        nop     
8f7e 00        nop     
8f7f 00        nop     
8f80 00        nop     
8f81 00        nop     
8f82 00        nop     
8f83 00        nop     
8f84 00        nop     
8f85 00        nop     
8f86 00        nop     
8f87 00        nop     
8f88 00        nop     
8f89 00        nop     
8f8a 00        nop     
8f8b 00        nop     
8f8c 00        nop     
8f8d 00        nop     
8f8e 00        nop     
8f8f 00        nop     
8f90 00        nop     
8f91 00        nop     
8f92 00        nop     
8f93 00        nop     
8f94 00        nop     
8f95 00        nop     
8f96 00        nop     
8f97 00        nop     
8f98 00        nop     
8f99 00        nop     
8f9a 00        nop     
8f9b 00        nop     
8f9c 00        nop     
8f9d 00        nop     
8f9e 00        nop     
8f9f 00        nop     
8fa0 00        nop     
8fa1 00        nop     
8fa2 00        nop     
8fa3 00        nop     
8fa4 00        nop     
8fa5 00        nop     
8fa6 00        nop     
8fa7 00        nop     
8fa8 00        nop     
8fa9 00        nop     
8faa 00        nop     
8fab 00        nop     
8fac 00        nop     
8fad 00        nop     
8fae 00        nop     
8faf 00        nop     
8fb0 00        nop     
8fb1 00        nop     
8fb2 00        nop     
8fb3 00        nop     
8fb4 00        nop     
8fb5 00        nop     
8fb6 00        nop     
8fb7 00        nop     
8fb8 00        nop     
8fb9 00        nop     
8fba 00        nop     
8fbb 00        nop     
8fbc 00        nop     
8fbd 00        nop     
8fbe 00        nop     
8fbf 00        nop     
8fc0 00        nop     
8fc1 00        nop     
8fc2 00        nop     
8fc3 00        nop     
8fc4 00        nop     
8fc5 00        nop     
8fc6 00        nop     
8fc7 00        nop     
8fc8 00        nop     
8fc9 00        nop     
8fca 00        nop     
8fcb 00        nop     
8fcc 00        nop     
8fcd 00        nop     
8fce 00        nop     
8fcf 00        nop     
8fd0 00        nop     
8fd1 00        nop     
8fd2 00        nop     
8fd3 00        nop     
8fd4 00        nop     
8fd5 00        nop     
8fd6 00        nop     
8fd7 00        nop     
8fd8 00        nop     
8fd9 00        nop     
8fda 00        nop     
8fdb 00        nop     
8fdc 00        nop     
8fdd 00        nop     
8fde 00        nop     
8fdf 00        nop     
8fe0 00        nop     
8fe1 00        nop     
8fe2 00        nop     
8fe3 00        nop     
8fe4 00        nop     
8fe5 00        nop     
8fe6 00        nop     
8fe7 00        nop     
8fe8 00        nop     
8fe9 00        nop     
8fea 00        nop     
8feb 00        nop     
8fec 00        nop     
8fed 00        nop     
8fee 00        nop     
8fef 00        nop     
8ff0 00        nop     
8ff1 00        nop     
8ff2 00        nop     
8ff3 00        nop     
8ff4 00        nop     
8ff5 00        nop     
8ff6 00        nop     
8ff7 00        nop     
8ff8 00        nop     
8ff9 00        nop     
8ffa 00        nop     
8ffb 00        nop     
8ffc 00        nop     
8ffd 00        nop     
8ffe 00        nop     
8fff 00        nop     
9000 cd1580    call    8015h
9003 f5        push    af
9004 3e02      ld      a,02h
9006 3263f6    ld      (0f663h),a
9009 22f8f7    ld      (0f7f8h),hl
900c f1        pop     af
900d c9        ret     

900e 213930    ld      hl,3039h
9011 cd0390    call    9003h
9014 213d90    ld      hl,903dh
9017 cd2534    call    3425h
901a 060a      ld      b,0ah
901c 04        inc     b
901d 1003      djnz    9022h
901f c33c90    jp      903ch
9022 c5        push    bc
9023 cd2f90    call    902fh
9026 c1        pop     bc
9027 da3c90    jp      c,903ch
902a 10f6      djnz    9022h
902c c33c90    jp      903ch
902f 7e        ld      a,(hl)
9030 fe00      cp      00h
9032 2002      jr      nz,9036h
9034 37        scf     
9035 c9        ret     

9036 cdcf81    call    81cfh
9039 23        inc     hl
903a b7        or      a
903b c9        ret     

903c c9        ret     

903d cd1580    call    8015h
9040 cd0390    call    9003h
9043 215090    ld      hl,9050h
9046 cd2534    call    3425h
9049 cde981    call    81e9h
904c c9        ret     

904d cd1580    call    8015h
9050 00        nop     
9051 00        nop     
9052 00        nop     
9053 00        nop     
9054 00        nop     
9055 00        nop     
9056 00        nop     
9057 00        nop     
9058 00        nop     
9059 00        nop     
905a 00        nop     
905b 00        nop     
905c 00        nop     
905d 00        nop     
905e 00        nop     
905f 00        nop     
9060 f3        di      
9061 219ffd    ld      hl,0fd9fh
9064 36c3      ld      (hl),0c3h
9066 e5        push    hl
9067 217090    ld      hl,9070h
906a 22a0fd    ld      (0fda0h),hl
906d e1        pop     hl
906e fb        ei      
906f c9        ret     

9070 f5        push    af
9071 d5        push    de
9072 3a7d90    ld      a,(907dh)
9075 ee0f      xor     0fh
9077 327d90    ld      (907dh),a
907a 3e08      ld      a,08h
907c 1e0f      ld      e,0fh
907e cd9300    call    0093h
9081 f1        pop     af
9082 d1        pop     de
9083 c9        ret     

9084 cd1580    call    8015h
9087 cb27      sla     a
9089 cb25      sla     l
908b 2600      ld      h,00h
908d 019f90    ld      bc,909fh
9090 09        add     hl,bc
9091 5e        ld      e,(hl)
9092 cd9300    call    0093h
9095 23        inc     hl
9096 5e        ld      e,(hl)
9097 3c        inc     a
9098 cd9300    call    0093h
909b c9        ret     

909c cd1580    call    8015h
909f 5d        ld      e,l
90a0 0d        dec     c
90a1 9c        sbc     a,h
90a2 0c        inc     c
90a3 e7        rst     20h
90a4 0b        dec     bc
90a5 3c        inc     a
90a6 0b        dec     bc
90a7 9b        sbc     a,e
90a8 0a        ld      a,(bc)
90a9 02        ld      (bc),a
90aa 0a        ld      a,(bc)
90ab 73        ld      (hl),e
90ac 09        add     hl,bc
90ad eb        ex      de,hl
90ae 08        ex      af,af'
90af 6b        ld      l,e
90b0 08        ex      af,af'
90b1 f20780    jp      p,8007h
90b4 07        rlca    
90b5 14        inc     d
90b6 07        rlca    
90b7 af        xor     a
90b8 064e      ld      b,4eh
90ba 06f4      ld      b,0f4h
90bc 05        dec     b
90bd 9e        sbc     a,(hl)
90be 05        dec     b
90bf 4e        ld      c,(hl)
90c0 05        dec     b
90c1 0105ba    ld      bc,0ba05h
90c4 04        inc     b
90c5 76        halt    
90c6 04        inc     b
90c7 3604      ld      (hl),04h
90c9 f9        ld      sp,hl
90ca 03        inc     bc
90cb c0        ret     nz

90cc 03        inc     bc
90cd 8a        adc     a,d
90ce 03        inc     bc
90cf 57        ld      d,a
90d0 03        inc     bc
90d1 27        daa     
90d2 03        inc     bc
90d3 fa02cf    jp      m,0cf02h
90d6 02        ld      (bc),a
90d7 a7        and     a
90d8 02        ld      (bc),a
90d9 81        add     a,c
90da 02        ld      (bc),a
90db 5d        ld      e,l
90dc 02        ld      (bc),a
90dd 3b        dec     sp
90de 02        ld      (bc),a
90df 1b        dec     de
90e0 02        ld      (bc),a
90e1 fd01e001  ld      bc,01e0h
90e5 c5        push    bc
90e6 01ac01    ld      bc,01ach
90e9 94        sub     h
90ea 017d01    ld      bc,017dh
90ed 68        ld      l,b
90ee 015301    ld      bc,0153h
90f1 40        ld      b,b
90f2 012e01    ld      bc,012eh
90f5 1d        dec     e
90f6 010d01    ld      bc,010dh
90f9 fe00      cp      00h
90fb f0        ret     p

90fc 00        nop     
90fd e3        ex      (sp),hl
90fe 00        nop     
90ff d600      sub     00h
9101 ca00be    jp      z,0be00h
9104 00        nop     
9105 b4        or      h
9106 00        nop     
9107 aa        xor     d
9108 00        nop     
9109 a0        and     b
910a 00        nop     
910b 97        sub     a
910c 00        nop     
910d 8f        adc     a,a
910e 00        nop     
910f 87        add     a,a
9110 00        nop     
9111 7f        ld      a,a
9112 00        nop     
9113 78        ld      a,b
9114 00        nop     
9115 71        ld      (hl),c
9116 00        nop     
9117 6b        ld      l,e
9118 00        nop     
9119 65        ld      h,l
911a 00        nop     
911b 5f        ld      e,a
911c 00        nop     
911d 5a        ld      e,d
911e 00        nop     
911f 55        ld      d,l
9120 00        nop     
9121 50        ld      d,b
9122 00        nop     
9123 4c        ld      c,h
9124 00        nop     
9125 47        ld      b,a
9126 00        nop     
9127 43        ld      b,e
9128 00        nop     
9129 40        ld      b,b
912a 00        nop     
912b 3c        inc     a
912c 00        nop     
912d 39        add     hl,sp
912e 00        nop     
912f 35        dec     (hl)
9130 00        nop     
9131 320030    ld      (3000h),a
9134 00        nop     
9135 2d        dec     l
9136 00        nop     
9137 2a0028    ld      hl,(2800h)
913a 00        nop     
913b 2600      ld      h,00h
913d 24        inc     h
913e 00        nop     
913f 220020    ld      (2000h),hl
9142 00        nop     
9143 1e00      ld      e,00h
9145 1c        inc     e
9146 00        nop     
9147 1b        dec     de
9148 00        nop     
9149 19        add     hl,de
914a 00        nop     
914b 1800      jr      914dh
914d 1600      ld      d,00h
914f 15        dec     d
9150 00        nop     
9151 14        inc     d
9152 00        nop     
9153 13        inc     de
9154 00        nop     
9155 12        ld      (de),a
9156 00        nop     
9157 110010    ld      de,1000h
915a 00        nop     
915b 0f        rrca    
915c 00        nop     
915d 0e00      ld      c,00h

; 


915f 211580    ld      hl,8015h ;              entry point
9162 36c3      ld      (hl),0c3h
9164 21f781    ld      hl,81f7h
9167 221680    ld      (8016h),hl
916a 3100dc    ld      sp,0dc00h
916d cd6182    call    8261h
9170 cd7582    call    8275h
9173 ed730f82  ld      (820fh),sp
9177 e5        push    hl
9178 2a0f82    ld      hl,(820fh)
917b 223981    ld      (8139h),hl
917e cd3581    call    8135h
9181 e1        pop     hl
9182 e5        push    hl
9183 2135c0    ld      hl,0c035h
9186 223981    ld      (8139h),hl
9189 cd3581    call    8135h
918c e1        pop     hl
918d cd35c0    call    0c035h
9190 cd42c8    call    0c842h
9193 2100c6    ld      hl,0c600h
9196 36cd      ld      (hl),0cdh
9198 1101c6    ld      de,0c601h
919b 01ff13    ld      bc,13ffh
919e edb0      ldir    
91a0 cdcd82    call    82cdh
91a3 0100c6    ld      bc,0c600h
91a6 ed439182  ld      (8291h),bc
91aa 0100d2    ld      bc,0d200h
91ad ed439482  ld      (8294h),bc
91b1 010000    ld      bc,0000h
91b4 c5        push    bc
91b5 01d491    ld      bc,91d4h
91b8 c5        push    bc
91b9 cd3a84    call    843ah
91bc e5        push    hl
91bd 215185    ld      hl,8551h
91c0 22c783    ld      (83c7h),hl
91c3 e1        pop     hl
91c4 e5        push    hl
91c5 215c86    ld      hl,865ch
91c8 22bd83    ld      (83bdh),hl  ; program keyboard scan routine task ????
91cb e1        pop     hl
91cc c3bc83    jp      83bch
91cf cd1580    call    8015h
91d2 ae        xor     (hl)
91d3 87        add     a,a
91d4 01d491    ld      bc,91d4h
91d7 c5        push    bc
91d8 013a92    ld      bc,923ah
91db c5        push    bc
91dc 010000    ld      bc,0000h
91df c5        push    bc
91e0 010000    ld      bc,0000h
91e3 c5        push    bc
91e4 010000    ld      bc,0000h
91e7 c5        push    bc
91e8 010000    ld      bc,0000h
91eb c5        push    bc
91ec 011788    ld      bc,8817h
91ef c5        push    bc
91f0 01f687    ld      bc,87f6h
91f3 c5        push    bc
91f4 011888    ld      bc,8818h
91f7 c5        push    bc
91f8 014f88    ld      bc,884fh
91fb c5        push    bc
91fc 016588    ld      bc,8865h
91ff c5        push    bc
9200 01c188    ld      bc,88c1h
9203 c5        push    bc
9204 010000    ld      bc,0000h
9207 c5        push    bc
9208 010000    ld      bc,0000h
920b c5        push    bc
920c 01219b    ld      bc,9b21h
920f c5        push    bc
9210 01069c    ld      bc,9c06h
9213 c5        push    bc
9214 016c9c    ld      bc,9c6ch
9217 c5        push    bc
9218 01c09c    ld      bc,9cc0h
921b c5        push    bc
921c 01269d    ld      bc,9d26h
921f c5        push    bc
9220 017a9d    ld      bc,9d7ah
9223 c5        push    bc
9224 01a79d    ld      bc,9da7h
9227 c5        push    bc
9228 01c09e    ld      bc,9ec0h
922b c5        push    bc
922c 013b88    ld      bc,883bh
922f c5        push    bc
9230 018784    ld      bc,8487h
9233 c5        push    bc
9234 c39883    jp      8398h
9237 cd1580    call    8015h
923a dde5      push    ix
923c dd210000  ld      ix,0000h
9240 dd39      add     ix,sp
9242 210000    ld      hl,0000h
9245 2213c0    ld      (0c013h),hl
9248 210000    ld      hl,0000h
924b 2215c0    ld      (0c015h),hl
924e 210200    ld      hl,0002h
9251 e5        push    hl
9252 211800    ld      hl,0018h
9255 e5        push    hl
9256 212000    ld      hl,0020h
9259 e5        push    hl
925a 210000    ld      hl,0000h
925d e5        push    hl
925e 210000    ld      hl,0000h
9261 e5        push    hl
9262 326792    ld      (9267h),a
9265 2ad000    ld      hl,(00d0h)
9268 226c92    ld      (926ch),hl
926b cd6e92    call    926eh
926e 3a7684    ld      a,(8476h)
9271 210000    ld      hl,0000h
9274 327992    ld      (9279h),a
9277 22e200    ld      (00e2h),hl
927a 210400    ld      hl,0004h
927d e5        push    hl
927e 328392    ld      (9283h),a
9281 2ae200    ld      hl,(00e2h)
9284 d1        pop     de
9285 cd0086    call    8600h
9288 cd3986    call    8639h
928b ca1094    jp      z,9410h
928e 212000    ld      hl,0020h
9291 329692    ld      (9296h),a
9294 22f600    ld      (00f6h),hl
9297 210100    ld      hl,0001h
929a e5        push    hl
929b 3a7684    ld      a,(8476h)
929e f5        push    af
929f 32a492    ld      (92a4h),a
92a2 2ae200    ld      hl,(00e2h)
92a5 e5        push    hl
92a6 210200    ld      hl,0002h
92a9 d1        pop     de
92aa cd3a32    call    323ah
92ad e3        ex      (sp),hl
92ae 7c        ld      a,h
92af e1        pop     hl
92b0 327684    ld      (8476h),a
92b3 d1        pop     de
92b4 cdd185    call    85d1h
92b7 cd3986    call    8639h
92ba cac692    jp      z,92c6h
92bd 21e001    ld      hl,01e0h
92c0 32c592    ld      (92c5h),a
92c3 22f600    ld      (00f6h),hl
92c6 210800    ld      hl,0008h
92c9 e5        push    hl
92ca 213000    ld      hl,0030h
92cd d1        pop     de
92ce 19        add     hl,de
92cf 32d492    ld      (92d4h),a
92d2 22f400    ld      (00f4h),hl
92d5 210200    ld      hl,0002h
92d8 e5        push    hl
92d9 32de92    ld      (92deh),a
92dc 2ae200    ld      hl,(00e2h)
92df d1        pop     de
92e0 cd0f86    call    860fh
92e3 cd3986    call    8639h
92e6 cafa92    jp      z,92fah
92e9 211000    ld      hl,0010h
92ec e5        push    hl
92ed 216801    ld      hl,0168h
92f0 d1        pop     de
92f1 a7        and     a
92f2 ed52      sbc     hl,de
92f4 32f992    ld      (92f9h),a
92f7 22f400    ld      (00f4h),hl
92fa 32ff92    ld      (92ffh),a
92fd 2af600    ld      hl,(00f6h)
9300 e5        push    hl
9301 01f600    ld      bc,00f6h
9304 c5        push    bc
9305 320a93    ld      (930ah),a
9308 2af400    ld      hl,(00f4h)
930b e5        push    hl
930c 01f400    ld      bc,00f4h
930f c5        push    bc
9310 321593    ld      (9315h),a
9313 2ae200    ld      hl,(00e2h)
9316 e5        push    hl
9317 211000    ld      hl,0010h
931a d1        pop     de
931b 19        add     hl,de
931c e5        push    hl
931d 01f200    ld      bc,00f2h
9320 c5        push    bc
9321 322693    ld      (9326h),a
9324 2ae200    ld      hl,(00e2h)
9327 e5        push    hl
9328 01da00    ld      bc,00dah
932b c5        push    bc
932c 323193    ld      (9331h),a
932f 2ae200    ld      hl,(00e2h)
9332 e5        push    hl
9333 210300    ld      hl,0003h
9336 d1        pop     de
9337 a7        and     a
9338 ed52      sbc     hl,de
933a e5        push    hl
933b 01d600    ld      bc,00d6h
933e c5        push    bc
933f 324493    ld      (9344h),a
9342 2ae200    ld      hl,(00e2h)
9345 e5        push    hl
9346 01d400    ld      bc,00d4h
9349 c5        push    bc
934a 324f93    ld      (934fh),a
934d 2ae200    ld      hl,(00e2h)
9350 e5        push    hl
9351 2af5bf    ld      hl,(0bff5h)
9354 d1        pop     de
9355 cb23      sla     e
9357 cb12      rl      d
9359 19        add     hl,de
935a 225e93    ld      (935eh),hl
935d 2a0000    ld      hl,(0000h)
9360 e5        push    hl
9361 01cc00    ld      bc,00cch
9364 c5        push    bc
9365 326a93    ld      (936ah),a
9368 2ae200    ld      hl,(00e2h)
936b e5        push    hl
936c 2affbf    ld      hl,(0bfffh)
936f d1        pop     de
9370 cb23      sla     e
9372 cb12      rl      d
9374 19        add     hl,de
9375 227993    ld      (9379h),hl
9378 2a0000    ld      hl,(0000h)
937b e5        push    hl
937c 01c600    ld      bc,00c6h
937f c5        push    bc
9380 0100d2    ld      bc,0d200h
9383 ed439182  ld      (8291h),bc
9387 0100d6    ld      bc,0d600h
938a ed439482  ld      (8294h),bc
938e 010800    ld      bc,0008h
9391 c5        push    bc
9392 0101a7    ld      bc,0a701h
9395 c5        push    bc
9396 cd3a84    call    843ah
9399 e5        push    hl
939a 329f93    ld      (939fh),a
939d 2ae200    ld      hl,(00e2h)
93a0 e5        push    hl
93a1 2ad7bf    ld      hl,(0bfd7h)
93a4 d1        pop     de
93a5 cb23      sla     e
93a7 cb12      rl      d
93a9 19        add     hl,de
93aa d1        pop     de
93ab 22b093    ld      (93b0h),hl
93ae ed530000  ld      (0000h),de
93b2 210000    ld      hl,0000h
93b5 e5        push    hl
93b6 3a7684    ld      a,(8476h)
93b9 f5        push    af
93ba 32bf93    ld      (93bfh),a
93bd 2ae200    ld      hl,(00e2h)
93c0 e5        push    hl
93c1 210800    ld      hl,0008h
93c4 d1        pop     de
93c5 cd9331    call    3193h
93c8 e3        ex      (sp),hl
93c9 7c        ld      a,h
93ca e1        pop     hl
93cb 327684    ld      (8476h),a
93ce e5        push    hl
93cf 32d493    ld      (93d4h),a
93d2 2ae200    ld      hl,(00e2h)
93d5 e5        push    hl
93d6 210300    ld      hl,0003h
93d9 d1        pop     de
93da 19        add     hl,de
93db 7d        ld      a,l
93dc e1        pop     hl
93dd d1        pop     de
93de cd8889    call    8988h
93e1 3a7684    ld      a,(8476h)
93e4 210000    ld      hl,0000h
93e7 e5        push    hl
93e8 32ed93    ld      (93edh),a
93eb 2ae200    ld      hl,(00e2h)
93ee e5        push    hl
93ef 2ae1bf    ld      hl,(0bfe1h)
93f2 d1        pop     de
93f3 cb23      sla     e
93f5 cb12      rl      d
93f7 19        add     hl,de
93f8 d1        pop     de
93f9 22fe93    ld      (93feh),hl
93fc ed530000  ld      (0000h),de
9400 320594    ld      (9405h),a
9403 2ae200    ld      hl,(00e2h)
9406 23        inc     hl
9407 320c94    ld      (940ch),a
940a 22e200    ld      (00e2h),hl
940d c37a92    jp      927ah
9410 210700    ld      hl,0007h
9413 e5        push    hl
9414 211500    ld      hl,0015h
9417 e5        push    hl
9418 211e00    ld      hl,001eh
941b e5        push    hl
941c 210200    ld      hl,0002h
941f e5        push    hl
9420 210100    ld      hl,0001h
9423 e5        push    hl
9424 322994    ld      (9429h),a
9427 2ad000    ld      hl,(00d0h)
942a 222e94    ld      (942eh),hl
942d cd3094    call    9430h
9430 3a7684    ld      a,(8476h)
9433 323894    ld      (9438h),a
9436 2ad600    ld      hl,(00d6h)
9439 223d94    ld      (943dh),hl
943c cd3f94    call    943fh
943f 3a7684    ld      a,(8476h)
9442 210a00    ld      hl,000ah
9445 e5        push    hl
9446 210a00    ld      hl,000ah
9449 d1        pop     de
944a cdd889    call    89d8h
944d 215394    ld      hl,9453h
9450 c36094    jp      9460h
9453 4d        ld      c,l
9454 75        ld      (hl),l
9455 68        ld      l,b
9456 6f        ld      l,a
9457 6e        ld      l,(hl)
9458 4d        ld      c,l
9459 6f        ld      l,a
945a 75        ld      (hl),l
945b 72        ld      (hl),d
945c 6e        ld      l,(hl)
945d 2033      jr      nz,9492h
945f 00        nop     
9460 cde981    call    81e9h
9463 3a7684    ld      a,(8476h)
9466 211000    ld      hl,0010h
9469 e5        push    hl
946a 210500    ld      hl,0005h
946d d1        pop     de
946e cdd889    call    89d8h
9471 217794    ld      hl,9477h
9474 c38d94    jp      948dh
9477 323032    ld      (3230h),a
947a 322040    ld      (4020h),a
947d 68        ld      l,b
947e 6f        ld      l,a
947f 67        ld      h,a
9480 65        ld      h,l
9481 316533    ld      sp,3365h
9484 2076      jr      nz,94fch
9486 65        ld      h,l
9487 72        ld      (hl),d
9488 2031      jr      nz,94bbh
948a 2e31      ld      l,31h
948c 00        nop     
948d cde981    call    81e9h
9490 3a7684    ld      a,(8476h)
9493 211100    ld      hl,0011h
9496 e5        push    hl
9497 210500    ld      hl,0005h
949a d1        pop     de
949b cdd889    call    89d8h
949e 21a494    ld      hl,94a4h
94a1 c3ba94    jp      94bah
94a4 44        ld      b,h
94a5 65        ld      h,l
94a6 64        ld      h,h
94a7 69        ld      l,c
94a8 63        ld      h,e
94a9 61        ld      h,c
94aa 74        ld      (hl),h
94ab 65        ld      h,l
94ac 64        ld      h,h
94ad 2074      jr      nz,9523h
94af 6f        ld      l,a
94b0 204d      jr      nz,94ffh
94b2 53        ld      d,e
94b3 58        ld      e,b
94b4 64        ld      h,h
94b5 65        ld      h,l
94b6 76        halt    
94b7 323200    ld      (0032h),a
94ba cde981    call    81e9h
94bd 3a7684    ld      a,(8476h)
94c0 210a00    ld      hl,000ah
94c3 e5        push    hl
94c4 32c994    ld      (94c9h),a
94c7 2ae600    ld      hl,(00e6h)
94ca 22ce94    ld      (94ceh),hl
94cd cdd094    call    94d0h
94d0 3a7684    ld      a,(8476h)
94d3 210c00    ld      hl,000ch
94d6 e5        push    hl
94d7 210900    ld      hl,0009h
94da d1        pop     de
94db cdd889    call    89d8h
94de 21e494    ld      hl,94e4h
94e1 c3f494    jp      94f4h
94e4 50        ld      d,b
94e5 72        ld      (hl),d
94e6 65        ld      h,l
94e7 73        ld      (hl),e
94e8 73        ld      (hl),e
94e9 2053      jr      nz,953eh
94eb 70        ld      (hl),b
94ec 61        ld      h,c
94ed 63        ld      h,e
94ee 65        ld      h,l
94ef 206b      jr      nz,955ch
94f1 65        ld      h,l
94f2 79        ld      a,c
94f3 00        nop     
94f4 cde981    call    81e9h
94f7 3a7684    ld      a,(8476h)
94fa 210300    ld      hl,0003h
94fd e5        push    hl
94fe 210300    ld      hl,0003h
9501 d1        pop     de
9502 cdd889    call    89d8h
9505 210b95    ld      hl,950bh
9508 c31295    jp      9512h
950b 50        ld      d,b
950c 4c        ld      c,h
950d 41        ld      b,c
950e 59        ld      e,c
950f 45        ld      b,l
9510 52        ld      d,d
9511 00        nop     
9512 cde981    call    81e9h
9515 3a7684    ld      a,(8476h)
9518 210400    ld      hl,0004h
951b e5        push    hl
951c 210300    ld      hl,0003h
951f d1        pop     de
9520 cdd889    call    89d8h
9523 212995    ld      hl,9529h
9526 c33095    jp      9530h
9529 43        ld      b,e
952a 2050      jr      nz,957ch
952c 2055      jr      nz,9583h
952e 2000      jr      nz,9530h
9530 cde981    call    81e9h
9533 3a7684    ld      a,(8476h)
9536 210500    ld      hl,0005h
9539 e5        push    hl
953a 210100    ld      hl,0001h
953d d1        pop     de
953e cdd889    call    89d8h
9541 214795    ld      hl,9547h
9544 c34c95    jp      954ch
9547 77        ld      (hl),a
9548 61        ld      h,c
9549 73        ld      (hl),e
954a 64        ld      h,h
954b 00        nop     
954c cde981    call    81e9h
954f 3a7684    ld      a,(8476h)
9552 210300    ld      hl,0003h
9555 e5        push    hl
9556 211700    ld      hl,0017h
9559 d1        pop     de
955a cdd889    call    89d8h
955d 216395    ld      hl,9563h
9560 c36a95    jp      956ah
9563 50        ld      d,b
9564 4c        ld      c,h
9565 41        ld      b,c
9566 59        ld      e,c
9567 45        ld      b,l
9568 52        ld      d,d
9569 00        nop     
956a cde981    call    81e9h
956d 3a7684    ld      a,(8476h)
9570 210400    ld      hl,0004h
9573 e5        push    hl
9574 211800    ld      hl,0018h
9577 d1        pop     de
9578 cdd889    call    89d8h
957b 218195    ld      hl,9581h
957e c38895    jp      9588h
9581 43        ld      b,e
9582 2050      jr      nz,95d4h
9584 2055      jr      nz,95dbh
9586 2000      jr      nz,9588h
9588 cde981    call    81e9h
958b 3a7684    ld      a,(8476h)
958e 210500    ld      hl,0005h
9591 e5        push    hl
9592 211900    ld      hl,0019h
9595 d1        pop     de
9596 cdd889    call    89d8h
9599 219f95    ld      hl,959fh
959c c3a595    jp      95a5h
959f 61        ld      h,c
95a0 72        ld      (hl),d
95a1 72        ld      (hl),d
95a2 6f        ld      l,a
95a3 77        ld      (hl),a
95a4 00        nop     
95a5 cde981    call    81e9h
95a8 3a7684    ld      a,(8476h)
95ab 211400    ld      hl,0014h
95ae e5        push    hl
95af 210100    ld      hl,0001h
95b2 d1        pop     de
95b3 cdd889    call    89d8h
95b6 21bc95    ld      hl,95bch
95b9 c3c695    jp      95c6h
95bc 6a        ld      l,d
95bd 6f        ld      l,a
95be 79        ld      a,c
95bf 73        ld      (hl),e
95c0 74        ld      (hl),h
95c1 69        ld      l,c
95c2 63        ld      h,e
95c3 6b        ld      l,e
95c4 3100cd    ld      sp,0cd00h
95c7 e9        jp      (hl)
95c8 81        add     a,c
95c9 3a7684    ld      a,(8476h)
95cc 211500    ld      hl,0015h
95cf e5        push    hl
95d0 210300    ld      hl,0003h
95d3 d1        pop     de
95d4 cdd889    call    89d8h
95d7 21dd95    ld      hl,95ddh
95da c3e495    jp      95e4h
95dd 50        ld      d,b
95de 4c        ld      c,h
95df 41        ld      b,c
95e0 59        ld      e,c
95e1 45        ld      b,l
95e2 52        ld      d,d
95e3 00        nop     
95e4 cde981    call    81e9h
95e7 3a7684    ld      a,(8476h)
95ea 211600    ld      hl,0016h
95ed e5        push    hl
95ee 210300    ld      hl,0003h
95f1 d1        pop     de
95f2 cdd889    call    89d8h
95f5 21fb95    ld      hl,95fbh
95f8 c30296    jp      9602h
95fb 43        ld      b,e
95fc 2050      jr      nz,964eh
95fe 2055      jr      nz,9655h
9600 2000      jr      nz,9602h
9602 cde981    call    81e9h
9605 3a7684    ld      a,(8476h)
9608 211400    ld      hl,0014h
960b e5        push    hl
960c 211500    ld      hl,0015h
960f d1        pop     de
9610 cdd889    call    89d8h
9613 211996    ld      hl,9619h
9616 c32396    jp      9623h
9619 6a        ld      l,d
961a 6f        ld      l,a
961b 79        ld      a,c
961c 73        ld      (hl),e
961d 74        ld      (hl),h
961e 69        ld      l,c
961f 63        ld      h,e
9620 6b        ld      l,e
9621 3200cd    ld      (0cd00h),a
9624 e9        jp      (hl)
9625 81        add     a,c
9626 3a7684    ld      a,(8476h)
9629 211500    ld      hl,0015h
962c e5        push    hl
962d 211700    ld      hl,0017h
9630 d1        pop     de
9631 cdd889    call    89d8h
9634 213a96    ld      hl,963ah
9637 c34196    jp      9641h
963a 50        ld      d,b
963b 4c        ld      c,h
963c 41        ld      b,c
963d 59        ld      e,c
963e 45        ld      b,l
963f 52        ld      d,d
9640 00        nop     
9641 cde981    call    81e9h
9644 3a7684    ld      a,(8476h)
9647 211600    ld      hl,0016h
964a e5        push    hl
964b 211800    ld      hl,0018h
964e d1        pop     de
964f cdd889    call    89d8h
9652 215896    ld      hl,9658h
9655 c35f96    jp      965fh
9658 43        ld      b,e
9659 2050      jr      nz,96abh
965b 2055      jr      nz,96b2h
965d 2000      jr      nz,965fh
965f cde981    call    81e9h
9662 3a7684    ld      a,(8476h)
9665 21ffff    ld      hl,0ffffh
9668 cd3986    call    8639h
966b ca9d96    jp      z,969dh
966e 210a00    ld      hl,000ah
9671 cdeb80    call    80ebh
9674 210100    ld      hl,0001h
9677 e5        push    hl
9678 210801    ld      hl,0108h
967b cd0a87    call    870ah
967e d1        pop     de
967f cdd185    call    85d1h
9682 cd3986    call    8639h
9685 ca8b96    jp      z,968bh
9688 c39d96    jp      969dh
968b 329096    ld      (9690h),a
968e 2aec00    ld      hl,(00ech)
9691 229596    ld      (9695h),hl
9694 cd9796    call    9697h
9697 3a7684    ld      a,(8476h)
969a c36596    jp      9665h
969d 210100    ld      hl,0001h
96a0 2215c0    ld      (0c015h),hl
96a3 210700    ld      hl,0007h
96a6 e5        push    hl
96a7 211500    ld      hl,0015h
96aa e5        push    hl
96ab 211e00    ld      hl,001eh
96ae e5        push    hl
96af 210200    ld      hl,0002h
96b2 e5        push    hl
96b3 210100    ld      hl,0001h
96b6 e5        push    hl
96b7 32bc96    ld      (96bch),a
96ba 2ad000    ld      hl,(00d0h)
96bd 22c196    ld      (96c1h),hl
96c0 cdc396    call    96c3h
96c3 3a7684    ld      a,(8476h)
96c6 32cb96    ld      (96cbh),a
96c9 2ada00    ld      hl,(00dah)
96cc 22d096    ld      (96d0h),hl
96cf cdd296    call    96d2h
96d2 3a7684    ld      a,(8476h)
96d5 210800    ld      hl,0008h
96d8 5d        ld      e,l
96d9 d5        push    de
96da 210000    ld      hl,0000h
96dd 7d        ld      a,l
96de d1        pop     de
96df c608      add     a,08h
96e1 cd9300    call    0093h
96e4 3a7684    ld      a,(8476h)
96e7 32ec96    ld      (96ech),a
96ea 2ad400    ld      hl,(00d4h)
96ed cd4d82    call    824dh
96f0 0100c6    ld      bc,0c600h
96f3 ed439182  ld      (8291h),bc
96f7 0100d2    ld      bc,0d200h
96fa ed439482  ld      (8294h),bc
96fe 010000    ld      bc,0000h
9701 c5        push    bc
9702 01f3b7    ld      bc,0b7f3h
9705 c5        push    bc
9706 cd3a84    call    843ah
9709 2217c0    ld      (0c017h),hl
970c 212d00    ld      hl,002dh
970f e5        push    hl
9710 210000    ld      hl,0000h
9713 7d        ld      a,l
9714 e1        pop     hl
9715 cd8790    call    9087h
9718 3a7684    ld      a,(8476h)
971b 210300    ld      hl,0003h
971e 322397    ld      (9723h),a
9721 22e200    ld      (00e2h),hl
9724 210000    ld      hl,0000h
9727 e5        push    hl
9728 322d97    ld      (972dh),a
972b 2ae200    ld      hl,(00e2h)
972e d1        pop     de
972f cd0f86    call    860fh
9732 cd3986    call    8639h
9735 caf097    jp      z,97f0h
9738 210a00    ld      hl,000ah
973b e5        push    hl
973c 210e00    ld      hl,000eh
973f d1        pop     de
9740 cdd889    call    89d8h
9743 210000    ld      hl,0000h
9746 e5        push    hl
9747 324c97    ld      (974ch),a
974a 2ae200    ld      hl,(00e2h)
974d d1        pop     de
974e cdd185    call    85d1h
9751 cd3986    call    8639h
9754 ca7f97    jp      z,977fh
9757 210c00    ld      hl,000ch
975a e5        push    hl
975b 212d00    ld      hl,002dh
975e d1        pop     de
975f 19        add     hl,de
9760 e5        push    hl
9761 210000    ld      hl,0000h
9764 7d        ld      a,l
9765 e1        pop     hl
9766 cd8790    call    9087h
9769 3a7684    ld      a,(8476h)
976c 217297    ld      hl,9772h
976f c37697    jp      9776h
9772 47        ld      b,a
9773 4f        ld      c,a
9774 2100cd    ld      hl,0cd00h
9777 e9        jp      (hl)
9778 81        add     a,c
9779 3a7684    ld      a,(8476h)
977c c38b97    jp      978bh
977f 328497    ld      (9784h),a
9782 2ae200    ld      hl,(00e2h)
9785 cd4090    call    9040h
9788 3a7684    ld      a,(8476h)
978b 210f00    ld      hl,000fh
978e 329397    ld      (9793h),a
9791 22e000    ld      (00e0h),hl
9794 210000    ld      hl,0000h
9797 e5        push    hl
9798 329d97    ld      (979dh),a
979b 2ae000    ld      hl,(00e0h)
979e d1        pop     de
979f cd0f86    call    860fh
97a2 cd3986    call    8639h
97a5 cae097    jp      z,97e0h
97a8 32ad97    ld      (97adh),a
97ab 2ae000    ld      hl,(00e0h)
97ae 5d        ld      e,l
97af d5        push    de
97b0 210000    ld      hl,0000h
97b3 7d        ld      a,l
97b4 d1        pop     de
97b5 c608      add     a,08h
97b7 cd9300    call    0093h
97ba 3a7684    ld      a,(8476h)
97bd 210400    ld      hl,0004h
97c0 e5        push    hl
97c1 32c697    ld      (97c6h),a
97c4 2ae600    ld      hl,(00e6h)
97c7 22cb97    ld      (97cbh),hl
97ca cdcd97    call    97cdh
97cd 3a7684    ld      a,(8476h)
97d0 32d597    ld      (97d5h),a
97d3 2ae000    ld      hl,(00e0h)
97d6 2b        dec     hl
97d7 32dc97    ld      (97dch),a
97da 22e000    ld      (00e0h),hl
97dd c39497    jp      9794h
97e0 32e597    ld      (97e5h),a
97e3 2ae200    ld      hl,(00e2h)
97e6 2b        dec     hl
97e7 32ec97    ld      (97ech),a
97ea 22e200    ld      (00e2h),hl
97ed c32497    jp      9724h
97f0 210700    ld      hl,0007h
97f3 e5        push    hl
97f4 211500    ld      hl,0015h
97f7 e5        push    hl
97f8 211e00    ld      hl,001eh
97fb e5        push    hl
97fc 210200    ld      hl,0002h
97ff e5        push    hl
9800 210100    ld      hl,0001h
9803 e5        push    hl
9804 320998    ld      (9809h),a
9807 2ad000    ld      hl,(00d0h)
980a 220e98    ld      (980eh),hl
980d cd1098    call    9810h
9810 3a7684    ld      a,(8476h)
9813 210200    ld      hl,0002h
9816 2215c0    ld      (0c015h),hl
9819 3a7684    ld      a,(8476h)
981c f5        push    af
981d 2aacbc    ld      hl,(0bcach)
9820 e5        push    hl
9821 2a17c0    ld      hl,(0c017h)
9824 7c        ld      a,h
9825 327684    ld      (8476h),a
9828 322d98    ld      (982dh),a
982b 2adc00    ld      hl,(00dch)
982e 223298    ld      (9832h),hl
9831 cd3498    call    9834h
9834 e3        ex      (sp),hl
9835 7c        ld      a,h
9836 e1        pop     hl
9837 327684    ld      (8476h),a
983a 210000    ld      hl,0000h
983d 324298    ld      (9842h),a
9840 22f200    ld      (00f2h),hl
9843 210000    ld      hl,0000h
9846 324b98    ld      (984bh),a
9849 22f000    ld      (00f0h),hl
984c 3a7684    ld      a,(8476h)
984f f5        push    af
9850 213c00    ld      hl,003ch
9853 e5        push    hl
9854 211e00    ld      hl,001eh
9857 d1        pop     de
9858 cd9331    call    3193h
985b e3        ex      (sp),hl
985c 7c        ld      a,h
985d e1        pop     hl
985e 327684    ld      (8476h),a
9861 2219c0    ld      (0c019h),hl
9864 210000    ld      hl,0000h
9867 e5        push    hl
9868 2a19c0    ld      hl,(0c019h)
986b d1        pop     de
986c cd0f86    call    860fh
986f cd3986    call    8639h
9872 ca359a    jp      z,9a35h
9875 210000    ld      hl,0000h
9878 e5        push    hl
9879 211e00    ld      hl,001eh
987c cdeb80    call    80ebh
987f d1        pop     de
9880 cdd185    call    85d1h
9883 cd3986    call    8639h
9886 ca9199    jp      z,9991h
9889 210800    ld      hl,0008h
988c e5        push    hl
988d 3a7684    ld      a,(8476h)
9890 f5        push    af
9891 210100    ld      hl,0001h
9894 e5        push    hl
9895 211e00    ld      hl,001eh
9898 cdeb80    call    80ebh
989b d1        pop     de
989c 19        add     hl,de
989d e5        push    hl
989e 211000    ld      hl,0010h
98a1 d1        pop     de
98a2 cd9331    call    3193h
98a5 e3        ex      (sp),hl
98a6 7c        ld      a,h
98a7 e1        pop     hl
98a8 327684    ld      (8476h),a
98ab d1        pop     de
98ac 19        add     hl,de
98ad 32b298    ld      (98b2h),a
98b0 22f600    ld      (00f6h),hl
98b3 210800    ld      hl,0008h
98b6 e5        push    hl
98b7 3a7684    ld      a,(8476h)
98ba f5        push    af
98bb 210300    ld      hl,0003h
98be e5        push    hl
98bf 211400    ld      hl,0014h
98c2 cdeb80    call    80ebh
98c5 d1        pop     de
98c6 19        add     hl,de
98c7 e5        push    hl
98c8 211000    ld      hl,0010h
98cb d1        pop     de
98cc cd9331    call    3193h
98cf e3        ex      (sp),hl
98d0 7c        ld      a,h
98d1 e1        pop     hl
98d2 327684    ld      (8476h),a
98d5 d1        pop     de
98d6 19        add     hl,de
98d7 32dc98    ld      (98dch),a
98da 22f400    ld      (00f4h),hl
98dd 210300    ld      hl,0003h
98e0 e5        push    hl
98e1 32e698    ld      (98e6h),a
98e4 2af400    ld      hl,(00f4h)
98e7 e5        push    hl
98e8 32ed98    ld      (98edh),a
98eb 2af600    ld      hl,(00f6h)
98ee d1        pop     de
98ef cdc289    call    89c2h
98f2 2600      ld      h,00h
98f4 6f        ld      l,a
98f5 3a7684    ld      a,(8476h)
98f8 d1        pop     de
98f9 a7        and     a
98fa ed52      sbc     hl,de
98fc 320199    ld      (9901h),a
98ff 22f000    ld      (00f0h),hl
9902 210000    ld      hl,0000h
9905 e5        push    hl
9906 320b99    ld      (990bh),a
9909 2af000    ld      hl,(00f0h)
990c d1        pop     de
990d cd0f86    call    860fh
9910 cd3986    call    8639h
9913 ca2499    jp      z,9924h
9916 210400    ld      hl,0004h
9919 e5        push    hl
991a 321f99    ld      (991fh),a
991d 2af000    ld      hl,(00f0h)
9920 d1        pop     de
9921 cd0086    call    8600h
9924 cd3986    call    8639h
9927 ca8899    jp      z,9988h
992a 322f99    ld      (992fh),a
992d 2af600    ld      hl,(00f6h)
9930 e5        push    hl
9931 01f600    ld      bc,00f6h
9934 c5        push    bc
9935 323a99    ld      (993ah),a
9938 2af400    ld      hl,(00f4h)
993b e5        push    hl
993c 01f400    ld      bc,00f4h
993f c5        push    bc
9940 324599    ld      (9945h),a
9943 2af000    ld      hl,(00f0h)
9946 e5        push    hl
9947 01da00    ld      bc,00dah
994a c5        push    bc
994b 0100d6    ld      bc,0d600h
994e ed439182  ld      (8291h),bc
9952 0100da    ld      bc,0da00h
9955 ed439482  ld      (8294h),bc
9959 010300    ld      bc,0003h
995c c5        push    bc
995d 0155a1    ld      bc,0a155h
9960 c5        push    bc
9961 cd3a84    call    843ah
9964 3a7684    ld      a,(8476h)
9967 f5        push    af
9968 2a78bf    ld      hl,(0bf78h)
996b e5        push    hl
996c 2a17c0    ld      hl,(0c017h)
996f 7c        ld      a,h
9970 327684    ld      (8476h),a
9973 327899    ld      (9978h),a
9976 2ada00    ld      hl,(00dah)
9979 227d99    ld      (997dh),hl
997c cd7f99    call    997fh
997f e3        ex      (sp),hl
9980 7c        ld      a,h
9981 e1        pop     hl
9982 327684    ld      (8476h),a
9985 c38899    jp      9988h
9988 210000    ld      hl,0000h
998b 329099    ld      (9990h),a
998e 22f000    ld      (00f0h),hl
9991 210000    ld      hl,0000h
9994 e5        push    hl
9995 3a7684    ld      a,(8476h)
9998 f5        push    af
9999 2a19c0    ld      hl,(0c019h)
999c e5        push    hl
999d 211e00    ld      hl,001eh
99a0 d1        pop     de
99a1 cd3a32    call    323ah
99a4 e3        ex      (sp),hl
99a5 7c        ld      a,h
99a6 e1        pop     hl
99a7 327684    ld      (8476h),a
99aa d1        pop     de
99ab cdd185    call    85d1h
99ae cd3986    call    8639h
99b1 caf799    jp      z,99f7h
99b4 211700    ld      hl,0017h
99b7 e5        push    hl
99b8 210e00    ld      hl,000eh
99bb d1        pop     de
99bc cdd889    call    89d8h
99bf 3a7684    ld      a,(8476h)
99c2 f5        push    af
99c3 2a19c0    ld      hl,(0c019h)
99c6 e5        push    hl
99c7 211e00    ld      hl,001eh
99ca d1        pop     de
99cb cde631    call    31e6h
99ce e3        ex      (sp),hl
99cf 7c        ld      a,h
99d0 e1        pop     hl
99d1 327684    ld      (8476h),a
99d4 cd4090    call    9040h
99d7 3a7684    ld      a,(8476h)
99da 21e099    ld      hl,99e0h
99dd c3e299    jp      99e2h
99e0 2000      jr      nz,99e2h
99e2 cde981    call    81e9h
99e5 3a7684    ld      a,(8476h)
99e8 32ed99    ld      (99edh),a
99eb 2ad200    ld      hl,(00d2h)
99ee 22f299    ld      (99f2h),hl
99f1 cdf499    call    99f4h
99f4 3a7684    ld      a,(8476h)
99f7 3a7684    ld      a,(8476h)
99fa f5        push    af
99fb 2a19c0    ld      hl,(0c019h)
99fe e5        push    hl
99ff 210400    ld      hl,0004h
9a02 d1        pop     de
9a03 cd3a32    call    323ah
9a06 e3        ex      (sp),hl
9a07 7c        ld      a,h
9a08 e1        pop     hl
9a09 327684    ld      (8476h),a
9a0c e5        push    hl
9a0d 32129a    ld      (9a12h),a
9a10 2adc00    ld      hl,(00dch)
9a13 22179a    ld      (9a17h),hl
9a16 cd199a    call    9a19h
9a19 3a7684    ld      a,(8476h)
9a1c 2a19c0    ld      hl,(0c019h)
9a1f 2b        dec     hl
9a20 2219c0    ld      (0c019h),hl
9a23 32289a    ld      (9a28h),a
9a26 2aec00    ld      hl,(00ech)
9a29 222d9a    ld      (9a2dh),hl
9a2c cd2f9a    call    9a2fh
9a2f 3a7684    ld      a,(8476h)
9a32 c36498    jp      9864h
9a35 3a7684    ld      a,(8476h)
9a38 f5        push    af
9a39 2a17be    ld      hl,(0be17h)
9a3c e5        push    hl
9a3d 2a17c0    ld      hl,(0c017h)
9a40 7c        ld      a,h
9a41 327684    ld      (8476h),a
9a44 32499a    ld      (9a49h),a
9a47 2ada00    ld      hl,(00dah)
9a4a 224e9a    ld      (9a4eh),hl
9a4d cd509a    call    9a50h
9a50 e3        ex      (sp),hl
9a51 7c        ld      a,h
9a52 e1        pop     hl
9a53 327684    ld      (8476h),a
9a56 3a7684    ld      a,(8476h)
9a59 f5        push    af
9a5a 2a17c0    ld      hl,(0c017h)
9a5d 7c        ld      a,h
9a5e 327684    ld      (8476h),a
9a61 32669a    ld      (9a66h),a
9a64 2ad400    ld      hl,(00d4h)
9a67 226b9a    ld      (9a6bh),hl
9a6a cd6d9a    call    9a6dh
9a6d e3        ex      (sp),hl
9a6e 7c        ld      a,h
9a6f e1        pop     hl
9a70 327684    ld      (8476h),a
9a73 32789a    ld      (9a78h),a
9a76 2ada00    ld      hl,(00dah)
9a79 227d9a    ld      (9a7dh),hl
9a7c cd7f9a    call    9a7fh
9a7f 3a7684    ld      a,(8476h)
9a82 32879a    ld      (9a87h),a
9a85 2ade00    ld      hl,(00deh)
9a88 228c9a    ld      (9a8ch),hl
9a8b cd8e9a    call    9a8eh
9a8e 3a7684    ld      a,(8476h)
9a91 211e00    ld      hl,001eh
9a94 e5        push    hl
9a95 329a9a    ld      (9a9ah),a
9a98 2ae600    ld      hl,(00e6h)
9a9b 229f9a    ld      (9a9fh),hl
9a9e cda19a    call    9aa1h
9aa1 3a7684    ld      a,(8476h)
9aa4 210c00    ld      hl,000ch
9aa7 e5        push    hl
9aa8 210900    ld      hl,0009h
9aab d1        pop     de
9aac cdd889    call    89d8h
9aaf 21b59a    ld      hl,9ab5h
9ab2 c3c59a    jp      9ac5h
9ab5 50        ld      d,b
9ab6 72        ld      (hl),d
9ab7 65        ld      h,l
9ab8 73        ld      (hl),e
9ab9 73        ld      (hl),e
9aba 2053      jr      nz,9b0fh
9abc 70        ld      (hl),b
9abd 61        ld      h,c
9abe 63        ld      h,e
9abf 65        ld      h,l
9ac0 204b      jr      nz,9b0dh
9ac2 65        ld      h,l
9ac3 79        ld      a,c
9ac4 00        nop     
9ac5 cde981    call    81e9h
9ac8 3a7684    ld      a,(8476h)
9acb 21ffff    ld      hl,0ffffh
9ace cd3986    call    8639h
9ad1 ca199b    jp      z,9b19h
9ad4 210100    ld      hl,0001h
9ad7 e5        push    hl
9ad8 210801    ld      hl,0108h
9adb cd0a87    call    870ah
9ade d1        pop     de
9adf cdd185    call    85d1h
9ae2 cd3986    call    8639h
9ae5 ca079b    jp      z,9b07h
9ae8 cd5482    call    8254h
9aeb cd2a89    call    892ah
9aee 0100c6    ld      bc,0c600h
9af1 ed439182  ld      (8291h),bc
9af5 0100d2    ld      bc,0d200h
9af8 ed439482  ld      (8294h),bc
9afc 010000    ld      bc,0000h
9aff c5        push    bc
9b00 01d491    ld      bc,91d4h
9b03 c5        push    bc
9b04 cd3a84    call    843ah
9b07 320c9b    ld      (9b0ch),a
9b0a 2aec00    ld      hl,(00ech)
9b0d 22119b    ld      (9b11h),hl
9b10 cd139b    call    9b13h
9b13 3a7684    ld      a,(8476h)
9b16 c3cb9a    jp      9acbh
9b19 ddf9      ld      sp,ix
9b1b dde1      pop     ix
9b1d c9        ret     

9b1e cd1580    call    8015h
9b21 dde5      push    ix
9b23 dd210000  ld      ix,0000h
9b27 dd39      add     ix,sp
9b29 e5        push    hl
9b2a 3ed6      ld      a,0d6h
9b2c feda      cp      0dah
9b2e d28b9b    jp      nc,9b8bh
9b31 f5        push    af
9b32 67        ld      h,a
9b33 2e00      ld      l,00h
9b35 cd449b    call    9b44h
9b38 e3        ex      (sp),hl
9b39 7c        ld      a,h
9b3a e1        pop     hl
9b3b 67        ld      h,a
9b3c 2e00      ld      l,00h
9b3e da8b9b    jp      c,9b8bh
9b41 3c        inc     a
9b42 18e8      jr      9b2ch
9b44 cd8782    call    8287h
9b47 2002      jr      nz,9b4bh
9b49 b7        or      a
9b4a c9        ret     

9b4b 3a7684    ld      a,(8476h)
9b4e bc        cp      h
9b4f 2002      jr      nz,9b53h
9b51 b7        or      a
9b52 c9        ret     

9b53 e5        push    hl
9b54 7c        ld      a,h
9b55 1155a1    ld      de,0a155h
9b58 cdb084    call    84b0h
9b5b 3a7684    ld      a,(8476h)
9b5e e1        pop     hl
9b5f 2802      jr      z,9b63h
9b61 b7        or      a
9b62 c9        ret     

9b63 dd74ff    ld      (ix-01h),h
9b66 dd75fe    ld      (ix-02h),l
9b69 3a7684    ld      a,(8476h)
9b6c f5        push    af
9b6d dd66ff    ld      h,(ix-01h)
9b70 dd6efe    ld      l,(ix-02h)
9b73 7c        ld      a,h
9b74 327684    ld      (8476h),a
9b77 327c9b    ld      (9b7ch),a
9b7a 2ae800    ld      hl,(00e8h)
9b7d 22819b    ld      (9b81h),hl
9b80 cd839b    call    9b83h
9b83 e3        ex      (sp),hl
9b84 7c        ld      a,h
9b85 e1        pop     hl
9b86 327684    ld      (8476h),a
9b89 b7        or      a
9b8a c9        ret     

9b8b 3a7684    ld      a,(8476h)
9b8e 210000    ld      hl,0000h
9b91 2213c0    ld      (0c013h),hl
9b94 210000    ld      hl,0000h
9b97 329c9b    ld      (9b9ch),a
9b9a 22e200    ld      (00e2h),hl
9b9d 210400    ld      hl,0004h
9ba0 e5        push    hl
9ba1 32a69b    ld      (9ba6h),a
9ba4 2ae200    ld      hl,(00e2h)
9ba7 d1        pop     de
9ba8 cd0086    call    8600h
9bab cd3986    call    8639h
9bae cafe9b    jp      z,9bfeh
9bb1 2a13c0    ld      hl,(0c013h)
9bb4 e5        push    hl
9bb5 32ba9b    ld      (9bbah),a
9bb8 2ae200    ld      hl,(00e2h)
9bbb e5        push    hl
9bbc 2ae1bf    ld      hl,(0bfe1h)
9bbf d1        pop     de
9bc0 cb23      sla     e
9bc2 cb12      rl      d
9bc4 19        add     hl,de
9bc5 22c99b    ld      (9bc9h),hl
9bc8 2a0000    ld      hl,(0000h)
9bcb d1        pop     de
9bcc cdeb85    call    85ebh
9bcf cd3986    call    8639h
9bd2 caee9b    jp      z,9beeh
9bd5 32da9b    ld      (9bdah),a
9bd8 2ae200    ld      hl,(00e2h)
9bdb e5        push    hl
9bdc 2ae1bf    ld      hl,(0bfe1h)
9bdf d1        pop     de
9be0 cb23      sla     e
9be2 cb12      rl      d
9be4 19        add     hl,de
9be5 22e99b    ld      (9be9h),hl
9be8 2a0000    ld      hl,(0000h)
9beb 2213c0    ld      (0c013h),hl
9bee 32f39b    ld      (9bf3h),a
9bf1 2ae200    ld      hl,(00e2h)
9bf4 23        inc     hl
9bf5 32fa9b    ld      (9bfah),a
9bf8 22e200    ld      (00e2h),hl
9bfb c39d9b    jp      9b9dh
9bfe ddf9      ld      sp,ix
9c00 dde1      pop     ix
9c02 c9        ret     

9c03 cd1580    call    8015h
9c06 dde5      push    ix
9c08 dd210000  ld      ix,0000h
9c0c dd39      add     ix,sp
9c0e 210000    ld      hl,0000h
9c11 e5        push    hl
9c12 210100    ld      hl,0001h
9c15 e5        push    hl
9c16 3a7684    ld      a,(8476h)
9c19 f5        push    af
9c1a dd6e04    ld      l,(ix+04h)
9c1d dd6605    ld      h,(ix+05h)
9c20 e5        push    hl
9c21 210800    ld      hl,0008h
9c24 d1        pop     de
9c25 cd9331    call    3193h
9c28 e3        ex      (sp),hl
9c29 7c        ld      a,h
9c2a e1        pop     hl
9c2b 327684    ld      (8476h),a
9c2e d1        pop     de
9c2f 19        add     hl,de
9c30 d1        pop     de
9c31 cdd889    call    89d8h
9c34 dd6e04    ld      l,(ix+04h)
9c37 dd6605    ld      h,(ix+05h)
9c3a e5        push    hl
9c3b 2ae1bf    ld      hl,(0bfe1h)
9c3e d1        pop     de
9c3f cb23      sla     e
9c41 cb12      rl      d
9c43 19        add     hl,de
9c44 22489c    ld      (9c48h),hl
9c47 2a0000    ld      hl,(0000h)
9c4a cd4090    call    9040h
9c4d 3a7684    ld      a,(8476h)
9c50 21569c    ld      hl,9c56h
9c53 c3589c    jp      9c58h
9c56 2000      jr      nz,9c58h
9c58 cde981    call    81e9h
9c5b 3a7684    ld      a,(8476h)
9c5e ddf9      ld      sp,ix
9c60 dde1      pop     ix
9c62 d9        exx     
9c63 c1        pop     bc
9c64 33        inc     sp
9c65 33        inc     sp
9c66 c5        push    bc
9c67 d9        exx     
9c68 c9        ret     

9c69 cd1580    call    8015h
9c6c dde5      push    ix
9c6e dd210000  ld      ix,0000h
9c72 dd39      add     ix,sp
9c74 e5        push    hl
9c75 210000    ld      hl,0000h
9c78 dd74ff    ld      (ix-01h),h
9c7b dd75fe    ld      (ix-02h),l
9c7e 210400    ld      hl,0004h
9c81 e5        push    hl
9c82 dd66ff    ld      h,(ix-01h)
9c85 dd6efe    ld      l,(ix-02h)
9c88 d1        pop     de
9c89 cd0086    call    8600h
9c8c cd3986    call    8639h
9c8f cab89c    jp      z,9cb8h
9c92 dd66ff    ld      h,(ix-01h)
9c95 dd6efe    ld      l,(ix-02h)
9c98 e5        push    hl
9c99 329e9c    ld      (9c9eh),a
9c9c 2adc00    ld      hl,(00dch)
9c9f 22a39c    ld      (9ca3h),hl
9ca2 cda59c    call    9ca5h
9ca5 3a7684    ld      a,(8476h)
9ca8 dd66ff    ld      h,(ix-01h)
9cab dd6efe    ld      l,(ix-02h)
9cae 23        inc     hl
9caf dd74ff    ld      (ix-01h),h
9cb2 dd75fe    ld      (ix-02h),l
9cb5 c37e9c    jp      9c7eh
9cb8 ddf9      ld      sp,ix
9cba dde1      pop     ix
9cbc c9        ret     

9cbd cd1580    call    8015h
9cc0 dde5      push    ix
9cc2 dd210000  ld      ix,0000h
9cc6 dd39      add     ix,sp
9cc8 210000    ld      hl,0000h
9ccb e5        push    hl
9ccc 210100    ld      hl,0001h
9ccf e5        push    hl
9cd0 3a7684    ld      a,(8476h)
9cd3 f5        push    af
9cd4 dd6e04    ld      l,(ix+04h)
9cd7 dd6605    ld      h,(ix+05h)
9cda e5        push    hl
9cdb 210800    ld      hl,0008h
9cde d1        pop     de
9cdf cd9331    call    3193h
9ce2 e3        ex      (sp),hl
9ce3 7c        ld      a,h
9ce4 e1        pop     hl
9ce5 327684    ld      (8476h),a
9ce8 d1        pop     de
9ce9 19        add     hl,de
9cea d1        pop     de
9ceb cdd889    call    89d8h
9cee dd6e04    ld      l,(ix+04h)
9cf1 dd6605    ld      h,(ix+05h)
9cf4 e5        push    hl
9cf5 2a09c0    ld      hl,(0c009h)
9cf8 d1        pop     de
9cf9 cb23      sla     e
9cfb cb12      rl      d
9cfd 19        add     hl,de
9cfe 22029d    ld      (9d02h),hl
9d01 2a0000    ld      hl,(0000h)
9d04 cd4090    call    9040h
9d07 3a7684    ld      a,(8476h)
9d0a 21109d    ld      hl,9d10h
9d0d c3129d    jp      9d12h
9d10 2000      jr      nz,9d12h
9d12 cde981    call    81e9h
9d15 3a7684    ld      a,(8476h)
9d18 ddf9      ld      sp,ix
9d1a dde1      pop     ix
9d1c d9        exx     
9d1d c1        pop     bc
9d1e 33        inc     sp
9d1f 33        inc     sp
9d20 c5        push    bc
9d21 d9        exx     
9d22 c9        ret     

9d23 cd1580    call    8015h
9d26 dde5      push    ix
9d28 dd210000  ld      ix,0000h
9d2c dd39      add     ix,sp
9d2e e5        push    hl
9d2f 210000    ld      hl,0000h
9d32 dd74ff    ld      (ix-01h),h
9d35 dd75fe    ld      (ix-02h),l
9d38 210400    ld      hl,0004h
9d3b e5        push    hl
9d3c dd66ff    ld      h,(ix-01h)
9d3f dd6efe    ld      l,(ix-02h)
9d42 d1        pop     de
9d43 cd0086    call    8600h
9d46 cd3986    call    8639h
9d49 ca729d    jp      z,9d72h
9d4c dd66ff    ld      h,(ix-01h)
9d4f dd6efe    ld      l,(ix-02h)
9d52 e5        push    hl
9d53 32589d    ld      (9d58h),a
9d56 2ad800    ld      hl,(00d8h)
9d59 225d9d    ld      (9d5dh),hl
9d5c cd5f9d    call    9d5fh
9d5f 3a7684    ld      a,(8476h)
9d62 dd66ff    ld      h,(ix-01h)
9d65 dd6efe    ld      l,(ix-02h)
9d68 23        inc     hl
9d69 dd74ff    ld      (ix-01h),h
9d6c dd75fe    ld      (ix-02h),l
9d6f c3389d    jp      9d38h
9d72 ddf9      ld      sp,ix
9d74 dde1      pop     ix
9d76 c9        ret     

9d77 cd1580    call    8015h
9d7a dde5      push    ix
9d7c dd210000  ld      ix,0000h
9d80 dd39      add     ix,sp
9d82 3a7684    ld      a,(8476h)
9d85 f5        push    af
9d86 2a17c0    ld      hl,(0c017h)
9d89 7c        ld      a,h
9d8a 327684    ld      (8476h),a
9d8d 32929d    ld      (9d92h),a
9d90 2ad800    ld      hl,(00d8h)
9d93 22979d    ld      (9d97h),hl
9d96 cd999d    call    9d99h
9d99 e3        ex      (sp),hl
9d9a 7c        ld      a,h
9d9b e1        pop     hl
9d9c 327684    ld      (8476h),a
9d9f ddf9      ld      sp,ix
9da1 dde1      pop     ix
9da3 c9        ret     

9da4 cd1580    call    8015h
9da7 dde5      push    ix
9da9 dd210000  ld      ix,0000h
9dad dd39      add     ix,sp
9daf e5        push    hl
9db0 3ed2      ld      a,0d2h
9db2 fed6      cp      0d6h
9db4 d2059e    jp      nc,9e05h
9db7 f5        push    af
9db8 67        ld      h,a
9db9 2e00      ld      l,00h
9dbb cdca9d    call    9dcah
9dbe e3        ex      (sp),hl
9dbf 7c        ld      a,h
9dc0 e1        pop     hl
9dc1 67        ld      h,a
9dc2 2e00      ld      l,00h
9dc4 da059e    jp      c,9e05h
9dc7 3c        inc     a
9dc8 18e8      jr      9db2h
9dca cd8782    call    8287h
9dcd 2002      jr      nz,9dd1h
9dcf b7        or      a
9dd0 c9        ret     

9dd1 3a7684    ld      a,(8476h)
9dd4 bc        cp      h
9dd5 2002      jr      nz,9dd9h
9dd7 b7        or      a
9dd8 c9        ret     

9dd9 e5        push    hl
9dda 7c        ld      a,h
9ddb 1101a7    ld      de,0a701h
9dde cdb084    call    84b0h
9de1 3a7684    ld      a,(8476h)
9de4 e1        pop     hl
9de5 2802      jr      z,9de9h
9de7 b7        or      a
9de8 c9        ret     

9de9 dd74ff    ld      (ix-01h),h
9dec dd75fe    ld      (ix-02h),l
9def 210000    ld      hl,0000h
9df2 e5        push    hl
9df3 dd66ff    ld      h,(ix-01h)
9df6 dd6efe    ld      l,(ix-02h)
9df9 2ee2      ld      l,0e2h
9dfb d1        pop     de
9dfc 22019e    ld      (9e01h),hl
9dff ed530000  ld      (0000h),de
9e03 b7        or      a
9e04 c9        ret     

9e05 3a7684    ld      a,(8476h)
9e08 3ed6      ld      a,0d6h
9e0a feda      cp      0dah
9e0c d2b59e    jp      nc,9eb5h
9e0f f5        push    af
9e10 67        ld      h,a
9e11 2e00      ld      l,00h
9e13 cd229e    call    9e22h
9e16 e3        ex      (sp),hl
9e17 7c        ld      a,h
9e18 e1        pop     hl
9e19 67        ld      h,a
9e1a 2e00      ld      l,00h
9e1c dab59e    jp      c,9eb5h
9e1f 3c        inc     a
9e20 18e8      jr      9e0ah
9e22 cd8782    call    8287h
9e25 2002      jr      nz,9e29h
9e27 b7        or      a
9e28 c9        ret     

9e29 3a7684    ld      a,(8476h)
9e2c bc        cp      h
9e2d 2002      jr      nz,9e31h
9e2f b7        or      a
9e30 c9        ret     

9e31 e5        push    hl
9e32 7c        ld      a,h
9e33 1155a1    ld      de,0a155h
9e36 cdb084    call    84b0h
9e39 3a7684    ld      a,(8476h)
9e3c e1        pop     hl
9e3d 2802      jr      z,9e41h
9e3f b7        or      a
9e40 c9        ret     

9e41 dd74ff    ld      (ix-01h),h
9e44 dd75fe    ld      (ix-02h),l
9e47 dd66ff    ld      h,(ix-01h)
9e4a dd6efe    ld      l,(ix-02h)
9e4d 54        ld      d,h
9e4e 1ed0      ld      e,0d0h
9e50 ed53559e  ld      (9e55h),de
9e54 2a0000    ld      hl,(0000h)
9e57 cd3986    call    8639h
9e5a cab39e    jp      z,9eb3h
9e5d dd66ff    ld      h,(ix-01h)
9e60 dd6efe    ld      l,(ix-02h)
9e63 54        ld      d,h
9e64 1eda      ld      e,0dah
9e66 ed536b9e  ld      (9e6bh),de
9e6a 2a0000    ld      hl,(0000h)
9e6d e5        push    hl
9e6e 2ad7bf    ld      hl,(0bfd7h)
9e71 d1        pop     de
9e72 cb23      sla     e
9e74 cb12      rl      d
9e76 19        add     hl,de
9e77 227b9e    ld      (9e7bh),hl
9e7a 2a0000    ld      hl,(0000h)
9e7d 54        ld      d,h
9e7e 1ee2      ld      e,0e2h
9e80 ed53859e  ld      (9e85h),de
9e84 2a0000    ld      hl,(0000h)
9e87 23        inc     hl
9e88 e5        push    hl
9e89 dd66ff    ld      h,(ix-01h)
9e8c dd6efe    ld      l,(ix-02h)
9e8f 54        ld      d,h
9e90 1eda      ld      e,0dah
9e92 ed53979e  ld      (9e97h),de
9e96 2a0000    ld      hl,(0000h)
9e99 e5        push    hl
9e9a 2ad7bf    ld      hl,(0bfd7h)
9e9d d1        pop     de
9e9e cb23      sla     e
9ea0 cb12      rl      d
9ea2 19        add     hl,de
9ea3 22a79e    ld      (9ea7h),hl
9ea6 2a0000    ld      hl,(0000h)
9ea9 2ee2      ld      l,0e2h
9eab d1        pop     de
9eac 22b19e    ld      (9eb1h),hl
9eaf ed530000  ld      (0000h),de
9eb3 b7        or      a
9eb4 c9        ret     

9eb5 3a7684    ld      a,(8476h)
9eb8 ddf9      ld      sp,ix
9eba dde1      pop     ix
9ebc c9        ret     

9ebd cd1580    call    8015h
9ec0 dde5      push    ix
9ec2 dd210000  ld      ix,0000h
9ec6 dd39      add     ix,sp
9ec8 e5        push    hl
9ec9 e5        push    hl
9eca 210000    ld      hl,0000h
9ecd dd74ff    ld      (ix-01h),h
9ed0 dd75fe    ld      (ix-02h),l
9ed3 dd6e0a    ld      l,(ix+0ah)
9ed6 dd660b    ld      h,(ix+0bh)
9ed9 e5        push    hl
9eda dd66ff    ld      h,(ix-01h)
9edd dd6efe    ld      l,(ix-02h)
9ee0 d1        pop     de
9ee1 cd0086    call    8600h
9ee4 cd3986    call    8639h
9ee7 ca599f    jp      z,9f59h
9eea 210000    ld      hl,0000h
9eed dd74fd    ld      (ix-03h),h
9ef0 dd75fc    ld      (ix-04h),l
9ef3 dd6e08    ld      l,(ix+08h)
9ef6 dd6609    ld      h,(ix+09h)
9ef9 e5        push    hl
9efa dd66fd    ld      h,(ix-03h)
9efd dd6efc    ld      l,(ix-04h)
9f00 d1        pop     de
9f01 cd0086    call    8600h
9f04 cd3986    call    8639h
9f07 ca499f    jp      z,9f49h
9f0a dd66ff    ld      h,(ix-01h)
9f0d dd6efe    ld      l,(ix-02h)
9f10 e5        push    hl
9f11 dd6e06    ld      l,(ix+06h)
9f14 dd6607    ld      h,(ix+07h)
9f17 d1        pop     de
9f18 19        add     hl,de
9f19 e5        push    hl
9f1a dd66fd    ld      h,(ix-03h)
9f1d dd6efc    ld      l,(ix-04h)
9f20 e5        push    hl
9f21 dd6e04    ld      l,(ix+04h)
9f24 dd6605    ld      h,(ix+05h)
9f27 d1        pop     de
9f28 19        add     hl,de
9f29 e5        push    hl
9f2a dd6e0c    ld      l,(ix+0ch)
9f2d dd660d    ld      h,(ix+0dh)
9f30 7d        ld      a,l
9f31 e1        pop     hl
9f32 d1        pop     de
9f33 cd8889    call    8988h
9f36 3a7684    ld      a,(8476h)
9f39 dd66fd    ld      h,(ix-03h)
9f3c dd6efc    ld      l,(ix-04h)
9f3f 23        inc     hl
9f40 dd74fd    ld      (ix-03h),h
9f43 dd75fc    ld      (ix-04h),l
9f46 c3f39e    jp      9ef3h
9f49 dd66ff    ld      h,(ix-01h)
9f4c dd6efe    ld      l,(ix-02h)
9f4f 23        inc     hl
9f50 dd74ff    ld      (ix-01h),h
9f53 dd75fe    ld      (ix-02h),l
9f56 c3d39e    jp      9ed3h
9f59 ddf9      ld      sp,ix
9f5b dde1      pop     ix
9f5d d9        exx     
9f5e c1        pop     bc
9f5f 33        inc     sp
9f60 33        inc     sp
9f61 33        inc     sp
9f62 33        inc     sp
9f63 33        inc     sp
9f64 33        inc     sp
9f65 33        inc     sp
9f66 33        inc     sp
9f67 33        inc     sp
9f68 33        inc     sp
9f69 c5        push    bc
9f6a d9        exx     
9f6b c9        ret     

9f6c cd1580    call    8015h
9f6f ae        xor     (hl)
9f70 87        add     a,a
9f71 01719f    ld      bc,9f71h
9f74 c5        push    bc
9f75 01c79f    ld      bc,9fc7h
9f78 c5        push    bc
9f79 010000    ld      bc,0000h
9f7c c5        push    bc
9f7d 010000    ld      bc,0000h
9f80 c5        push    bc
9f81 010000    ld      bc,0000h
9f84 c5        push    bc
9f85 010000    ld      bc,0000h
9f88 c5        push    bc
9f89 011788    ld      bc,8817h
9f8c c5        push    bc
9f8d 01f687    ld      bc,87f6h
9f90 c5        push    bc
9f91 011888    ld      bc,8818h
9f94 c5        push    bc
9f95 014f88    ld      bc,884fh
9f98 c5        push    bc
9f99 016588    ld      bc,8865h
9f9c c5        push    bc
9f9d 01c188    ld      bc,88c1h
9fa0 c5        push    bc
9fa1 010000    ld      bc,0000h
9fa4 c5        push    bc
9fa5 010000    ld      bc,0000h
9fa8 c5        push    bc
9fa9 010000    ld      bc,0000h
9fac c5        push    bc
9fad 010000    ld      bc,0000h
9fb0 c5        push    bc
9fb1 010000    ld      bc,0000h
9fb4 c5        push    bc
9fb5 01d79f    ld      bc,9fd7h
9fb8 c5        push    bc
9fb9 013b88    ld      bc,883bh
9fbc c5        push    bc
9fbd 018784    ld      bc,8487h
9fc0 c5        push    bc
9fc1 c39883    jp      8398h
9fc4 cd1580    call    8015h
9fc7 dde5      push    ix
9fc9 dd210000  ld      ix,0000h
9fcd dd39      add     ix,sp
9fcf ddf9      ld      sp,ix
9fd1 dde1      pop     ix
9fd3 c9        ret     

9fd4 cd1580    call    8015h
9fd7 dde5      push    ix
9fd9 dd210000  ld      ix,0000h
9fdd dd39      add     ix,sp
9fdf 210400    ld      hl,0004h
9fe2 e5        push    hl
9fe3 32e89f    ld      (9fe8h),a
9fe6 2af600    ld      hl,(00f6h)
9fe9 c1        pop     bc
9fea 41        ld      b,c
9feb cb2c      sra     h
9fed cb1d      rr      l
9fef 10fa      djnz    9febh
9ff1 32f69f    ld      (9ff6h),a
9ff4 22e000    ld      (00e0h),hl
9ff7 210400    ld      hl,0004h
9ffa e5        push    hl
9ffb 3200a0    ld      (0a000h),a
9ffe 2af400    ld      hl,(00f4h)
a001 c1        pop     bc
a002 41        ld      b,c
a003 cb2c      sra     h
a005 cb1d      rr      l
a007 10fa      djnz    0a003h
a009 320ea0    ld      (0a00eh),a
a00c 22de00    ld      (00deh),hl
a00f 210300    ld      hl,0003h
a012 e5        push    hl
a013 3218a0    ld      (0a018h),a
a016 2ade00    ld      hl,(00deh)
a019 e5        push    hl
a01a 321fa0    ld      (0a01fh),a
a01d 2ae000    ld      hl,(00e0h)
a020 d1        pop     de
a021 cd9289    call    8992h
a024 2600      ld      h,00h
a026 6f        ld      l,a
a027 3a7684    ld      a,(8476h)
a02a d1        pop     de
a02b a7        and     a
a02c ed52      sbc     hl,de
a02e 3233a0    ld      (0a033h),a
a031 22dc00    ld      (00dch),hl
a034 210000    ld      hl,0000h
a037 e5        push    hl
a038 323da0    ld      (0a03dh),a
a03b 2adc00    ld      hl,(00dch)
a03e d1        pop     de
a03f cd0086    call    8600h
a042 cd3986    call    8639h
a045 c256a0    jp      nz,0a056h
a048 210400    ld      hl,0004h
a04b e5        push    hl
a04c 3251a0    ld      (0a051h),a
a04f 2adc00    ld      hl,(00dch)
a052 d1        pop     de
a053 cdeb85    call    85ebh
a056 cd3986    call    8639h
a059 ca65a0    jp      z,0a065h
a05c 3261a0    ld      (0a061h),a
a05f 2ada00    ld      hl,(00dah)
a062 c34ba1    jp      0a14bh
a065 326aa0    ld      (0a06ah),a
a068 2ada00    ld      hl,(00dah)
a06b e5        push    hl
a06c 3271a0    ld      (0a071h),a
a06f 2adc00    ld      hl,(00dch)
a072 d1        pop     de
a073 cdde85    call    85deh
a076 cd3986    call    8639h
a079 ca42a1    jp      z,0a142h
a07c 210000    ld      hl,0000h
a07f e5        push    hl
a080 3285a0    ld      (0a085h),a
a083 2adc00    ld      hl,(00dch)
a086 d1        pop     de
a087 cd0f86    call    860fh
a08a cd3986    call    8639h
a08d ca9ea0    jp      z,0a09eh
a090 210400    ld      hl,0004h
a093 e5        push    hl
a094 3299a0    ld      (0a099h),a
a097 2adc00    ld      hl,(00dch)
a09a d1        pop     de
a09b cd0086    call    8600h
a09e cd3986    call    8639h
a0a1 cadea0    jp      z,0a0deh
a0a4 210100    ld      hl,0001h
a0a7 e5        push    hl
a0a8 32ada0    ld      (0a0adh),a
a0ab 2adc00    ld      hl,(00dch)
a0ae e5        push    hl
a0af 2ae1bf    ld      hl,(0bfe1h)
a0b2 d1        pop     de
a0b3 cb23      sla     e
a0b5 cb12      rl      d
a0b7 19        add     hl,de
a0b8 22bca0    ld      (0a0bch),hl
a0bb 2a0000    ld      hl,(0000h)
a0be d1        pop     de
a0bf a7        and     a
a0c0 ed52      sbc     hl,de
a0c2 e5        push    hl
a0c3 32c8a0    ld      (0a0c8h),a
a0c6 2adc00    ld      hl,(00dch)
a0c9 e5        push    hl
a0ca 2ae1bf    ld      hl,(0bfe1h)
a0cd d1        pop     de
a0ce cb23      sla     e
a0d0 cb12      rl      d
a0d2 19        add     hl,de
a0d3 d1        pop     de
a0d4 22d9a0    ld      (0a0d9h),hl
a0d7 ed530000  ld      (0000h),de
a0db c3eaa0    jp      0a0eah
a0de 32e3a0    ld      (0a0e3h),a
a0e1 2ada00    ld      hl,(00dah)
a0e4 32e9a0    ld      (0a0e9h),a
a0e7 22dc00    ld      (00dch),hl
a0ea 32efa0    ld      (0a0efh),a
a0ed 2ade00    ld      hl,(00deh)
a0f0 e5        push    hl
a0f1 32f6a0    ld      (0a0f6h),a
a0f4 2ae000    ld      hl,(00e0h)
a0f7 e5        push    hl
a0f8 210300    ld      hl,0003h
a0fb e5        push    hl
a0fc 3201a1    ld      (0a101h),a
a0ff 2ada00    ld      hl,(00dah)
a102 d1        pop     de
a103 19        add     hl,de
a104 7d        ld      a,l
a105 e1        pop     hl
a106 d1        pop     de
a107 cd8889    call    8988h
a10a 3a7684    ld      a,(8476h)
a10d 210100    ld      hl,0001h
a110 e5        push    hl
a111 3216a1    ld      (0a116h),a
a114 2ada00    ld      hl,(00dah)
a117 e5        push    hl
a118 2ae1bf    ld      hl,(0bfe1h)
a11b d1        pop     de
a11c cb23      sla     e
a11e cb12      rl      d
a120 19        add     hl,de
a121 2225a1    ld      (0a125h),hl
a124 2a0000    ld      hl,(0000h)
a127 d1        pop     de
a128 19        add     hl,de
a129 e5        push    hl
a12a 322fa1    ld      (0a12fh),a
a12d 2ada00    ld      hl,(00dah)
a130 e5        push    hl
a131 2ae1bf    ld      hl,(0bfe1h)
a134 d1        pop     de
a135 cb23      sla     e
a137 cb12      rl      d
a139 19        add     hl,de
a13a d1        pop     de
a13b 2240a1    ld      (0a140h),hl
a13e ed530000  ld      (0000h),de
a142 3247a1    ld      (0a147h),a
a145 2adc00    ld      hl,(00dch)
a148 c34ba1    jp      0a14bh
a14b ddf9      ld      sp,ix
a14d dde1      pop     ix
a14f c9        ret     

a150 cd1580    call    8015h
a153 71        ld      (hl),c
a154 9f        sbc     a,a
a155 0155a1    ld      bc,0a155h
a158 c5        push    bc
a159 01cfa1    ld      bc,0a1cfh
a15c c5        push    bc
a15d 010000    ld      bc,0000h
a160 c5        push    bc
a161 010000    ld      bc,0000h
a164 c5        push    bc
a165 010000    ld      bc,0000h
a168 c5        push    bc
a169 010000    ld      bc,0000h
a16c c5        push    bc
a16d 011788    ld      bc,8817h
a170 c5        push    bc
a171 01f687    ld      bc,87f6h
a174 c5        push    bc
a175 011888    ld      bc,8818h
a178 c5        push    bc
a179 014f88    ld      bc,884fh
a17c c5        push    bc
a17d 016588    ld      bc,8865h
a180 c5        push    bc
a181 01c188    ld      bc,88c1h
a184 c5        push    bc
a185 010000    ld      bc,0000h
a188 c5        push    bc
a189 010000    ld      bc,0000h
a18c c5        push    bc
a18d 010000    ld      bc,0000h
a190 c5        push    bc
a191 010000    ld      bc,0000h
a194 c5        push    bc
a195 010000    ld      bc,0000h
a198 c5        push    bc
a199 01d79f    ld      bc,9fd7h
a19c c5        push    bc
a19d 010000    ld      bc,0000h
a1a0 c5        push    bc
a1a1 010000    ld      bc,0000h
a1a4 c5        push    bc
a1a5 010000    ld      bc,0000h
a1a8 c5        push    bc
a1a9 010000    ld      bc,0000h
a1ac c5        push    bc
a1ad 010000    ld      bc,0000h
a1b0 c5        push    bc
a1b1 010000    ld      bc,0000h
a1b4 c5        push    bc
a1b5 010000    ld      bc,0000h
a1b8 c5        push    bc
a1b9 010000    ld      bc,0000h
a1bc c5        push    bc
a1bd 01e1a5    ld      bc,0a5e1h
a1c0 c5        push    bc
a1c1 013b88    ld      bc,883bh
a1c4 c5        push    bc
a1c5 018784    ld      bc,8487h
a1c8 c5        push    bc
a1c9 c39883    jp      8398h
a1cc cd1580    call    8015h
a1cf dde5      push    ix
a1d1 dd210000  ld      ix,0000h
a1d5 dd39      add     ix,sp
a1d7 210700    ld      hl,0007h
a1da 32dfa1    ld      (0a1dfh),a
a1dd 22f200    ld      (00f2h),hl
a1e0 210000    ld      hl,0000h
a1e3 32e8a1    ld      (0a1e8h),a
a1e6 22d600    ld      (00d6h),hl
a1e9 210000    ld      hl,0000h
a1ec 32f1a1    ld      (0a1f1h),a
a1ef 22d400    ld      (00d4h),hl
a1f2 32f7a1    ld      (0a1f7h),a
a1f5 2ada00    ld      hl,(00dah)
a1f8 e5        push    hl
a1f9 2aebbf    ld      hl,(0bfebh)
a1fc d1        pop     de
a1fd cb23      sla     e
a1ff cb12      rl      d
a201 19        add     hl,de
a202 2206a2    ld      (0a206h),hl
a205 2a0000    ld      hl,(0000h)
a208 320da2    ld      (0a20dh),a
a20b 22d200    ld      (00d2h),hl
a20e 210000    ld      hl,0000h
a211 3216a2    ld      (0a216h),a
a214 22d000    ld      (00d0h),hl
a217 3ed2      ld      a,0d2h
a219 fed6      cp      0d6h
a21b d27ba2    jp      nc,0a27bh
a21e f5        push    af
a21f 67        ld      h,a
a220 2e00      ld      l,00h
a222 cd31a2    call    0a231h
a225 e3        ex      (sp),hl
a226 7c        ld      a,h
a227 e1        pop     hl
a228 67        ld      h,a
a229 2e00      ld      l,00h
a22b da7ba2    jp      c,0a27bh
a22e 3c        inc     a
a22f 18e8      jr      0a219h
a231 cd8782    call    8287h
a234 2002      jr      nz,0a238h
a236 b7        or      a
a237 c9        ret     

a238 3a7684    ld      a,(8476h)
a23b bc        cp      h
a23c 2002      jr      nz,0a240h
a23e b7        or      a
a23f c9        ret     

a240 e5        push    hl
a241 7c        ld      a,h
a242 1101a7    ld      de,0a701h
a245 cdb084    call    84b0h
a248 3a7684    ld      a,(8476h)
a24b e1        pop     hl
a24c 2802      jr      z,0a250h
a24e b7        or      a
a24f c9        ret     

a250 3255a2    ld      (0a255h),a
a253 22ce00    ld      (00ceh),hl
a256 325ba2    ld      (0a25bh),a
a259 2ada00    ld      hl,(00dah)
a25c e5        push    hl
a25d 3262a2    ld      (0a262h),a
a260 2ace00    ld      hl,(00ceh)
a263 54        ld      d,h
a264 1eda      ld      e,0dah
a266 ed536ba2  ld      (0a26bh),de
a26a 2a0000    ld      hl,(0000h)
a26d d1        pop     de
a26e cdd185    call    85d1h
a271 cd3986    call    8639h
a274 ca79a2    jp      z,0a279h
a277 37        scf     
a278 c9        ret     

a279 b7        or      a
a27a c9        ret     

a27b 3a7684    ld      a,(8476h)
a27e 210000    ld      hl,0000h
a281 3286a2    ld      (0a286h),a
a284 22e200    ld      (00e2h),hl
a287 21ffff    ld      hl,0ffffh
a28a cd3986    call    8639h
a28d ca69a3    jp      z,0a369h
a290 210000    ld      hl,0000h
a293 e5        push    hl
a294 3a7684    ld      a,(8476h)
a297 f5        push    af
a298 329da2    ld      (0a29dh),a
a29b 2ae200    ld      hl,(00e2h)
a29e e5        push    hl
a29f 211400    ld      hl,0014h
a2a2 d1        pop     de
a2a3 cd3a32    call    323ah
a2a6 e3        ex      (sp),hl
a2a7 7c        ld      a,h
a2a8 e1        pop     hl
a2a9 327684    ld      (8476h),a
a2ac d1        pop     de
a2ad cdd185    call    85d1h
a2b0 cd3986    call    8639h
a2b3 ca01a3    jp      z,0a301h
a2b6 210f00    ld      hl,000fh
a2b9 32bea2    ld      (0a2beh),a
a2bc 22f000    ld      (00f0h),hl
a2bf 32c4a2    ld      (0a2c4h),a
a2c2 2ada00    ld      hl,(00dah)
a2c5 e5        push    hl
a2c6 210300    ld      hl,0003h
a2c9 e5        push    hl
a2ca 32cfa2    ld      (0a2cfh),a
a2cd 2af400    ld      hl,(00f4h)
a2d0 e5        push    hl
a2d1 32d6a2    ld      (0a2d6h),a
a2d4 2af600    ld      hl,(00f6h)
a2d7 d1        pop     de
a2d8 cdc289    call    89c2h
a2db 2600      ld      h,00h
a2dd 6f        ld      l,a
a2de 3a7684    ld      a,(8476h)
a2e1 d1        pop     de
a2e2 a7        and     a
a2e3 ed52      sbc     hl,de
a2e5 d1        pop     de
a2e6 cdde85    call    85deh
a2e9 cd3986    call    8639h
a2ec cafea2    jp      z,0a2feh
a2ef 32f4a2    ld      (0a2f4h),a
a2f2 2ae800    ld      hl,(00e8h)
a2f5 22f9a2    ld      (0a2f9h),hl
a2f8 cdfba2    call    0a2fbh
a2fb 3a7684    ld      a,(8476h)
a2fe c30da3    jp      0a30dh
a301 3206a3    ld      (0a306h),a
a304 2ad200    ld      hl,(00d2h)
a307 320ca3    ld      (0a30ch),a
a30a 22f000    ld      (00f0h),hl
a30d 210000    ld      hl,0000h
a310 e5        push    hl
a311 3216a3    ld      (0a316h),a
a314 2ace00    ld      hl,(00ceh)
a317 54        ld      d,h
a318 1ece      ld      e,0ceh
a31a ed531fa3  ld      (0a31fh),de
a31e 2a0000    ld      hl,(0000h)
a321 d1        pop     de
a322 cd0086    call    8600h
a325 cd3986    call    8639h
a328 ca41a3    jp      z,0a341h
a32b cdab88    call    88abh
a32e 3233a3    ld      (0a333h),a
a331 2ace00    ld      hl,(00ceh)
a334 cdf888    call    88f8h
a337 3805      jr      c,0a33eh
a339 210000    ld      hl,0000h
a33c 1803      jr      0a341h
a33e 21ffff    ld      hl,0ffffh
a341 cd3986    call    8639h
a344 ca4aa3    jp      z,0a34ah
a347 c369a3    jp      0a369h
a34a 324fa3    ld      (0a34fh),a
a34d 2ae200    ld      hl,(00e2h)
a350 23        inc     hl
a351 3256a3    ld      (0a356h),a
a354 22e200    ld      (00e2h),hl
a357 325ca3    ld      (0a35ch),a
a35a 2aec00    ld      hl,(00ech)
a35d 2261a3    ld      (0a361h),hl
a360 cd63a3    call    0a363h
a363 3a7684    ld      a,(8476h)
a366 c387a2    jp      0a287h
a369 21ffff    ld      hl,0ffffh
a36c 3271a3    ld      (0a371h),a
a36f 22d000    ld      (00d0h),hl
a372 3a7684    ld      a,(8476h)
a375 f5        push    af
a376 2a10bf    ld      hl,(0bf10h)
a379 e5        push    hl
a37a 2a17c0    ld      hl,(0c017h)
a37d 7c        ld      a,h
a37e 327684    ld      (8476h),a
a381 3286a3    ld      (0a386h),a
a384 2ada00    ld      hl,(00dah)
a387 228ba3    ld      (0a38bh),hl
a38a cd8da3    call    0a38dh
a38d e3        ex      (sp),hl
a38e 7c        ld      a,h
a38f e1        pop     hl
a390 327684    ld      (8476h),a
a393 3298a3    ld      (0a398h),a
a396 2ad200    ld      hl,(00d2h)
a399 329ea3    ld      (0a39eh),a
a39c 22f000    ld      (00f0h),hl
a39f 210100    ld      hl,0001h
a3a2 cd0f81    call    810fh
a3a5 32aaa3    ld      (0a3aah),a
a3a8 22e200    ld      (00e2h),hl
a3ab 21ffff    ld      hl,0ffffh
a3ae cd3986    call    8639h
a3b1 cad9a5    jp      z,0a5d9h
a3b4 32b9a3    ld      (0a3b9h),a
a3b7 2ad800    ld      hl,(00d8h)
a3ba 22bea3    ld      (0a3beh),hl
a3bd cdc0a3    call    0a3c0h
a3c0 3a7684    ld      a,(8476h)
a3c3 32c8a3    ld      (0a3c8h),a
a3c6 22cc00    ld      (00cch),hl
a3c9 32cea3    ld      (0a3ceh),a
a3cc 2ada00    ld      hl,(00dah)
a3cf e5        push    hl
a3d0 32d5a3    ld      (0a3d5h),a
a3d3 2acc00    ld      hl,(00cch)
a3d6 d1        pop     de
a3d7 cdde85    call    85deh
a3da cd3986    call    8639h
a3dd ca64a4    jp      z,0a464h
a3e0 32e5a3    ld      (0a3e5h),a
a3e3 2acc00    ld      hl,(00cch)
a3e6 e5        push    hl
a3e7 2ad7bf    ld      hl,(0bfd7h)
a3ea d1        pop     de
a3eb cb23      sla     e
a3ed cb12      rl      d
a3ef 19        add     hl,de
a3f0 22f4a3    ld      (0a3f4h),hl
a3f3 2a0000    ld      hl,(0000h)
a3f6 32fba3    ld      (0a3fbh),a
a3f9 22cc00    ld      (00cch),hl
a3fc 3201a4    ld      (0a401h),a
a3ff 2ae000    ld      hl,(00e0h)
a402 e5        push    hl
a403 3208a4    ld      (0a408h),a
a406 2acc00    ld      hl,(00cch)
a409 54        ld      d,h
a40a 1ee0      ld      e,0e0h
a40c ed5311a4  ld      (0a411h),de
a410 2a0000    ld      hl,(0000h)
a413 d1        pop     de
a414 cdd185    call    85d1h
a417 cd3986    call    8639h
a41a ca38a4    jp      z,0a438h
a41d 3222a4    ld      (0a422h),a
a420 2ade00    ld      hl,(00deh)
a423 e5        push    hl
a424 3229a4    ld      (0a429h),a
a427 2acc00    ld      hl,(00cch)
a42a 54        ld      d,h
a42b 1ede      ld      e,0deh
a42d ed5332a4  ld      (0a432h),de
a431 2a0000    ld      hl,(0000h)
a434 d1        pop     de
a435 cdd185    call    85d1h
a438 cd3986    call    8639h
a43b ca64a4    jp      z,0a464h
a43e 3243a4    ld      (0a443h),a
a441 2ada00    ld      hl,(00dah)
a444 e5        push    hl
a445 324aa4    ld      (0a44ah),a
a448 2acc00    ld      hl,(00cch)
a44b 2ece      ld      l,0ceh
a44d d1        pop     de
a44e 2253a4    ld      (0a453h),hl
a451 ed530000  ld      (0000h),de
a455 325aa4    ld      (0a45ah),a
a458 2ac600    ld      hl,(00c6h)
a45b 225fa4    ld      (0a45fh),hl
a45e cd61a4    call    0a461h
a461 3a7684    ld      a,(8476h)
a464 210000    ld      hl,0000h
a467 e5        push    hl
a468 326da4    ld      (0a46dh),a
a46b 2ace00    ld      hl,(00ceh)
a46e 54        ld      d,h
a46f 1ece      ld      e,0ceh
a471 ed5376a4  ld      (0a476h),de
a475 2a0000    ld      hl,(0000h)
a478 d1        pop     de
a479 cd0f86    call    860fh
a47c cd3986    call    8639h
a47f cac3a4    jp      z,0a4c3h
a482 3287a4    ld      (0a487h),a
a485 2ace00    ld      hl,(00ceh)
a488 54        ld      d,h
a489 1ece      ld      e,0ceh
a48b ed5390a4  ld      (0a490h),de
a48f 2a0000    ld      hl,(0000h)
a492 3297a4    ld      (0a497h),a
a495 22da00    ld      (00dah),hl
a498 329da4    ld      (0a49dh),a
a49b 2ada00    ld      hl,(00dah)
a49e e5        push    hl
a49f 2aebbf    ld      hl,(0bfebh)
a4a2 d1        pop     de
a4a3 cb23      sla     e
a4a5 cb12      rl      d
a4a7 19        add     hl,de
a4a8 22aca4    ld      (0a4ach),hl
a4ab 2a0000    ld      hl,(0000h)
a4ae 32b3a4    ld      (0a4b3h),a
a4b1 22f000    ld      (00f0h),hl
a4b4 32b9a4    ld      (0a4b9h),a
a4b7 2ac600    ld      hl,(00c6h)
a4ba 22bea4    ld      (0a4beh),hl
a4bd cdc0a4    call    0a4c0h
a4c0 3a7684    ld      a,(8476h)
a4c3 32c8a4    ld      (0a4c8h),a
a4c6 2aea00    ld      hl,(00eah)
a4c9 22cda4    ld      (0a4cdh),hl
a4cc cdcfa4    call    0a4cfh
a4cf 3a7684    ld      a,(8476h)
a4d2 cd3986    call    8639h
a4d5 cae7a4    jp      z,0a4e7h
a4d8 32dda4    ld      (0a4ddh),a
a4db 2ae800    ld      hl,(00e8h)
a4de 22e2a4    ld      (0a4e2h),hl
a4e1 cde4a4    call    0a4e4h
a4e4 3a7684    ld      a,(8476h)
a4e7 211000    ld      hl,0010h
a4ea e5        push    hl
a4eb 211000    ld      hl,0010h
a4ee cd0f81    call    810fh
a4f1 e5        push    hl
a4f2 210400    ld      hl,0004h
a4f5 e5        push    hl
a4f6 32fba4    ld      (0a4fbh),a
a4f9 2af600    ld      hl,(00f6h)
a4fc e5        push    hl
a4fd 3202a5    ld      (0a502h),a
a500 2ace00    ld      hl,(00ceh)
a503 54        ld      d,h
a504 1ef6      ld      e,0f6h
a506 ed530ba5  ld      (0a50bh),de
a50a 2a0000    ld      hl,(0000h)
a50d d1        pop     de
a50e a7        and     a
a50f ed52      sbc     hl,de
a511 c1        pop     bc
a512 41        ld      b,c
a513 cb2c      sra     h
a515 cb1d      rr      l
a517 10fa      djnz    0a513h
a519 e5        push    hl
a51a 321fa5    ld      (0a51fh),a
a51d 2ad600    ld      hl,(00d6h)
a520 d1        pop     de
a521 19        add     hl,de
a522 c1        pop     bc
a523 d1        pop     de
a524 cd1b81    call    811bh
a527 322ca5    ld      (0a52ch),a
a52a 22d600    ld      (00d6h),hl
a52d 211000    ld      hl,0010h
a530 e5        push    hl
a531 211000    ld      hl,0010h
a534 cd0f81    call    810fh
a537 e5        push    hl
a538 210400    ld      hl,0004h
a53b e5        push    hl
a53c 3241a5    ld      (0a541h),a
a53f 2af400    ld      hl,(00f4h)
a542 e5        push    hl
a543 3248a5    ld      (0a548h),a
a546 2ace00    ld      hl,(00ceh)
a549 54        ld      d,h
a54a 1ef4      ld      e,0f4h
a54c ed5351a5  ld      (0a551h),de
a550 2a0000    ld      hl,(0000h)
a553 d1        pop     de
a554 a7        and     a
a555 ed52      sbc     hl,de
a557 c1        pop     bc
a558 41        ld      b,c
a559 cb2c      sra     h
a55b cb1d      rr      l
a55d 10fa      djnz    0a559h
a55f e5        push    hl
a560 3265a5    ld      (0a565h),a
a563 2ad400    ld      hl,(00d4h)
a566 d1        pop     de
a567 19        add     hl,de
a568 c1        pop     bc
a569 d1        pop     de
a56a cd1b81    call    811bh
a56d 3272a5    ld      (0a572h),a
a570 22d400    ld      (00d4h),hl
a573 211400    ld      hl,0014h
a576 e5        push    hl
a577 218001    ld      hl,0180h
a57a d1        pop     de
a57b a7        and     a
a57c ed52      sbc     hl,de
a57e e5        push    hl
a57f 212400    ld      hl,0024h
a582 e5        push    hl
a583 3288a5    ld      (0a588h),a
a586 2ad400    ld      hl,(00d4h)
a589 e5        push    hl
a58a 328fa5    ld      (0a58fh),a
a58d 2af400    ld      hl,(00f4h)
a590 d1        pop     de
a591 19        add     hl,de
a592 c1        pop     bc
a593 d1        pop     de
a594 cd1b81    call    811bh
a597 329ca5    ld      (0a59ch),a
a59a 22f400    ld      (00f4h),hl
a59d 211400    ld      hl,0014h
a5a0 e5        push    hl
a5a1 210002    ld      hl,0200h
a5a4 d1        pop     de
a5a5 a7        and     a
a5a6 ed52      sbc     hl,de
a5a8 e5        push    hl
a5a9 211400    ld      hl,0014h
a5ac e5        push    hl
a5ad 32b2a5    ld      (0a5b2h),a
a5b0 2ad600    ld      hl,(00d6h)
a5b3 e5        push    hl
a5b4 32b9a5    ld      (0a5b9h),a
a5b7 2af600    ld      hl,(00f6h)
a5ba d1        pop     de
a5bb 19        add     hl,de
a5bc c1        pop     bc
a5bd d1        pop     de
a5be cd1b81    call    811bh
a5c1 32c6a5    ld      (0a5c6h),a
a5c4 22f600    ld      (00f6h),hl
a5c7 32cca5    ld      (0a5cch),a
a5ca 2aec00    ld      hl,(00ech)
a5cd 22d1a5    ld      (0a5d1h),hl
a5d0 cdd3a5    call    0a5d3h
a5d3 3a7684    ld      a,(8476h)
a5d6 c3aba3    jp      0a3abh
a5d9 ddf9      ld      sp,ix
a5db dde1      pop     ix
a5dd c9        ret     

a5de cd1580    call    8015h
a5e1 dde5      push    ix
a5e3 dd210000  ld      ix,0000h
a5e7 dd39      add     ix,sp
a5e9 e5        push    hl
a5ea 210000    ld      hl,0000h
a5ed 32f2a5    ld      (0a5f2h),a
a5f0 22d000    ld      (00d0h),hl
a5f3 32f8a5    ld      (0a5f8h),a
a5f6 2af200    ld      hl,(00f2h)
a5f9 23        inc     hl
a5fa 32ffa5    ld      (0a5ffh),a
a5fd 22f200    ld      (00f2h),hl
a600 3a7684    ld      a,(8476h)
a603 f5        push    af
a604 2a86be    ld      hl,(0be86h)
a607 e5        push    hl
a608 2a17c0    ld      hl,(0c017h)
a60b 7c        ld      a,h
a60c 327684    ld      (8476h),a
a60f 3214a6    ld      (0a614h),a
a612 2ada00    ld      hl,(00dah)
a615 2219a6    ld      (0a619h),hl
a618 cd1ba6    call    0a61bh
a61b e3        ex      (sp),hl
a61c 7c        ld      a,h
a61d e1        pop     hl
a61e 327684    ld      (8476h),a
a621 212800    ld      hl,0028h
a624 e5        push    hl
a625 322aa6    ld      (0a62ah),a
a628 2af600    ld      hl,(00f6h)
a62b d1        pop     de
a62c a7        and     a
a62d ed52      sbc     hl,de
a62f 3234a6    ld      (0a634h),a
a632 22ca00    ld      (00cah),hl
a635 212800    ld      hl,0028h
a638 e5        push    hl
a639 323ea6    ld      (0a63eh),a
a63c 2af400    ld      hl,(00f4h)
a63f d1        pop     de
a640 a7        and     a
a641 ed52      sbc     hl,de
a643 3248a6    ld      (0a648h),a
a646 22c800    ld      (00c8h),hl
a649 210000    ld      hl,0000h
a64c dd74ff    ld      (ix-01h),h
a64f dd75fe    ld      (ix-02h),l
a652 211e00    ld      hl,001eh
a655 e5        push    hl
a656 dd66ff    ld      h,(ix-01h)
a659 dd6efe    ld      l,(ix-02h)
a65c d1        pop     de
a65d cd0086    call    8600h
a660 cd3986    call    8639h
a663 cae8a6    jp      z,0a6e8h
a666 211400    ld      hl,0014h
a669 e5        push    hl
a66a 210002    ld      hl,0200h
a66d d1        pop     de
a66e a7        and     a
a66f ed52      sbc     hl,de
a671 e5        push    hl
a672 211400    ld      hl,0014h
a675 e5        push    hl
a676 215000    ld      hl,0050h
a679 cdeb80    call    80ebh
a67c e5        push    hl
a67d 3282a6    ld      (0a682h),a
a680 2aca00    ld      hl,(00cah)
a683 d1        pop     de
a684 19        add     hl,de
a685 c1        pop     bc
a686 d1        pop     de
a687 cd1b81    call    811bh
a68a 328fa6    ld      (0a68fh),a
a68d 22f600    ld      (00f6h),hl
a690 211400    ld      hl,0014h
a693 e5        push    hl
a694 218001    ld      hl,0180h
a697 d1        pop     de
a698 a7        and     a
a699 ed52      sbc     hl,de
a69b e5        push    hl
a69c 212400    ld      hl,0024h
a69f e5        push    hl
a6a0 215000    ld      hl,0050h
a6a3 cdeb80    call    80ebh
a6a6 e5        push    hl
a6a7 32aca6    ld      (0a6ach),a
a6aa 2ac800    ld      hl,(00c8h)
a6ad d1        pop     de
a6ae 19        add     hl,de
a6af c1        pop     bc
a6b0 d1        pop     de
a6b1 cd1b81    call    811bh
a6b4 32b9a6    ld      (0a6b9h),a
a6b7 22f400    ld      (00f4h),hl
a6ba 32bfa6    ld      (0a6bfh),a
a6bd 2ad800    ld      hl,(00d8h)
a6c0 22c4a6    ld      (0a6c4h),hl
a6c3 cdc6a6    call    0a6c6h
a6c6 3a7684    ld      a,(8476h)
a6c9 32cea6    ld      (0a6ceh),a
a6cc 2aec00    ld      hl,(00ech)
a6cf 22d3a6    ld      (0a6d3h),hl
a6d2 cdd5a6    call    0a6d5h
a6d5 3a7684    ld      a,(8476h)
a6d8 dd66ff    ld      h,(ix-01h)
a6db dd6efe    ld      l,(ix-02h)
a6de 23        inc     hl
a6df dd74ff    ld      (ix-01h),h
a6e2 dd75fe    ld      (ix-02h),l
a6e5 c352a6    jp      0a652h
a6e8 32eda6    ld      (0a6edh),a
a6eb 2ae800    ld      hl,(00e8h)
a6ee 22f2a6    ld      (0a6f2h),hl
a6f1 cdf4a6    call    0a6f4h
a6f4 3a7684    ld      a,(8476h)
a6f7 ddf9      ld      sp,ix
a6f9 dde1      pop     ix
a6fb c9        ret     

a6fc cd1580    call    8015h
a6ff 71        ld      (hl),c
a700 9f        sbc     a,a
a701 0101a7    ld      bc,0a701h
a704 c5        push    bc
a705 018fa7    ld      bc,0a78fh
a708 c5        push    bc
a709 010000    ld      bc,0000h
a70c c5        push    bc
a70d 010000    ld      bc,0000h
a710 c5        push    bc
a711 010000    ld      bc,0000h
a714 c5        push    bc
a715 010000    ld      bc,0000h
a718 c5        push    bc
a719 011788    ld      bc,8817h
a71c c5        push    bc
a71d 01f687    ld      bc,87f6h
a720 c5        push    bc
a721 011888    ld      bc,8818h
a724 c5        push    bc
a725 014f88    ld      bc,884fh
a728 c5        push    bc
a729 016588    ld      bc,8865h
a72c c5        push    bc
a72d 01c188    ld      bc,88c1h
a730 c5        push    bc
a731 010000    ld      bc,0000h
a734 c5        push    bc
a735 010000    ld      bc,0000h
a738 c5        push    bc
a739 010000    ld      bc,0000h
a73c c5        push    bc
a73d 010000    ld      bc,0000h
a740 c5        push    bc
a741 010000    ld      bc,0000h
a744 c5        push    bc
a745 01d79f    ld      bc,9fd7h
a748 c5        push    bc
a749 010000    ld      bc,0000h
a74c c5        push    bc
a74d 010000    ld      bc,0000h
a750 c5        push    bc
a751 010000    ld      bc,0000h
a754 c5        push    bc
a755 010000    ld      bc,0000h
a758 c5        push    bc
a759 010000    ld      bc,0000h
a75c c5        push    bc
a75d 010000    ld      bc,0000h
a760 c5        push    bc
a761 010000    ld      bc,0000h
a764 c5        push    bc
a765 010000    ld      bc,0000h
a768 c5        push    bc
a769 010000    ld      bc,0000h
a76c c5        push    bc
a76d 010000    ld      bc,0000h
a770 c5        push    bc
a771 0186ad    ld      bc,0ad86h
a774 c5        push    bc
a775 0115af    ld      bc,0af15h
a778 c5        push    bc
a779 0131b0    ld      bc,0b031h
a77c c5        push    bc
a77d 0178b1    ld      bc,0b178h
a780 c5        push    bc
a781 013b88    ld      bc,883bh
a784 c5        push    bc
a785 018784    ld      bc,8487h
a788 c5        push    bc
a789 c39883    jp      8398h
a78c cd1580    call    8015h
a78f dde5      push    ix
a791 dd210000  ld      ix,0000h
a795 dd39      add     ix,sp
a797 210000    ld      hl,0000h
a79a 329fa7    ld      (0a79fh),a
a79d 22e200    ld      (00e2h),hl
a7a0 32a5a7    ld      (0a7a5h),a
a7a3 2af600    ld      hl,(00f6h)
a7a6 32aba7    ld      (0a7abh),a
a7a9 22ca00    ld      (00cah),hl
a7ac 32b1a7    ld      (0a7b1h),a
a7af 2af400    ld      hl,(00f4h)
a7b2 32b7a7    ld      (0a7b7h),a
a7b5 22c800    ld      (00c8h),hl
a7b8 32bda7    ld      (0a7bdh),a
a7bb 2af600    ld      hl,(00f6h)
a7be 32c3a7    ld      (0a7c3h),a
a7c1 22d200    ld      (00d2h),hl
a7c4 32c9a7    ld      (0a7c9h),a
a7c7 2af400    ld      hl,(00f4h)
a7ca 32cfa7    ld      (0a7cfh),a
a7cd 22d000    ld      (00d0h),hl
a7d0 32d5a7    ld      (0a7d5h),a
a7d3 2ada00    ld      hl,(00dah)
a7d6 e5        push    hl
a7d7 2aebbf    ld      hl,(0bfebh)
a7da d1        pop     de
a7db cb23      sla     e
a7dd cb12      rl      d
a7df 19        add     hl,de
a7e0 22e4a7    ld      (0a7e4h),hl
a7e3 2a0000    ld      hl,(0000h)
a7e6 32eba7    ld      (0a7ebh),a
a7e9 22f000    ld      (00f0h),hl
a7ec 210100    ld      hl,0001h
a7ef cd0f81    call    810fh
a7f2 32f7a7    ld      (0a7f7h),a
a7f5 22ce00    ld      (00ceh),hl
a7f8 210000    ld      hl,0000h
a7fb e5        push    hl
a7fc 2a15c0    ld      hl,(0c015h)
a7ff d1        pop     de
a800 cdd185    call    85d1h
a803 cd3986    call    8639h
a806 cab9a8    jp      z,0a8b9h
a809 210000    ld      hl,0000h
a80c e5        push    hl
a80d 3212a8    ld      (0a812h),a
a810 2acc00    ld      hl,(00cch)
a813 65        ld      h,l
a814 e5        push    hl
a815 210100    ld      hl,0001h
a818 f1        pop     af
a819 cd6187    call    8761h
a81c 3a7684    ld      a,(8476h)
a81f d1        pop     de
a820 cd0086    call    8600h
a823 cd3986    call    8639h
a826 ca32a8    jp      z,0a832h
a829 210100    ld      hl,0001h
a82c 3231a8    ld      (0a831h),a
a82f 22c600    ld      (00c6h),hl
a832 210000    ld      hl,0000h
a835 e5        push    hl
a836 323ba8    ld      (0a83bh),a
a839 2acc00    ld      hl,(00cch)
a83c 65        ld      h,l
a83d e5        push    hl
a83e 210100    ld      hl,0001h
a841 f1        pop     af
a842 cd6187    call    8761h
a845 3a7684    ld      a,(8476h)
a848 d1        pop     de
a849 cdeb85    call    85ebh
a84c cd3986    call    8639h
a84f ca5ba8    jp      z,0a85bh
a852 210000    ld      hl,0000h
a855 325aa8    ld      (0a85ah),a
a858 22c600    ld      (00c6h),hl
a85b 3260a8    ld      (0a860h),a
a85e 2ac600    ld      hl,(00c6h)
a861 cd3986    call    8639h
a864 ca76a8    jp      z,0a876h
a867 326ca8    ld      (0a86ch),a
a86a 2ac800    ld      hl,(00c8h)
a86d 3272a8    ld      (0a872h),a
a870 22f400    ld      (00f4h),hl
a873 c388a8    jp      0a888h
a876 211000    ld      hl,0010h
a879 e5        push    hl
a87a 327fa8    ld      (0a87fh),a
a87d 2ac800    ld      hl,(00c8h)
a880 d1        pop     de
a881 19        add     hl,de
a882 3287a8    ld      (0a887h),a
a885 22f400    ld      (00f4h),hl
a888 328da8    ld      (0a88dh),a
a88b 2ac600    ld      hl,(00c6h)
a88e e5        push    hl
a88f 3294a8    ld      (0a894h),a
a892 2ada00    ld      hl,(00dah)
a895 e5        push    hl
a896 2affbf    ld      hl,(0bfffh)
a899 d1        pop     de
a89a cb23      sla     e
a89c cb12      rl      d
a89e 19        add     hl,de
a89f d1        pop     de
a8a0 22a5a8    ld      (0a8a5h),hl
a8a3 ed530000  ld      (0000h),de
a8a7 32aca8    ld      (0a8ach),a
a8aa 2aec00    ld      hl,(00ech)
a8ad 22b1a8    ld      (0a8b1h),hl
a8b0 cdb3a8    call    0a8b3h
a8b3 3a7684    ld      a,(8476h)
a8b6 c3f8a7    jp      0a7f8h
a8b9 210100    ld      hl,0001h
a8bc e5        push    hl
a8bd 2a15c0    ld      hl,(0c015h)
a8c0 d1        pop     de
a8c1 cdd185    call    85d1h
a8c4 cd3986    call    8639h
a8c7 cadca8    jp      z,0a8dch
a8ca 32cfa8    ld      (0a8cfh),a
a8cd 2aec00    ld      hl,(00ech)
a8d0 22d4a8    ld      (0a8d4h),hl
a8d3 cdd6a8    call    0a8d6h
a8d6 3a7684    ld      a,(8476h)
a8d9 c3b9a8    jp      0a8b9h
a8dc 32e1a8    ld      (0a8e1h),a
a8df 2ac600    ld      hl,(00c6h)
a8e2 cd3986    call    8639h
a8e5 cac4a9    jp      z,0a9c4h
a8e8 210000    ld      hl,0000h
a8eb e5        push    hl
a8ec 2a13c0    ld      hl,(0c013h)
a8ef d1        pop     de
a8f0 cdd185    call    85d1h
a8f3 cd3986    call    8639h
a8f6 cac1a9    jp      z,0a9c1h
a8f9 32fea8    ld      (0a8feh),a
a8fc 2acc00    ld      hl,(00cch)
a8ff 65        ld      h,l
a900 e5        push    hl
a901 210500    ld      hl,0005h
a904 f1        pop     af
a905 cd1387    call    8713h
a908 3a7684    ld      a,(8476h)
a90b e5        push    hl
a90c 3211a9    ld      (0a911h),a
a90f 2af600    ld      hl,(00f6h)
a912 d1        pop     de
a913 19        add     hl,de
a914 3219a9    ld      (0a919h),a
a917 22f600    ld      (00f6h),hl
a91a 321fa9    ld      (0a91fh),a
a91d 2acc00    ld      hl,(00cch)
a920 65        ld      h,l
a921 e5        push    hl
a922 210500    ld      hl,0005h
a925 f1        pop     af
a926 cd6187    call    8761h
a929 3a7684    ld      a,(8476h)
a92c e5        push    hl
a92d 3232a9    ld      (0a932h),a
a930 2af400    ld      hl,(00f4h)
a933 d1        pop     de
a934 19        add     hl,de
a935 323aa9    ld      (0a93ah),a
a938 22f400    ld      (00f4h),hl
a93b 211400    ld      hl,0014h
a93e e5        push    hl
a93f 218001    ld      hl,0180h
a942 d1        pop     de
a943 a7        and     a
a944 ed52      sbc     hl,de
a946 e5        push    hl
a947 212400    ld      hl,0024h
a94a e5        push    hl
a94b 3250a9    ld      (0a950h),a
a94e 2af400    ld      hl,(00f4h)
a951 c1        pop     bc
a952 d1        pop     de
a953 cd1b81    call    811bh
a956 325ba9    ld      (0a95bh),a
a959 22f400    ld      (00f4h),hl
a95c 211400    ld      hl,0014h
a95f e5        push    hl
a960 210002    ld      hl,0200h
a963 d1        pop     de
a964 a7        and     a
a965 ed52      sbc     hl,de
a967 e5        push    hl
a968 211400    ld      hl,0014h
a96b e5        push    hl
a96c 3271a9    ld      (0a971h),a
a96f 2af600    ld      hl,(00f6h)
a972 c1        pop     bc
a973 d1        pop     de
a974 cd1b81    call    811bh
a977 327ca9    ld      (0a97ch),a
a97a 22f600    ld      (00f6h),hl
a97d 3282a9    ld      (0a982h),a
a980 2ad800    ld      hl,(00d8h)
a983 2287a9    ld      (0a987h),hl
a986 cd89a9    call    0a989h
a989 3a7684    ld      a,(8476h)
a98c 210000    ld      hl,0000h
a98f e5        push    hl
a990 3295a9    ld      (0a995h),a
a993 2ace00    ld      hl,(00ceh)
a996 d1        pop     de
a997 cd0f86    call    860fh
a99a cd3986    call    8639h
a99d caafa9    jp      z,0a9afh
a9a0 32a5a9    ld      (0a9a5h),a
a9a3 2ac200    ld      hl,(00c2h)
a9a6 22aaa9    ld      (0a9aah),hl
a9a9 cdaca9    call    0a9ach
a9ac 3a7684    ld      a,(8476h)
a9af 32b4a9    ld      (0a9b4h),a
a9b2 2aec00    ld      hl,(00ech)
a9b5 22b9a9    ld      (0a9b9h),hl
a9b8 cdbba9    call    0a9bbh
a9bb 3a7684    ld      a,(8476h)
a9be c3e8a8    jp      0a8e8h
a9c1 c357ac    jp      0ac57h
a9c4 210000    ld      hl,0000h
a9c7 e5        push    hl
a9c8 2a13c0    ld      hl,(0c013h)
a9cb d1        pop     de
a9cc cdd185    call    85d1h
a9cf cd3986    call    8639h
a9d2 ca57ac    jp      z,0ac57h
a9d5 210500    ld      hl,0005h
a9d8 e5        push    hl
a9d9 210500    ld      hl,0005h
a9dc cd0f81    call    810fh
a9df e5        push    hl
a9e0 32e5a9    ld      (0a9e5h),a
a9e3 2af600    ld      hl,(00f6h)
a9e6 e5        push    hl
a9e7 32eca9    ld      (0a9ech),a
a9ea 2ad200    ld      hl,(00d2h)
a9ed d1        pop     de
a9ee a7        and     a
a9ef ed52      sbc     hl,de
a9f1 c1        pop     bc
a9f2 d1        pop     de
a9f3 cd1b81    call    811bh
a9f6 e5        push    hl
a9f7 32fca9    ld      (0a9fch),a
a9fa 2af600    ld      hl,(00f6h)
a9fd d1        pop     de
a9fe 19        add     hl,de
a9ff 3204aa    ld      (0aa04h),a
aa02 22f600    ld      (00f6h),hl
aa05 210500    ld      hl,0005h
aa08 e5        push    hl
aa09 210500    ld      hl,0005h
aa0c cd0f81    call    810fh
aa0f e5        push    hl
aa10 3215aa    ld      (0aa15h),a
aa13 2af400    ld      hl,(00f4h)
aa16 e5        push    hl
aa17 321caa    ld      (0aa1ch),a
aa1a 2ad000    ld      hl,(00d0h)
aa1d d1        pop     de
aa1e a7        and     a
aa1f ed52      sbc     hl,de
aa21 c1        pop     bc
aa22 d1        pop     de
aa23 cd1b81    call    811bh
aa26 e5        push    hl
aa27 322caa    ld      (0aa2ch),a
aa2a 2af400    ld      hl,(00f4h)
aa2d d1        pop     de
aa2e 19        add     hl,de
aa2f 3234aa    ld      (0aa34h),a
aa32 22f400    ld      (00f4h),hl
aa35 210000    ld      hl,0000h
aa38 e5        push    hl
aa39 211400    ld      hl,0014h
aa3c cdeb80    call    80ebh
aa3f d1        pop     de
aa40 cdd185    call    85d1h
aa43 cd3986    call    8639h
aa46 c27caa    jp      nz,0aa7ch
aa49 210a00    ld      hl,000ah
aa4c e5        push    hl
aa4d 3252aa    ld      (0aa52h),a
aa50 2ad000    ld      hl,(00d0h)
aa53 e5        push    hl
aa54 3259aa    ld      (0aa59h),a
aa57 2af400    ld      hl,(00f4h)
aa5a d1        pop     de
aa5b a7        and     a
aa5c ed52      sbc     hl,de
aa5e cd0c81    call    810ch
aa61 e5        push    hl
aa62 3267aa    ld      (0aa67h),a
aa65 2ad200    ld      hl,(00d2h)
aa68 e5        push    hl
aa69 326eaa    ld      (0aa6eh),a
aa6c 2af600    ld      hl,(00f6h)
aa6f d1        pop     de
aa70 a7        and     a
aa71 ed52      sbc     hl,de
aa73 cd0c81    call    810ch
aa76 d1        pop     de
aa77 19        add     hl,de
aa78 d1        pop     de
aa79 cd0086    call    8600h
aa7c cd3986    call    8639h
aa7f ca13ac    jp      z,0ac13h
aa82 3287aa    ld      (0aa87h),a
aa85 2ac000    ld      hl,(00c0h)
aa88 228caa    ld      (0aa8ch),hl
aa8b cd8eaa    call    0aa8eh
aa8e 3a7684    ld      a,(8476h)
aa91 3296aa    ld      (0aa96h),a
aa94 22c400    ld      (00c4h),hl
aa97 329caa    ld      (0aa9ch),a
aa9a 2ae200    ld      hl,(00e2h)
aa9d cd3986    call    8639h
aaa0 caa9aa    jp      z,0aaa9h
aaa3 32a8aa    ld      (0aaa8h),a
aaa6 2ac400    ld      hl,(00c4h)
aaa9 cd3986    call    8639h
aaac cab4ab    jp      z,0abb4h
aaaf 32b4aa    ld      (0aab4h),a
aab2 2ac400    ld      hl,(00c4h)
aab5 54        ld      d,h
aab6 1ef6      ld      e,0f6h
aab8 ed53bdaa  ld      (0aabdh),de
aabc 2a0000    ld      hl,(0000h)
aabf 32c4aa    ld      (0aac4h),a
aac2 22d200    ld      (00d2h),hl
aac5 32caaa    ld      (0aacah),a
aac8 2ac400    ld      hl,(00c4h)
aacb 54        ld      d,h
aacc 1ef4      ld      e,0f4h
aace ed53d3aa  ld      (0aad3h),de
aad2 2a0000    ld      hl,(0000h)
aad5 32daaa    ld      (0aadah),a
aad8 22d000    ld      (00d0h),hl
aadb 32e0aa    ld      (0aae0h),a
aade 2af600    ld      hl,(00f6h)
aae1 e5        push    hl
aae2 32e7aa    ld      (0aae7h),a
aae5 2ad200    ld      hl,(00d2h)
aae8 d1        pop     de
aae9 cd0086    call    8600h
aaec cd3986    call    8639h
aaef ca10ab    jp      z,0ab10h
aaf2 212000    ld      hl,0020h
aaf5 cdeb80    call    80ebh
aaf8 e5        push    hl
aaf9 212000    ld      hl,0020h
aafc d1        pop     de
aafd 19        add     hl,de
aafe e5        push    hl
aaff 3204ab    ld      (0ab04h),a
ab02 2ad200    ld      hl,(00d2h)
ab05 d1        pop     de
ab06 19        add     hl,de
ab07 320cab    ld      (0ab0ch),a
ab0a 22d200    ld      (00d2h),hl
ab0d c32dab    jp      0ab2dh
ab10 212000    ld      hl,0020h
ab13 cdeb80    call    80ebh
ab16 e5        push    hl
ab17 212000    ld      hl,0020h
ab1a d1        pop     de
ab1b 19        add     hl,de
ab1c e5        push    hl
ab1d 3222ab    ld      (0ab22h),a
ab20 2ad200    ld      hl,(00d2h)
ab23 d1        pop     de
ab24 a7        and     a
ab25 ed52      sbc     hl,de
ab27 322cab    ld      (0ab2ch),a
ab2a 22d200    ld      (00d2h),hl
ab2d 3232ab    ld      (0ab32h),a
ab30 2af400    ld      hl,(00f4h)
ab33 e5        push    hl
ab34 3239ab    ld      (0ab39h),a
ab37 2ad000    ld      hl,(00d0h)
ab3a d1        pop     de
ab3b cd0086    call    8600h
ab3e cd3986    call    8639h
ab41 ca62ab    jp      z,0ab62h
ab44 212000    ld      hl,0020h
ab47 cdeb80    call    80ebh
ab4a e5        push    hl
ab4b 212000    ld      hl,0020h
ab4e d1        pop     de
ab4f 19        add     hl,de
ab50 e5        push    hl
ab51 3256ab    ld      (0ab56h),a
ab54 2ad000    ld      hl,(00d0h)
ab57 d1        pop     de
ab58 19        add     hl,de
ab59 325eab    ld      (0ab5eh),a
ab5c 22d000    ld      (00d0h),hl
ab5f c37fab    jp      0ab7fh
ab62 212000    ld      hl,0020h
ab65 cdeb80    call    80ebh
ab68 e5        push    hl
ab69 212000    ld      hl,0020h
ab6c d1        pop     de
ab6d 19        add     hl,de
ab6e e5        push    hl
ab6f 3274ab    ld      (0ab74h),a
ab72 2ad000    ld      hl,(00d0h)
ab75 d1        pop     de
ab76 a7        and     a
ab77 ed52      sbc     hl,de
ab79 327eab    ld      (0ab7eh),a
ab7c 22d000    ld      (00d0h),hl
ab7f 21ec01    ld      hl,01ech
ab82 e5        push    hl
ab83 211400    ld      hl,0014h
ab86 e5        push    hl
ab87 328cab    ld      (0ab8ch),a
ab8a 2ad200    ld      hl,(00d2h)
ab8d c1        pop     bc
ab8e d1        pop     de
ab8f cd1b81    call    811bh
ab92 3297ab    ld      (0ab97h),a
ab95 22d200    ld      (00d2h),hl
ab98 216c01    ld      hl,016ch
ab9b e5        push    hl
ab9c 212400    ld      hl,0024h
ab9f e5        push    hl
aba0 32a5ab    ld      (0aba5h),a
aba3 2ad000    ld      hl,(00d0h)
aba6 c1        pop     bc
aba7 d1        pop     de
aba8 cd1b81    call    811bh
abab 32b0ab    ld      (0abb0h),a
abae 22d000    ld      (00d0h),hl
abb1 c313ac    jp      0ac13h
abb4 32b9ab    ld      (0abb9h),a
abb7 2abe00    ld      hl,(00beh)
abba 22beab    ld      (0abbeh),hl
abbd cdc0ab    call    0abc0h
abc0 3a7684    ld      a,(8476h)
abc3 32c8ab    ld      (0abc8h),a
abc6 22dc00    ld      (00dch),hl
abc9 32ceab    ld      (0abceh),a
abcc 2adc00    ld      hl,(00dch)
abcf cd3986    call    8639h
abd2 ca04ac    jp      z,0ac04h
abd5 32daab    ld      (0abdah),a
abd8 2adc00    ld      hl,(00dch)
abdb 54        ld      d,h
abdc 1ef6      ld      e,0f6h
abde ed53e3ab  ld      (0abe3h),de
abe2 2a0000    ld      hl,(0000h)
abe5 32eaab    ld      (0abeah),a
abe8 22d200    ld      (00d2h),hl
abeb 32f0ab    ld      (0abf0h),a
abee 2adc00    ld      hl,(00dch)
abf1 54        ld      d,h
abf2 1ef4      ld      e,0f4h
abf4 ed53f9ab  ld      (0abf9h),de
abf8 2a0000    ld      hl,(0000h)
abfb 3200ac    ld      (0ac00h),a
abfe 22d000    ld      (00d0h),hl
ac01 c313ac    jp      0ac13h
ac04 3209ac    ld      (0ac09h),a
ac07 2abc00    ld      hl,(00bch)
ac0a 220eac    ld      (0ac0eh),hl
ac0d cd10ac    call    0ac10h
ac10 3a7684    ld      a,(8476h)
ac13 3218ac    ld      (0ac18h),a
ac16 2ad800    ld      hl,(00d8h)
ac19 221dac    ld      (0ac1dh),hl
ac1c cd1fac    call    0ac1fh
ac1f 3a7684    ld      a,(8476h)
ac22 210000    ld      hl,0000h
ac25 e5        push    hl
ac26 322bac    ld      (0ac2bh),a
ac29 2ace00    ld      hl,(00ceh)
ac2c d1        pop     de
ac2d cd0f86    call    860fh
ac30 cd3986    call    8639h
ac33 ca45ac    jp      z,0ac45h
ac36 323bac    ld      (0ac3bh),a
ac39 2ac200    ld      hl,(00c2h)
ac3c 2240ac    ld      (0ac40h),hl
ac3f cd42ac    call    0ac42h
ac42 3a7684    ld      a,(8476h)
ac45 324aac    ld      (0ac4ah),a
ac48 2aec00    ld      hl,(00ech)
ac4b 224fac    ld      (0ac4fh),hl
ac4e cd51ac    call    0ac51h
ac51 3a7684    ld      a,(8476h)
ac54 c3c4a9    jp      0a9c4h
ac57 325cac    ld      (0ac5ch),a
ac5a 2ada00    ld      hl,(00dah)
ac5d e5        push    hl
ac5e 2ae1bf    ld      hl,(0bfe1h)
ac61 d1        pop     de
ac62 cb23      sla     e
ac64 cb12      rl      d
ac66 19        add     hl,de
ac67 226bac    ld      (0ac6bh),hl
ac6a 2a0000    ld      hl,(0000h)
ac6d e5        push    hl
ac6e 2a13c0    ld      hl,(0c013h)
ac71 d1        pop     de
ac72 cdd185    call    85d1h
ac75 cd3986    call    8639h
ac78 ca06ad    jp      z,0ad06h
ac7b 3280ac    ld      (0ac80h),a
ac7e 2ada00    ld      hl,(00dah)
ac81 e5        push    hl
ac82 2a09c0    ld      hl,(0c009h)
ac85 d1        pop     de
ac86 cb23      sla     e
ac88 cb12      rl      d
ac8a 19        add     hl,de
ac8b 228fac    ld      (0ac8fh),hl
ac8e 2a0000    ld      hl,(0000h)
ac91 23        inc     hl
ac92 e5        push    hl
ac93 3298ac    ld      (0ac98h),a
ac96 2ada00    ld      hl,(00dah)
ac99 e5        push    hl
ac9a 2a09c0    ld      hl,(0c009h)
ac9d d1        pop     de
ac9e cb23      sla     e
aca0 cb12      rl      d
aca2 19        add     hl,de
aca3 d1        pop     de
aca4 22a9ac    ld      (0aca9h),hl
aca7 ed530000  ld      (0000h),de
acab 21ffff    ld      hl,0ffffh
acae cd3986    call    8639h
acb1 ca03ad    jp      z,0ad03h
acb4 211400    ld      hl,0014h
acb7 e5        push    hl
acb8 32bdac    ld      (0acbdh),a
acbb 2af400    ld      hl,(00f4h)
acbe d1        pop     de
acbf a7        and     a
acc0 ed52      sbc     hl,de
acc2 32c7ac    ld      (0acc7h),a
acc5 22f400    ld      (00f4h),hl
acc8 210a00    ld      hl,000ah
accb e5        push    hl
accc 32d1ac    ld      (0acd1h),a
accf 2ae600    ld      hl,(00e6h)
acd2 22d6ac    ld      (0acd6h),hl
acd5 cdd8ac    call    0acd8h
acd8 3a7684    ld      a,(8476h)
acdb 211400    ld      hl,0014h
acde e5        push    hl
acdf 32e4ac    ld      (0ace4h),a
ace2 2af400    ld      hl,(00f4h)
ace5 d1        pop     de
ace6 19        add     hl,de
ace7 32ecac    ld      (0acech),a
acea 22f400    ld      (00f4h),hl
aced 210a00    ld      hl,000ah
acf0 e5        push    hl
acf1 32f6ac    ld      (0acf6h),a
acf4 2ae600    ld      hl,(00e6h)
acf7 22fbac    ld      (0acfbh),hl
acfa cdfdac    call    0acfdh
acfd 3a7684    ld      a,(8476h)
ad00 c3abac    jp      0acabh
ad03 c37ead    jp      0ad7eh
ad06 210e00    ld      hl,000eh
ad09 320ead    ld      (0ad0eh),a
ad0c 22f000    ld      (00f0h),hl
ad0f 210000    ld      hl,0000h
ad12 3217ad    ld      (0ad17h),a
ad15 22dc00    ld      (00dch),hl
ad18 21ffff    ld      hl,0ffffh
ad1b cd3986    call    8639h
ad1e ca7ead    jp      z,0ad7eh
ad21 3226ad    ld      (0ad26h),a
ad24 2adc00    ld      hl,(00dch)
ad27 e5        push    hl
ad28 322dad    ld      (0ad2dh),a
ad2b 2af400    ld      hl,(00f4h)
ad2e d1        pop     de
ad2f 19        add     hl,de
ad30 3235ad    ld      (0ad35h),a
ad33 22f400    ld      (00f4h),hl
ad36 210100    ld      hl,0001h
ad39 e5        push    hl
ad3a 323fad    ld      (0ad3fh),a
ad3d 2adc00    ld      hl,(00dch)
ad40 d1        pop     de
ad41 19        add     hl,de
ad42 3247ad    ld      (0ad47h),a
ad45 22dc00    ld      (00dch),hl
ad48 324dad    ld      (0ad4dh),a
ad4b 2aec00    ld      hl,(00ech)
ad4e 2252ad    ld      (0ad52h),hl
ad51 cd54ad    call    0ad54h
ad54 3a7684    ld      a,(8476h)
ad57 325cad    ld      (0ad5ch),a
ad5a 2aea00    ld      hl,(00eah)
ad5d 2261ad    ld      (0ad61h),hl
ad60 cd63ad    call    0ad63h
ad63 3a7684    ld      a,(8476h)
ad66 cd3986    call    8639h
ad69 ca7bad    jp      z,0ad7bh
ad6c 3271ad    ld      (0ad71h),a
ad6f 2ae800    ld      hl,(00e8h)
ad72 2276ad    ld      (0ad76h),hl
ad75 cd78ad    call    0ad78h
ad78 3a7684    ld      a,(8476h)
ad7b c318ad    jp      0ad18h
ad7e ddf9      ld      sp,ix
ad80 dde1      pop     ix
ad82 c9        ret     

ad83 cd1580    call    8015h
ad86 dde5      push    ix
ad88 dd210000  ld      ix,0000h
ad8c dd39      add     ix,sp
ad8e e5        push    hl
ad8f 210e00    ld      hl,000eh
ad92 3297ad    ld      (0ad97h),a
ad95 22f000    ld      (00f0h),hl
ad98 210000    ld      hl,0000h
ad9b dd74ff    ld      (ix-01h),h
ad9e dd75fe    ld      (ix-02h),l
ada1 211e00    ld      hl,001eh
ada4 e5        push    hl
ada5 dd66ff    ld      h,(ix-01h)
ada8 dd6efe    ld      l,(ix-02h)
adab d1        pop     de
adac cd0086    call    8600h
adaf cd3986    call    8639h
adb2 ca1dae    jp      z,0ae1dh
adb5 210800    ld      hl,0008h
adb8 e5        push    hl
adb9 32bead    ld      (0adbeh),a
adbc 2af600    ld      hl,(00f6h)
adbf d1        pop     de
adc0 19        add     hl,de
adc1 32c6ad    ld      (0adc6h),a
adc4 22f600    ld      (00f6h),hl
adc7 32ccad    ld      (0adcch),a
adca 2aec00    ld      hl,(00ech)
adcd 22d1ad    ld      (0add1h),hl
add0 cdd3ad    call    0add3h
add3 3a7684    ld      a,(8476h)
add6 210800    ld      hl,0008h
add9 e5        push    hl
adda 32dfad    ld      (0addfh),a
addd 2af600    ld      hl,(00f6h)
ade0 d1        pop     de
ade1 a7        and     a
ade2 ed52      sbc     hl,de
ade4 32e9ad    ld      (0ade9h),a
ade7 22f600    ld      (00f6h),hl
adea 32efad    ld      (0adefh),a
aded 2aec00    ld      hl,(00ech)
adf0 22f4ad    ld      (0adf4h),hl
adf3 cdf6ad    call    0adf6h
adf6 3a7684    ld      a,(8476h)
adf9 210000    ld      hl,0000h
adfc e5        push    hl
adfd 2a13c0    ld      hl,(0c013h)
ae00 d1        pop     de
ae01 cdde85    call    85deh
ae04 cd3986    call    8639h
ae07 ca0dae    jp      z,0ae0dh
ae0a c31dae    jp      0ae1dh
ae0d dd66ff    ld      h,(ix-01h)
ae10 dd6efe    ld      l,(ix-02h)
ae13 23        inc     hl
ae14 dd74ff    ld      (ix-01h),h
ae17 dd75fe    ld      (ix-02h),l
ae1a c3a1ad    jp      0ada1h
ae1d 210000    ld      hl,0000h
ae20 e5        push    hl
ae21 2a13c0    ld      hl,(0c013h)
ae24 d1        pop     de
ae25 cdd185    call    85d1h
ae28 cd3986    call    8639h
ae2b cadcae    jp      z,0aedch
ae2e 210300    ld      hl,0003h
ae31 e5        push    hl
ae32 210300    ld      hl,0003h
ae35 cd0f81    call    810fh
ae38 e5        push    hl
ae39 323eae    ld      (0ae3eh),a
ae3c 2af600    ld      hl,(00f6h)
ae3f e5        push    hl
ae40 3245ae    ld      (0ae45h),a
ae43 2aca00    ld      hl,(00cah)
ae46 d1        pop     de
ae47 a7        and     a
ae48 ed52      sbc     hl,de
ae4a c1        pop     bc
ae4b d1        pop     de
ae4c cd1b81    call    811bh
ae4f e5        push    hl
ae50 3255ae    ld      (0ae55h),a
ae53 2af600    ld      hl,(00f6h)
ae56 d1        pop     de
ae57 19        add     hl,de
ae58 325dae    ld      (0ae5dh),a
ae5b 22f600    ld      (00f6h),hl
ae5e 210300    ld      hl,0003h
ae61 e5        push    hl
ae62 210300    ld      hl,0003h
ae65 cd0f81    call    810fh
ae68 e5        push    hl
ae69 326eae    ld      (0ae6eh),a
ae6c 2af400    ld      hl,(00f4h)
ae6f e5        push    hl
ae70 3275ae    ld      (0ae75h),a
ae73 2ac800    ld      hl,(00c8h)
ae76 d1        pop     de
ae77 a7        and     a
ae78 ed52      sbc     hl,de
ae7a c1        pop     bc
ae7b d1        pop     de
ae7c cd1b81    call    811bh
ae7f e5        push    hl
ae80 3285ae    ld      (0ae85h),a
ae83 2af400    ld      hl,(00f4h)
ae86 d1        pop     de
ae87 19        add     hl,de
ae88 328dae    ld      (0ae8dh),a
ae8b 22f400    ld      (00f4h),hl
ae8e 210500    ld      hl,0005h
ae91 e5        push    hl
ae92 3297ae    ld      (0ae97h),a
ae95 2ac800    ld      hl,(00c8h)
ae98 e5        push    hl
ae99 329eae    ld      (0ae9eh),a
ae9c 2af400    ld      hl,(00f4h)
ae9f d1        pop     de
aea0 a7        and     a
aea1 ed52      sbc     hl,de
aea3 cd0c81    call    810ch
aea6 e5        push    hl
aea7 32acae    ld      (0aeach),a
aeaa 2aca00    ld      hl,(00cah)
aead e5        push    hl
aeae 32b3ae    ld      (0aeb3h),a
aeb1 2af600    ld      hl,(00f6h)
aeb4 d1        pop     de
aeb5 a7        and     a
aeb6 ed52      sbc     hl,de
aeb8 cd0c81    call    810ch
aebb d1        pop     de
aebc 19        add     hl,de
aebd d1        pop     de
aebe cd0086    call    8600h
aec1 cd3986    call    8639h
aec4 cacaae    jp      z,0aecah
aec7 c3dcae    jp      0aedch
aeca 32cfae    ld      (0aecfh),a
aecd 2aec00    ld      hl,(00ech)
aed0 22d4ae    ld      (0aed4h),hl
aed3 cdd6ae    call    0aed6h
aed6 3a7684    ld      a,(8476h)
aed9 c31dae    jp      0ae1dh
aedc 210100    ld      hl,0001h
aedf cd0f81    call    810fh
aee2 32e7ae    ld      (0aee7h),a
aee5 22ce00    ld      (00ceh),hl
aee8 32edae    ld      (0aeedh),a
aeeb 2ada00    ld      hl,(00dah)
aeee e5        push    hl
aeef 2aebbf    ld      hl,(0bfebh)
aef2 d1        pop     de
aef3 cb23      sla     e
aef5 cb12      rl      d
aef7 19        add     hl,de
aef8 22fcae    ld      (0aefch),hl
aefb 2a0000    ld      hl,(0000h)
aefe 3203af    ld      (0af03h),a
af01 22f000    ld      (00f0h),hl
af04 210000    ld      hl,0000h
af07 dd74ff    ld      (ix-01h),h
af0a dd75fe    ld      (ix-02h),l
af0d ddf9      ld      sp,ix
af0f dde1      pop     ix
af11 c9        ret     

af12 cd1580    call    8015h
af15 dde5      push    ix
af17 dd210000  ld      ix,0000h
af1b dd39      add     ix,sp
af1d e5        push    hl
af1e e5        push    hl
af1f e5        push    hl
af20 210000    ld      hl,0000h
af23 dd74fd    ld      (ix-03h),h
af26 dd75fc    ld      (ix-04h),l
af29 3ed2      ld      a,0d2h
af2b fed6      cp      0d6h
af2d d21db0    jp      nc,0b01dh
af30 f5        push    af
af31 67        ld      h,a
af32 2e00      ld      l,00h
af34 cd43af    call    0af43h
af37 e3        ex      (sp),hl
af38 7c        ld      a,h
af39 e1        pop     hl
af3a 67        ld      h,a
af3b 2e00      ld      l,00h
af3d da1db0    jp      c,0b01dh
af40 3c        inc     a
af41 18e8      jr      0af2bh
af43 cd8782    call    8287h
af46 2002      jr      nz,0af4ah
af48 b7        or      a
af49 c9        ret     

af4a 3a7684    ld      a,(8476h)
af4d bc        cp      h
af4e 2002      jr      nz,0af52h
af50 b7        or      a
af51 c9        ret     

af52 e5        push    hl
af53 7c        ld      a,h
af54 1101a7    ld      de,0a701h
af57 cdb084    call    84b0h
af5a 3a7684    ld      a,(8476h)
af5d e1        pop     hl
af5e 2802      jr      z,0af62h
af60 b7        or      a
af61 c9        ret     

af62 dd74fb    ld      (ix-05h),h
af65 dd75fa    ld      (ix-06h),l
af68 210000    ld      hl,0000h
af6b e5        push    hl
af6c dd66fb    ld      h,(ix-05h)
af6f dd6efa    ld      l,(ix-06h)
af72 54        ld      d,h
af73 1ece      ld      e,0ceh
af75 ed537aaf  ld      (0af7ah),de
af79 2a0000    ld      hl,(0000h)
af7c d1        pop     de
af7d cd0086    call    8600h
af80 cd3986    call    8639h
af83 cab2af    jp      z,0afb2h
af86 210000    ld      hl,0000h
af89 e5        push    hl
af8a 328faf    ld      (0af8fh),a
af8d 2ad400    ld      hl,(00d4h)
af90 e5        push    hl
af91 dd66fb    ld      h,(ix-05h)
af94 dd6efa    ld      l,(ix-06h)
af97 54        ld      d,h
af98 1ee2      ld      e,0e2h
af9a ed539faf  ld      (0af9fh),de
af9e 2a0000    ld      hl,(0000h)
afa1 e5        push    hl
afa2 32a7af    ld      (0afa7h),a
afa5 2ae200    ld      hl,(00e2h)
afa8 d1        pop     de
afa9 a7        and     a
afaa ed52      sbc     hl,de
afac d1        pop     de
afad 19        add     hl,de
afae d1        pop     de
afaf cdeb85    call    85ebh
afb2 cd3986    call    8639h
afb5 cae3af    jp      z,0afe3h
afb8 dd66fd    ld      h,(ix-03h)
afbb dd6efc    ld      l,(ix-04h)
afbe e5        push    hl
afbf dd66fb    ld      h,(ix-05h)
afc2 dd6efa    ld      l,(ix-06h)
afc5 54        ld      d,h
afc6 1eda      ld      e,0dah
afc8 ed53cdaf  ld      (0afcdh),de
afcc 2a0000    ld      hl,(0000h)
afcf e5        push    hl
afd0 2ae1bf    ld      hl,(0bfe1h)
afd3 d1        pop     de
afd4 cb23      sla     e
afd6 cb12      rl      d
afd8 19        add     hl,de
afd9 22ddaf    ld      (0afddh),hl
afdc 2a0000    ld      hl,(0000h)
afdf d1        pop     de
afe0 cdeb85    call    85ebh
afe3 cd3986    call    8639h
afe6 ca1bb0    jp      z,0b01bh
afe9 dd66fb    ld      h,(ix-05h)
afec dd6efa    ld      l,(ix-06h)
afef dd74ff    ld      (ix-01h),h
aff2 dd75fe    ld      (ix-02h),l
aff5 dd66fb    ld      h,(ix-05h)
aff8 dd6efa    ld      l,(ix-06h)
affb 54        ld      d,h
affc 1eda      ld      e,0dah
affe ed5303b0  ld      (0b003h),de
b002 2a0000    ld      hl,(0000h)
b005 e5        push    hl
b006 2ae1bf    ld      hl,(0bfe1h)
b009 d1        pop     de
b00a cb23      sla     e
b00c cb12      rl      d
b00e 19        add     hl,de
b00f 2213b0    ld      (0b013h),hl
b012 2a0000    ld      hl,(0000h)
b015 dd74fd    ld      (ix-03h),h
b018 dd75fc    ld      (ix-04h),l
b01b b7        or      a
b01c c9        ret     

b01d 3a7684    ld      a,(8476h)
b020 dd66ff    ld      h,(ix-01h)
b023 dd6efe    ld      l,(ix-02h)
b026 c329b0    jp      0b029h
b029 ddf9      ld      sp,ix
b02b dde1      pop     ix
b02d c9        ret     

b02e cd1580    call    8015h
b031 dde5      push    ix
b033 dd210000  ld      ix,0000h
b037 dd39      add     ix,sp
b039 21e803    ld      hl,03e8h
b03c 221bc0    ld      (0c01bh),hl
b03f 210000    ld      hl,0000h
b042 221dc0    ld      (0c01dh),hl
b045 3ed6      ld      a,0d6h
b047 feda      cp      0dah
b049 d267b1    jp      nc,0b167h
b04c f5        push    af
b04d 67        ld      h,a
b04e 2e00      ld      l,00h
b050 cd5fb0    call    0b05fh
b053 e3        ex      (sp),hl
b054 7c        ld      a,h
b055 e1        pop     hl
b056 67        ld      h,a
b057 2e00      ld      l,00h
b059 da67b1    jp      c,0b167h
b05c 3c        inc     a
b05d 18e8      jr      0b047h
b05f cd8782    call    8287h
b062 2002      jr      nz,0b066h
b064 b7        or      a
b065 c9        ret     

b066 3a7684    ld      a,(8476h)
b069 bc        cp      h
b06a 2002      jr      nz,0b06eh
b06c b7        or      a
b06d c9        ret     

b06e e5        push    hl
b06f 7c        ld      a,h
b070 1155a1    ld      de,0a155h
b073 cdb084    call    84b0h
b076 3a7684    ld      a,(8476h)
b079 e1        pop     hl
b07a 2802      jr      z,0b07eh
b07c b7        or      a
b07d c9        ret     

b07e 221fc0    ld      (0c01fh),hl
b081 210000    ld      hl,0000h
b084 e5        push    hl
b085 2a1fc0    ld      hl,(0c01fh)
b088 54        ld      d,h
b089 1ee2      ld      e,0e2h
b08b ed5390b0  ld      (0b090h),de
b08f 2a0000    ld      hl,(0000h)
b092 d1        pop     de
b093 cd0f86    call    860fh
b096 cd3986    call    8639h
b099 ca65b1    jp      z,0b165h
b09c 32a1b0    ld      (0b0a1h),a
b09f 2af400    ld      hl,(00f4h)
b0a2 e5        push    hl
b0a3 2a1fc0    ld      hl,(0c01fh)
b0a6 54        ld      d,h
b0a7 1ef4      ld      e,0f4h
b0a9 ed53aeb0  ld      (0b0aeh),de
b0ad 2a0000    ld      hl,(0000h)
b0b0 d1        pop     de
b0b1 a7        and     a
b0b2 ed52      sbc     hl,de
b0b4 cd0c81    call    810ch
b0b7 e5        push    hl
b0b8 32bdb0    ld      (0b0bdh),a
b0bb 2af600    ld      hl,(00f6h)
b0be e5        push    hl
b0bf 2a1fc0    ld      hl,(0c01fh)
b0c2 54        ld      d,h
b0c3 1ef6      ld      e,0f6h
b0c5 ed53cab0  ld      (0b0cah),de
b0c9 2a0000    ld      hl,(0000h)
b0cc d1        pop     de
b0cd a7        and     a
b0ce ed52      sbc     hl,de
b0d0 cd0c81    call    810ch
b0d3 d1        pop     de
b0d4 19        add     hl,de
b0d5 2221c0    ld      (0c021h),hl
b0d8 32ddb0    ld      (0b0ddh),a
b0db 2ac400    ld      hl,(00c4h)
b0de cd3986    call    8639h
b0e1 ca06b1    jp      z,0b106h
b0e4 32e9b0    ld      (0b0e9h),a
b0e7 2ac400    ld      hl,(00c4h)
b0ea 54        ld      d,h
b0eb 1eda      ld      e,0dah
b0ed ed53f2b0  ld      (0b0f2h),de
b0f1 2a0000    ld      hl,(0000h)
b0f4 e5        push    hl
b0f5 2a1fc0    ld      hl,(0c01fh)
b0f8 54        ld      d,h
b0f9 1eda      ld      e,0dah
b0fb ed5300b1  ld      (0b100h),de
b0ff 2a0000    ld      hl,(0000h)
b102 d1        pop     de
b103 cdd185    call    85d1h
b106 cd3986    call    8639h
b109 ca24b1    jp      z,0b124h
b10c 3211b1    ld      (0b111h),a
b10f 2ad600    ld      hl,(00d6h)
b112 e5        push    hl
b113 2a21c0    ld      hl,(0c021h)
b116 c1        pop     bc
b117 41        ld      b,c
b118 cb25      sla     l
b11a cb14      rl      h
b11c 10fa      djnz    0b118h
b11e 2221c0    ld      (0c021h),hl
b121 c348b1    jp      0b148h
b124 3229b1    ld      (0b129h),a
b127 2ada00    ld      hl,(00dah)
b12a e5        push    hl
b12b 2a1fc0    ld      hl,(0c01fh)
b12e 54        ld      d,h
b12f 1eda      ld      e,0dah
b131 ed5336b1  ld      (0b136h),de
b135 2a0000    ld      hl,(0000h)
b138 d1        pop     de
b139 cdde85    call    85deh
b13c cd3986    call    8639h
b13f ca48b1    jp      z,0b148h
b142 211027    ld      hl,2710h
b145 2221c0    ld      (0c021h),hl
b148 2a1bc0    ld      hl,(0c01bh)
b14b e5        push    hl
b14c 2a21c0    ld      hl,(0c021h)
b14f d1        pop     de
b150 cd0086    call    8600h
b153 cd3986    call    8639h
b156 ca65b1    jp      z,0b165h
b159 2a1fc0    ld      hl,(0c01fh)
b15c 221dc0    ld      (0c01dh),hl
b15f 2a21c0    ld      hl,(0c021h)
b162 221bc0    ld      (0c01bh),hl
b165 b7        or      a
b166 c9        ret     

b167 3a7684    ld      a,(8476h)
b16a 2a1dc0    ld      hl,(0c01dh)
b16d c370b1    jp      0b170h
b170 ddf9      ld      sp,ix
b172 dde1      pop     ix
b174 c9        ret     

b175 cd1580    call    8015h
b178 dde5      push    ix
b17a dd210000  ld      ix,0000h
b17e dd39      add     ix,sp
b180 210000    ld      hl,0000h
b183 2223c0    ld      (0c023h),hl
b186 210100    ld      hl,0001h
b189 cd0f81    call    810fh
b18c 2225c0    ld      (0c025h),hl
b18f 3294b1    ld      (0b194h),a
b192 2ac400    ld      hl,(00c4h)
b195 cd3986    call    8639h
b198 cad4b1    jp      z,0b1d4h
b19b 32a0b1    ld      (0b1a0h),a
b19e 2ac400    ld      hl,(00c4h)
b1a1 54        ld      d,h
b1a2 1ef6      ld      e,0f6h
b1a4 ed53a9b1  ld      (0b1a9h),de
b1a8 2a0000    ld      hl,(0000h)
b1ab 2227c0    ld      (0c027h),hl
b1ae 32b3b1    ld      (0b1b3h),a
b1b1 2ac400    ld      hl,(00c4h)
b1b4 54        ld      d,h
b1b5 1ef4      ld      e,0f4h
b1b7 ed53bcb1  ld      (0b1bch),de
b1bb 2a0000    ld      hl,(0000h)
b1be 2229c0    ld      (0c029h),hl
b1c1 32c6b1    ld      (0b1c6h),a
b1c4 2ac400    ld      hl,(00c4h)
b1c7 54        ld      d,h
b1c8 1eda      ld      e,0dah
b1ca ed53cfb1  ld      (0b1cfh),de
b1ce 2a0000    ld      hl,(0000h)
b1d1 2225c0    ld      (0c025h),hl
b1d4 210000    ld      hl,0000h
b1d7 222bc0    ld      (0c02bh),hl
b1da 210200    ld      hl,0002h
b1dd e5        push    hl
b1de 2a2bc0    ld      hl,(0c02bh)
b1e1 d1        pop     de
b1e2 cd0086    call    8600h
b1e5 cd3986    call    8639h
b1e8 ca16b3    jp      z,0b316h
b1eb 211000    ld      hl,0010h
b1ee e5        push    hl
b1ef 212000    ld      hl,0020h
b1f2 e5        push    hl
b1f3 210002    ld      hl,0200h
b1f6 d1        pop     de
b1f7 a7        and     a
b1f8 ed52      sbc     hl,de
b1fa cdeb80    call    80ebh
b1fd d1        pop     de
b1fe 19        add     hl,de
b1ff 222dc0    ld      (0c02dh),hl
b202 212000    ld      hl,0020h
b205 e5        push    hl
b206 213000    ld      hl,0030h
b209 e5        push    hl
b20a 218001    ld      hl,0180h
b20d d1        pop     de
b20e a7        and     a
b20f ed52      sbc     hl,de
b211 cdeb80    call    80ebh
b214 d1        pop     de
b215 19        add     hl,de
b216 222fc0    ld      (0c02fh),hl
b219 321eb2    ld      (0b21eh),a
b21c 2af400    ld      hl,(00f4h)
b21f e5        push    hl
b220 3225b2    ld      (0b225h),a
b223 2ac800    ld      hl,(00c8h)
b226 d1        pop     de
b227 a7        and     a
b228 ed52      sbc     hl,de
b22a cd0c81    call    810ch
b22d e5        push    hl
b22e 3233b2    ld      (0b233h),a
b231 2af600    ld      hl,(00f6h)
b234 e5        push    hl
b235 323ab2    ld      (0b23ah),a
b238 2aca00    ld      hl,(00cah)
b23b d1        pop     de
b23c a7        and     a
b23d ed52      sbc     hl,de
b23f cd0c81    call    810ch
b242 e5        push    hl
b243 21d007    ld      hl,07d0h
b246 d1        pop     de
b247 a7        and     a
b248 ed52      sbc     hl,de
b24a d1        pop     de
b24b a7        and     a
b24c ed52      sbc     hl,de
b24e 2231c0    ld      (0c031h),hl
b251 210300    ld      hl,0003h
b254 e5        push    hl
b255 2a2fc0    ld      hl,(0c02fh)
b258 e5        push    hl
b259 2a2dc0    ld      hl,(0c02dh)
b25c d1        pop     de
b25d cdc289    call    89c2h
b260 2600      ld      h,00h
b262 6f        ld      l,a
b263 3a7684    ld      a,(8476h)
b266 d1        pop     de
b267 a7        and     a
b268 ed52      sbc     hl,de
b26a 2233c0    ld      (0c033h),hl
b26d 3272b2    ld      (0b272h),a
b270 2ada00    ld      hl,(00dah)
b273 e5        push    hl
b274 2a33c0    ld      hl,(0c033h)
b277 d1        pop     de
b278 cdde85    call    85deh
b27b cd3986    call    8639h
b27e ca8db2    jp      z,0b28dh
b281 21e803    ld      hl,03e8h
b284 e5        push    hl
b285 2a31c0    ld      hl,(0c031h)
b288 d1        pop     de
b289 19        add     hl,de
b28a 2231c0    ld      (0c031h),hl
b28d 210000    ld      hl,0000h
b290 e5        push    hl
b291 2a25c0    ld      hl,(0c025h)
b294 d1        pop     de
b295 cd0f86    call    860fh
b298 cd3986    call    8639h
b29b cae3b2    jp      z,0b2e3h
b29e 2a25c0    ld      hl,(0c025h)
b2a1 e5        push    hl
b2a2 2a33c0    ld      hl,(0c033h)
b2a5 d1        pop     de
b2a6 cdd185    call    85d1h
b2a9 cd3986    call    8639h
b2ac cabbb2    jp      z,0b2bbh
b2af 21e803    ld      hl,03e8h
b2b2 e5        push    hl
b2b3 2a31c0    ld      hl,(0c031h)
b2b6 d1        pop     de
b2b7 19        add     hl,de
b2b8 2231c0    ld      (0c031h),hl
b2bb 2a2fc0    ld      hl,(0c02fh)
b2be e5        push    hl
b2bf 2a29c0    ld      hl,(0c029h)
b2c2 d1        pop     de
b2c3 a7        and     a
b2c4 ed52      sbc     hl,de
b2c6 cd0c81    call    810ch
b2c9 e5        push    hl
b2ca 2a2dc0    ld      hl,(0c02dh)
b2cd e5        push    hl
b2ce 2a27c0    ld      hl,(0c027h)
b2d1 d1        pop     de
b2d2 a7        and     a
b2d3 ed52      sbc     hl,de
b2d5 cd0c81    call    810ch
b2d8 d1        pop     de
b2d9 19        add     hl,de
b2da e5        push    hl
b2db 2a31c0    ld      hl,(0c031h)
b2de d1        pop     de
b2df 19        add     hl,de
b2e0 2231c0    ld      (0c031h),hl
b2e3 2a23c0    ld      hl,(0c023h)
b2e6 e5        push    hl
b2e7 2a31c0    ld      hl,(0c031h)
b2ea d1        pop     de
b2eb cdeb85    call    85ebh
b2ee cd3986    call    8639h
b2f1 ca0cb3    jp      z,0b30ch
b2f4 2a2dc0    ld      hl,(0c02dh)
b2f7 32fcb2    ld      (0b2fch),a
b2fa 22d200    ld      (00d2h),hl
b2fd 2a2fc0    ld      hl,(0c02fh)
b300 3205b3    ld      (0b305h),a
b303 22d000    ld      (00d0h),hl
b306 2a31c0    ld      hl,(0c031h)
b309 2223c0    ld      (0c023h),hl
b30c 2a2bc0    ld      hl,(0c02bh)
b30f 23        inc     hl
b310 222bc0    ld      (0c02bh),hl
b313 c3dab1    jp      0b1dah
b316 ddf9      ld      sp,ix
b318 dde1      pop     ix
b31a c9        ret     

b31b cd1580    call    8015h
b31e ae        xor     (hl)
b31f 87        add     a,a
b320 0120b3    ld      bc,0b320h
b323 c5        push    bc
b324 017ab3    ld      bc,0b37ah
b327 c5        push    bc
b328 010000    ld      bc,0000h
b32b c5        push    bc
b32c 010000    ld      bc,0000h
b32f c5        push    bc
b330 010000    ld      bc,0000h
b333 c5        push    bc
b334 010000    ld      bc,0000h
b337 c5        push    bc
b338 011788    ld      bc,8817h
b33b c5        push    bc
b33c 01f687    ld      bc,87f6h
b33f c5        push    bc
b340 011888    ld      bc,8818h
b343 c5        push    bc
b344 014f88    ld      bc,884fh
b347 c5        push    bc
b348 016588    ld      bc,8865h
b34b c5        push    bc
b34c 01c188    ld      bc,88c1h
b34f c5        push    bc
b350 010000    ld      bc,0000h
b353 c5        push    bc
b354 010000    ld      bc,0000h
b357 c5        push    bc
b358 010000    ld      bc,0000h
b35b c5        push    bc
b35c 010000    ld      bc,0000h
b35f c5        push    bc
b360 010000    ld      bc,0000h
b363 c5        push    bc
b364 018ab3    ld      bc,0b38ah
b367 c5        push    bc
b368 01adb7    ld      bc,0b7adh
b36b c5        push    bc
b36c 013b88    ld      bc,883bh
b36f c5        push    bc
b370 018784    ld      bc,8487h
b373 c5        push    bc
b374 c39883    jp      8398h
b377 cd1580    call    8015h
b37a dde5      push    ix
b37c dd210000  ld      ix,0000h
b380 dd39      add     ix,sp
b382 ddf9      ld      sp,ix
b384 dde1      pop     ix
b386 c9        ret     

b387 cd1580    call    8015h
b38a dde5      push    ix
b38c dd210000  ld      ix,0000h
b390 dd39      add     ix,sp
b392 e5        push    hl
b393 e5        push    hl
b394 3299b3    ld      (0b399h),a
b397 2ae200    ld      hl,(00e2h)
b39a cd4b86    call    864bh
b39d cd3986    call    8639h
b3a0 caa6b3    jp      z,0b3a6h
b3a3 c3a5b7    jp      0b7a5h
b3a6 32abb3    ld      (0b3abh),a
b3a9 2ae000    ld      hl,(00e0h)
b3ac 5d        ld      e,l
b3ad d5        push    de
b3ae 32b3b3    ld      (0b3b3h),a
b3b1 2adc00    ld      hl,(00dch)
b3b4 7d        ld      a,l
b3b5 d1        pop     de
b3b6 c608      add     a,08h
b3b8 cd9300    call    0093h
b3bb 3a7684    ld      a,(8476h)
b3be 32c3b3    ld      (0b3c3h),a
b3c1 2ada00    ld      hl,(00dah)
b3c4 2b        dec     hl
b3c5 32cab3    ld      (0b3cah),a
b3c8 22da00    ld      (00dah),hl
b3cb 210000    ld      hl,0000h
b3ce e5        push    hl
b3cf 32d4b3    ld      (0b3d4h),a
b3d2 2ae000    ld      hl,(00e0h)
b3d5 d1        pop     de
b3d6 cdeb85    call    85ebh
b3d9 cd3986    call    8639h
b3dc caecb3    jp      z,0b3ech
b3df 32e4b3    ld      (0b3e4h),a
b3e2 2ae000    ld      hl,(00e0h)
b3e5 2b        dec     hl
b3e6 32ebb3    ld      (0b3ebh),a
b3e9 22e000    ld      (00e0h),hl
b3ec 210000    ld      hl,0000h
b3ef e5        push    hl
b3f0 32f5b3    ld      (0b3f5h),a
b3f3 2ada00    ld      hl,(00dah)
b3f6 d1        pop     de
b3f7 cdeb85    call    85ebh
b3fa cd4b86    call    864bh
b3fd cd3986    call    8639h
b400 caa5b7    jp      z,0b7a5h
b403 3208b4    ld      (0b408h),a
b406 2ae200    ld      hl,(00e2h)
b409 220db4    ld      (0b40dh),hl
b40c 2a0000    ld      hl,(0000h)
b40f 2600      ld      h,00h
b411 dd74ff    ld      (ix-01h),h
b414 dd75fe    ld      (ix-02h),l
b417 210000    ld      hl,0000h
b41a e5        push    hl
b41b dd66ff    ld      h,(ix-01h)
b41e dd6efe    ld      l,(ix-02h)
b421 d1        pop     de
b422 cd0f86    call    860fh
b425 cd3986    call    8639h
b428 ca39b4    jp      z,0b439h
b42b 216000    ld      hl,0060h
b42e e5        push    hl
b42f dd66ff    ld      h,(ix-01h)
b432 dd6efe    ld      l,(ix-02h)
b435 d1        pop     de
b436 cd0086    call    8600h
b439 cd3986    call    8639h
b43c ca99b4    jp      z,0b499h
b43f dd66ff    ld      h,(ix-01h)
b442 dd6efe    ld      l,(ix-02h)
b445 e5        push    hl
b446 324bb4    ld      (0b44bh),a
b449 2adc00    ld      hl,(00dch)
b44c 7d        ld      a,l
b44d e1        pop     hl
b44e cd8790    call    9087h
b451 3a7684    ld      a,(8476h)
b454 3259b4    ld      (0b459h),a
b457 2ade00    ld      hl,(00deh)
b45a 325fb4    ld      (0b45fh),a
b45d 22e000    ld      (00e0h),hl
b460 210700    ld      hl,0007h
b463 3268b4    ld      (0b468h),a
b466 22da00    ld      (00dah),hl
b469 210200    ld      hl,0002h
b46c e5        push    hl
b46d 3272b4    ld      (0b472h),a
b470 2adc00    ld      hl,(00dch)
b473 d1        pop     de
b474 cdd185    call    85d1h
b477 cd3986    call    8639h
b47a ca86b4    jp      z,0b486h
b47d 210200    ld      hl,0002h
b480 3285b4    ld      (0b485h),a
b483 22da00    ld      (00dah),hl
b486 328bb4    ld      (0b48bh),a
b489 2ae200    ld      hl,(00e2h)
b48c 23        inc     hl
b48d 3292b4    ld      (0b492h),a
b490 22e200    ld      (00e2h),hl
b493 c3a5b7    jp      0b7a5h
b496 c3a2b7    jp      0b7a2h
b499 216300    ld      hl,0063h
b49c e5        push    hl
b49d dd66ff    ld      h,(ix-01h)
b4a0 dd6efe    ld      l,(ix-02h)
b4a3 d1        pop     de
b4a4 cdd185    call    85d1h
b4a7 cd3986    call    8639h
b4aa cad2b4    jp      z,0b4d2h
b4ad 210000    ld      hl,0000h
b4b0 32b5b4    ld      (0b4b5h),a
b4b3 22e000    ld      (00e0h),hl
b4b6 210700    ld      hl,0007h
b4b9 32beb4    ld      (0b4beh),a
b4bc 22da00    ld      (00dah),hl
b4bf 32c4b4    ld      (0b4c4h),a
b4c2 2ae200    ld      hl,(00e2h)
b4c5 23        inc     hl
b4c6 32cbb4    ld      (0b4cbh),a
b4c9 22e200    ld      (00e2h),hl
b4cc c3a5b7    jp      0b7a5h
b4cf c3a2b7    jp      0b7a2h
b4d2 217c00    ld      hl,007ch
b4d5 e5        push    hl
b4d6 dd66ff    ld      h,(ix-01h)
b4d9 dd6efe    ld      l,(ix-02h)
b4dc d1        pop     de
b4dd cdd185    call    85d1h
b4e0 cd3986    call    8639h
b4e3 ca08b5    jp      z,0b508h
b4e6 210000    ld      hl,0000h
b4e9 32eeb4    ld      (0b4eeh),a
b4ec 22e000    ld      (00e0h),hl
b4ef 210c00    ld      hl,000ch
b4f2 32f7b4    ld      (0b4f7h),a
b4f5 22de00    ld      (00deh),hl
b4f8 32fdb4    ld      (0b4fdh),a
b4fb 2ae200    ld      hl,(00e2h)
b4fe 23        inc     hl
b4ff 3204b5    ld      (0b504h),a
b502 22e200    ld      (00e2h),hl
b505 c3a2b7    jp      0b7a2h
b508 216800    ld      hl,0068h
b50b e5        push    hl
b50c dd66ff    ld      h,(ix-01h)
b50f dd6efe    ld      l,(ix-02h)
b512 d1        pop     de
b513 cdd185    call    85d1h
b516 cd3986    call    8639h
b519 ca5eb5    jp      z,0b55eh
b51c 3221b5    ld      (0b521h),a
b51f 2ae200    ld      hl,(00e2h)
b522 23        inc     hl
b523 3228b5    ld      (0b528h),a
b526 22e200    ld      (00e2h),hl
b529 322eb5    ld      (0b52eh),a
b52c 2ad600    ld      hl,(00d6h)
b52f 2233b5    ld      (0b533h),hl
b532 cd35b5    call    0b535h
b535 3a7684    ld      a,(8476h)
b538 dd74fd    ld      (ix-03h),h
b53b dd75fc    ld      (ix-04h),l
b53e 210000    ld      hl,0000h
b541 e5        push    hl
b542 dd66fd    ld      h,(ix-03h)
b545 dd6efc    ld      l,(ix-04h)
b548 d1        pop     de
b549 a7        and     a
b54a ed52      sbc     hl,de
b54c e5        push    hl
b54d 3252b5    ld      (0b552h),a
b550 2ae200    ld      hl,(00e2h)
b553 d1        pop     de
b554 19        add     hl,de
b555 325ab5    ld      (0b55ah),a
b558 22e200    ld      (00e2h),hl
b55b c3a2b7    jp      0b7a2h
b55e 21ff00    ld      hl,00ffh
b561 e5        push    hl
b562 dd66ff    ld      h,(ix-01h)
b565 dd6efe    ld      l,(ix-02h)
b568 d1        pop     de
b569 cdd185    call    85d1h
b56c cd3986    call    8639h
b56f caa5b5    jp      z,0b5a5h
b572 210000    ld      hl,0000h
b575 327ab5    ld      (0b57ah),a
b578 22e200    ld      (00e2h),hl
b57b 3280b5    ld      (0b580h),a
b57e 2ae800    ld      hl,(00e8h)
b581 2285b5    ld      (0b585h),hl
b584 cd87b5    call    0b587h
b587 3a7684    ld      a,(8476h)
b58a 210000    ld      hl,0000h
b58d 5d        ld      e,l
b58e d5        push    de
b58f 3294b5    ld      (0b594h),a
b592 2adc00    ld      hl,(00dch)
b595 7d        ld      a,l
b596 d1        pop     de
b597 c608      add     a,08h
b599 cd9300    call    0093h
b59c 3a7684    ld      a,(8476h)
b59f c3a5b7    jp      0b7a5h
b5a2 c3a2b7    jp      0b7a2h
b5a5 216400    ld      hl,0064h
b5a8 e5        push    hl
b5a9 dd66ff    ld      h,(ix-01h)
b5ac dd6efe    ld      l,(ix-02h)
b5af d1        pop     de
b5b0 cdd185    call    85d1h
b5b3 cd3986    call    8639h
b5b6 cafab5    jp      z,0b5fah
b5b9 3a7684    ld      a,(8476h)
b5bc f5        push    af
b5bd 210100    ld      hl,0001h
b5c0 e5        push    hl
b5c1 32c6b5    ld      (0b5c6h),a
b5c4 2ae200    ld      hl,(00e2h)
b5c7 d1        pop     de
b5c8 19        add     hl,de
b5c9 22cdb5    ld      (0b5cdh),hl
b5cc 2a0000    ld      hl,(0000h)
b5cf 2600      ld      h,00h
b5d1 e5        push    hl
b5d2 210800    ld      hl,0008h
b5d5 d1        pop     de
b5d6 cde631    call    31e6h
b5d9 e3        ex      (sp),hl
b5da 7c        ld      a,h
b5db e1        pop     hl
b5dc 327684    ld      (8476h),a
b5df 32e4b5    ld      (0b5e4h),a
b5e2 22de00    ld      (00deh),hl
b5e5 210200    ld      hl,0002h
b5e8 e5        push    hl
b5e9 32eeb5    ld      (0b5eeh),a
b5ec 2ae200    ld      hl,(00e2h)
b5ef d1        pop     de
b5f0 19        add     hl,de
b5f1 32f6b5    ld      (0b5f6h),a
b5f4 22e200    ld      (00e2h),hl
b5f7 c3a2b7    jp      0b7a2h
b5fa 216500    ld      hl,0065h
b5fd e5        push    hl
b5fe dd66ff    ld      h,(ix-01h)
b601 dd6efe    ld      l,(ix-02h)
b604 d1        pop     de
b605 cdd185    call    85d1h
b608 cd3986    call    8639h
b60b ca23b6    jp      z,0b623h
b60e 210200    ld      hl,0002h
b611 e5        push    hl
b612 3217b6    ld      (0b617h),a
b615 2ae200    ld      hl,(00e2h)
b618 d1        pop     de
b619 19        add     hl,de
b61a 321fb6    ld      (0b61fh),a
b61d 22e200    ld      (00e2h),hl
b620 c3a2b7    jp      0b7a2h
b623 216600    ld      hl,0066h
b626 e5        push    hl
b627 dd66ff    ld      h,(ix-01h)
b62a dd6efe    ld      l,(ix-02h)
b62d d1        pop     de
b62e cdd185    call    85d1h
b631 cd3986    call    8639h
b634 ca4cb6    jp      z,0b64ch
b637 210200    ld      hl,0002h
b63a e5        push    hl
b63b 3240b6    ld      (0b640h),a
b63e 2ae200    ld      hl,(00e2h)
b641 d1        pop     de
b642 19        add     hl,de
b643 3248b6    ld      (0b648h),a
b646 22e200    ld      (00e2h),hl
b649 c3a2b7    jp      0b7a2h
b64c 216b00    ld      hl,006bh
b64f e5        push    hl
b650 dd66ff    ld      h,(ix-01h)
b653 dd6efe    ld      l,(ix-02h)
b656 d1        pop     de
b657 cdd185    call    85d1h
b65a cd3986    call    8639h
b65d ca75b6    jp      z,0b675h
b660 210200    ld      hl,0002h
b663 e5        push    hl
b664 3269b6    ld      (0b669h),a
b667 2ae200    ld      hl,(00e2h)
b66a d1        pop     de
b66b 19        add     hl,de
b66c 3271b6    ld      (0b671h),a
b66f 22e200    ld      (00e2h),hl
b672 c3a2b7    jp      0b7a2h
b675 216e00    ld      hl,006eh
b678 e5        push    hl
b679 dd66ff    ld      h,(ix-01h)
b67c dd6efe    ld      l,(ix-02h)
b67f d1        pop     de
b680 cdd185    call    85d1h
b683 cd3986    call    8639h
b686 ca9eb6    jp      z,0b69eh
b689 210200    ld      hl,0002h
b68c e5        push    hl
b68d 3292b6    ld      (0b692h),a
b690 2ae200    ld      hl,(00e2h)
b693 d1        pop     de
b694 19        add     hl,de
b695 329ab6    ld      (0b69ah),a
b698 22e200    ld      (00e2h),hl
b69b c3a2b7    jp      0b7a2h
b69e 217300    ld      hl,0073h
b6a1 e5        push    hl
b6a2 dd66ff    ld      h,(ix-01h)
b6a5 dd6efe    ld      l,(ix-02h)
b6a8 d1        pop     de
b6a9 cdd185    call    85d1h
b6ac cd3986    call    8639h
b6af cac7b6    jp      z,0b6c7h
b6b2 210400    ld      hl,0004h
b6b5 e5        push    hl
b6b6 32bbb6    ld      (0b6bbh),a
b6b9 2ae200    ld      hl,(00e2h)
b6bc d1        pop     de
b6bd 19        add     hl,de
b6be 32c3b6    ld      (0b6c3h),a
b6c1 22e200    ld      (00e2h),hl
b6c4 c3a2b7    jp      0b7a2h
b6c7 217400    ld      hl,0074h
b6ca e5        push    hl
b6cb dd66ff    ld      h,(ix-01h)
b6ce dd6efe    ld      l,(ix-02h)
b6d1 d1        pop     de
b6d2 cdd185    call    85d1h
b6d5 cd3986    call    8639h
b6d8 caf0b6    jp      z,0b6f0h
b6db 210200    ld      hl,0002h
b6de e5        push    hl
b6df 32e4b6    ld      (0b6e4h),a
b6e2 2ae200    ld      hl,(00e2h)
b6e5 d1        pop     de
b6e6 19        add     hl,de
b6e7 32ecb6    ld      (0b6ech),a
b6ea 22e200    ld      (00e2h),hl
b6ed c3a2b7    jp      0b7a2h
b6f0 217600    ld      hl,0076h
b6f3 e5        push    hl
b6f4 dd66ff    ld      h,(ix-01h)
b6f7 dd6efe    ld      l,(ix-02h)
b6fa d1        pop     de
b6fb cdd185    call    85d1h
b6fe cd3986    call    8639h
b701 ca19b7    jp      z,0b719h
b704 210200    ld      hl,0002h
b707 e5        push    hl
b708 320db7    ld      (0b70dh),a
b70b 2ae200    ld      hl,(00e2h)
b70e d1        pop     de
b70f 19        add     hl,de
b710 3215b7    ld      (0b715h),a
b713 22e200    ld      (00e2h),hl
b716 c3a2b7    jp      0b7a2h
b719 217800    ld      hl,0078h
b71c e5        push    hl
b71d dd66ff    ld      h,(ix-01h)
b720 dd6efe    ld      l,(ix-02h)
b723 d1        pop     de
b724 cdd185    call    85d1h
b727 cd3986    call    8639h
b72a ca42b7    jp      z,0b742h
b72d 210200    ld      hl,0002h
b730 e5        push    hl
b731 3236b7    ld      (0b736h),a
b734 2ae200    ld      hl,(00e2h)
b737 d1        pop     de
b738 19        add     hl,de
b739 323eb7    ld      (0b73eh),a
b73c 22e200    ld      (00e2h),hl
b73f c3a2b7    jp      0b7a2h
b742 217a00    ld      hl,007ah
b745 e5        push    hl
b746 dd66ff    ld      h,(ix-01h)
b749 dd6efe    ld      l,(ix-02h)
b74c d1        pop     de
b74d cdd185    call    85d1h
b750 cd3986    call    8639h
b753 ca6bb7    jp      z,0b76bh
b756 210300    ld      hl,0003h
b759 e5        push    hl
b75a 325fb7    ld      (0b75fh),a
b75d 2ae200    ld      hl,(00e2h)
b760 d1        pop     de
b761 19        add     hl,de
b762 3267b7    ld      (0b767h),a
b765 22e200    ld      (00e2h),hl
b768 c3a2b7    jp      0b7a2h
b76b 2171b7    ld      hl,0b771h
b76e c375b7    jp      0b775h
b771 49        ld      c,c
b772 6e        ld      l,(hl)
b773 76        halt    
b774 00        nop     
b775 cde981    call    81e9h
b778 3a7684    ld      a,(8476h)
b77b dd66ff    ld      h,(ix-01h)
b77e dd6efe    ld      l,(ix-02h)
b781 cd4090    call    9040h
b784 3a7684    ld      a,(8476h)
b787 328cb7    ld      (0b78ch),a
b78a 2ae800    ld      hl,(00e8h)
b78d 2291b7    ld      (0b791h),hl
b790 cd93b7    call    0b793h
b793 3a7684    ld      a,(8476h)
b796 210000    ld      hl,0000h
b799 329eb7    ld      (0b79eh),a
b79c 22e200    ld      (00e2h),hl
b79f c3a5b7    jp      0b7a5h
b7a2 c3ecb3    jp      0b3ech
b7a5 ddf9      ld      sp,ix
b7a7 dde1      pop     ix
b7a9 c9        ret     

b7aa cd1580    call    8015h
b7ad dde5      push    ix
b7af dd210000  ld      ix,0000h
b7b3 dd39      add     ix,sp
b7b5 210800    ld      hl,0008h
b7b8 e5        push    hl
b7b9 210100    ld      hl,0001h
b7bc e5        push    hl
b7bd 32c2b7    ld      (0b7c2h),a
b7c0 2ae200    ld      hl,(00e2h)
b7c3 d1        pop     de
b7c4 19        add     hl,de
b7c5 22c9b7    ld      (0b7c9h),hl
b7c8 2a0000    ld      hl,(0000h)
b7cb 2600      ld      h,00h
b7cd c1        pop     bc
b7ce 41        ld      b,c
b7cf cb25      sla     l
b7d1 cb14      rl      h
b7d3 10fa      djnz    0b7cfh
b7d5 e5        push    hl
b7d6 32dbb7    ld      (0b7dbh),a
b7d9 2ae200    ld      hl,(00e2h)
b7dc 22e0b7    ld      (0b7e0h),hl
b7df 2a0000    ld      hl,(0000h)
b7e2 2600      ld      h,00h
b7e4 d1        pop     de
b7e5 19        add     hl,de
b7e6 c3e9b7    jp      0b7e9h
b7e9 ddf9      ld      sp,ix
b7eb dde1      pop     ix
b7ed c9        ret     

b7ee cd1580    call    8015h
b7f1 ae        xor     (hl)
b7f2 87        add     a,a
b7f3 01f3b7    ld      bc,0b7f3h
b7f6 c5        push    bc
b7f7 0155b8    ld      bc,0b855h
b7fa c5        push    bc
b7fb 010000    ld      bc,0000h
b7fe c5        push    bc
b7ff 010000    ld      bc,0000h
b802 c5        push    bc
b803 010000    ld      bc,0000h
b806 c5        push    bc
b807 010000    ld      bc,0000h
b80a c5        push    bc
b80b 011788    ld      bc,8817h
b80e c5        push    bc
b80f 01f687    ld      bc,87f6h
b812 c5        push    bc
b813 011888    ld      bc,8818h
b816 c5        push    bc
b817 014f88    ld      bc,884fh
b81a c5        push    bc
b81b 016588    ld      bc,8865h
b81e c5        push    bc
b81f 01c188    ld      bc,88c1h
b822 c5        push    bc
b823 010000    ld      bc,0000h
b826 c5        push    bc
b827 010000    ld      bc,0000h
b82a c5        push    bc
b82b 010000    ld      bc,0000h
b82e c5        push    bc
b82f 0165b8    ld      bc,0b865h
b832 c5        push    bc
b833 01ddb9    ld      bc,0b9ddh
b836 c5        push    bc
b837 0177bb    ld      bc,0bb77h
b83a c5        push    bc
b83b 0165bc    ld      bc,0bc65h
b83e c5        push    bc
b83f 01d9ba    ld      bc,0bad9h
b842 c5        push    bc
b843 010bbc    ld      bc,0bc0bh
b846 c5        push    bc
b847 013b88    ld      bc,883bh
b84a c5        push    bc
b84b 018784    ld      bc,8487h
b84e c5        push    bc
b84f c39883    jp      8398h
b852 cd1580    call    8015h
b855 dde5      push    ix
b857 dd210000  ld      ix,0000h
b85b dd39      add     ix,sp
b85d ddf9      ld      sp,ix
b85f dde1      pop     ix
b861 c9        ret     

b862 cd1580    call    8015h
b865 dde5      push    ix
b867 dd210000  ld      ix,0000h
b86b dd39      add     ix,sp
b86d e5        push    hl
b86e 210400    ld      hl,0004h
b871 e5        push    hl
b872 dd6e04    ld      l,(ix+04h)
b875 dd6605    ld      h,(ix+05h)
b878 d1        pop     de
b879 19        add     hl,de
b87a dd7504    ld      (ix+04h),l
b87d dd7405    ld      (ix+05h),h
b880 dd6e04    ld      l,(ix+04h)
b883 dd6605    ld      h,(ix+05h)
b886 23        inc     hl
b887 dd7504    ld      (ix+04h),l
b88a dd7405    ld      (ix+05h),h
b88d dd6e04    ld      l,(ix+04h)
b890 dd6605    ld      h,(ix+05h)
b893 e5        push    hl
b894 3299b8    ld      (0b899h),a
b897 2ad600    ld      hl,(00d6h)
b89a 229eb8    ld      (0b89eh),hl
b89d cda0b8    call    0b8a0h
b8a0 3a7684    ld      a,(8476h)
b8a3 dd74ff    ld      (ix-01h),h
b8a6 dd75fe    ld      (ix-02h),l
b8a9 210400    ld      hl,0004h
b8ac e5        push    hl
b8ad dd6e04    ld      l,(ix+04h)
b8b0 dd6605    ld      h,(ix+05h)
b8b3 d1        pop     de
b8b4 19        add     hl,de
b8b5 dd7504    ld      (ix+04h),l
b8b8 dd7405    ld      (ix+05h),h
b8bb 32c0b8    ld      (0b8c0h),a
b8be 2ae200    ld      hl,(00e2h)
b8c1 cd3986    call    8639h
b8c4 cae7b8    jp      z,0b8e7h
b8c7 3a7684    ld      a,(8476h)
b8ca f5        push    af
b8cb 32d0b8    ld      (0b8d0h),a
b8ce 2ae200    ld      hl,(00e2h)
b8d1 7c        ld      a,h
b8d2 327684    ld      (8476h),a
b8d5 32dab8    ld      (0b8dah),a
b8d8 2ae800    ld      hl,(00e8h)
b8db 22dfb8    ld      (0b8dfh),hl
b8de cde1b8    call    0b8e1h
b8e1 e3        ex      (sp),hl
b8e2 7c        ld      a,h
b8e3 e1        pop     hl
b8e4 327684    ld      (8476h),a
b8e7 210000    ld      hl,0000h
b8ea e5        push    hl
b8eb 01dc00    ld      bc,00dch
b8ee c5        push    bc
b8ef dd6e04    ld      l,(ix+04h)
b8f2 dd6605    ld      h,(ix+05h)
b8f5 e5        push    hl
b8f6 01e200    ld      bc,00e2h
b8f9 c5        push    bc
b8fa 0100c6    ld      bc,0c600h
b8fd ed439182  ld      (8291h),bc
b901 0100d2    ld      bc,0d200h
b904 ed439482  ld      (8294h),bc
b908 010200    ld      bc,0002h
b90b c5        push    bc
b90c 0120b3    ld      bc,0b320h
b90f c5        push    bc
b910 cd3a84    call    843ah
b913 3218b9    ld      (0b918h),a
b916 22e200    ld      (00e2h),hl
b919 dd66ff    ld      h,(ix-01h)
b91c dd6efe    ld      l,(ix-02h)
b91f e5        push    hl
b920 dd6e04    ld      l,(ix+04h)
b923 dd6605    ld      h,(ix+05h)
b926 d1        pop     de
b927 19        add     hl,de
b928 dd7504    ld      (ix+04h),l
b92b dd7405    ld      (ix+05h),h
b92e dd6e04    ld      l,(ix+04h)
b931 dd6605    ld      h,(ix+05h)
b934 e5        push    hl
b935 323ab9    ld      (0b93ah),a
b938 2ad600    ld      hl,(00d6h)
b93b 223fb9    ld      (0b93fh),hl
b93e cd41b9    call    0b941h
b941 3a7684    ld      a,(8476h)
b944 dd74ff    ld      (ix-01h),h
b947 dd75fe    ld      (ix-02h),l
b94a 210400    ld      hl,0004h
b94d e5        push    hl
b94e dd6e04    ld      l,(ix+04h)
b951 dd6605    ld      h,(ix+05h)
b954 d1        pop     de
b955 19        add     hl,de
b956 dd7504    ld      (ix+04h),l
b959 dd7405    ld      (ix+05h),h
b95c 3261b9    ld      (0b961h),a
b95f 2ae000    ld      hl,(00e0h)
b962 cd3986    call    8639h
b965 ca88b9    jp      z,0b988h
b968 3a7684    ld      a,(8476h)
b96b f5        push    af
b96c 3271b9    ld      (0b971h),a
b96f 2ae200    ld      hl,(00e2h)
b972 7c        ld      a,h
b973 327684    ld      (8476h),a
b976 327bb9    ld      (0b97bh),a
b979 2ae800    ld      hl,(00e8h)
b97c 2280b9    ld      (0b980h),hl
b97f cd82b9    call    0b982h
b982 e3        ex      (sp),hl
b983 7c        ld      a,h
b984 e1        pop     hl
b985 327684    ld      (8476h),a
b988 210100    ld      hl,0001h
b98b e5        push    hl
b98c 01dc00    ld      bc,00dch
b98f c5        push    bc
b990 dd6e04    ld      l,(ix+04h)
b993 dd6605    ld      h,(ix+05h)
b996 e5        push    hl
b997 01e200    ld      bc,00e2h
b99a c5        push    bc
b99b 0100c6    ld      bc,0c600h
b99e ed439182  ld      (8291h),bc
b9a2 0100d2    ld      bc,0d200h
b9a5 ed439482  ld      (8294h),bc
b9a9 010200    ld      bc,0002h
b9ac c5        push    bc
b9ad 0120b3    ld      bc,0b320h
b9b0 c5        push    bc
b9b1 cd3a84    call    843ah
b9b4 32b9b9    ld      (0b9b9h),a
b9b7 22e000    ld      (00e0h),hl
b9ba dd66ff    ld      h,(ix-01h)
b9bd dd6efe    ld      l,(ix-02h)
b9c0 e5        push    hl
b9c1 dd6e04    ld      l,(ix+04h)
b9c4 dd6605    ld      h,(ix+05h)
b9c7 d1        pop     de
b9c8 19        add     hl,de
b9c9 dd7504    ld      (ix+04h),l
b9cc dd7405    ld      (ix+05h),h
b9cf ddf9      ld      sp,ix
b9d1 dde1      pop     ix
b9d3 d9        exx     
b9d4 c1        pop     bc
b9d5 33        inc     sp
b9d6 33        inc     sp
b9d7 c5        push    bc
b9d8 d9        exx     
b9d9 c9        ret     

b9da cd1580    call    8015h
b9dd dde5      push    ix
b9df dd210000  ld      ix,0000h
b9e3 dd39      add     ix,sp
b9e5 e5        push    hl
b9e6 32ebb9    ld      (0b9ebh),a
b9e9 2ade00    ld      hl,(00deh)
b9ec cd3986    call    8639h
b9ef ca4cba    jp      z,0ba4ch
b9f2 32f7b9    ld      (0b9f7h),a
b9f5 2ade00    ld      hl,(00deh)
b9f8 54        ld      d,h
b9f9 1ee2      ld      e,0e2h
b9fb ed5300ba  ld      (0ba00h),de
b9ff 2a0000    ld      hl,(0000h)
ba02 cd3986    call    8639h
ba05 ca23ba    jp      z,0ba23h
ba08 dd6e04    ld      l,(ix+04h)
ba0b dd6605    ld      h,(ix+05h)
ba0e e5        push    hl
ba0f 3214ba    ld      (0ba14h),a
ba12 2ade00    ld      hl,(00deh)
ba15 54        ld      d,h
ba16 1ee2      ld      e,0e2h
ba18 ed531dba  ld      (0ba1dh),de
ba1c 2a0000    ld      hl,(0000h)
ba1f d1        pop     de
ba20 cd0086    call    8600h
ba23 cd3986    call    8639h
ba26 ca2cba    jp      z,0ba2ch
ba29 c3cbba    jp      0bacbh
ba2c 3a7684    ld      a,(8476h)
ba2f f5        push    af
ba30 3235ba    ld      (0ba35h),a
ba33 2ade00    ld      hl,(00deh)
ba36 7c        ld      a,h
ba37 327684    ld      (8476h),a
ba3a 323fba    ld      (0ba3fh),a
ba3d 2ae800    ld      hl,(00e8h)
ba40 2244ba    ld      (0ba44h),hl
ba43 cd46ba    call    0ba46h
ba46 e3        ex      (sp),hl
ba47 7c        ld      a,h
ba48 e1        pop     hl
ba49 327684    ld      (8476h),a
ba4c 210400    ld      hl,0004h
ba4f e5        push    hl
ba50 dd6e04    ld      l,(ix+04h)
ba53 dd6605    ld      h,(ix+05h)
ba56 d1        pop     de
ba57 19        add     hl,de
ba58 dd7504    ld      (ix+04h),l
ba5b dd7405    ld      (ix+05h),h
ba5e dd6e04    ld      l,(ix+04h)
ba61 dd6605    ld      h,(ix+05h)
ba64 23        inc     hl
ba65 dd7504    ld      (ix+04h),l
ba68 dd7405    ld      (ix+05h),h
ba6b dd6e04    ld      l,(ix+04h)
ba6e dd6605    ld      h,(ix+05h)
ba71 e5        push    hl
ba72 3277ba    ld      (0ba77h),a
ba75 2ad600    ld      hl,(00d6h)
ba78 227cba    ld      (0ba7ch),hl
ba7b cd7eba    call    0ba7eh
ba7e 3a7684    ld      a,(8476h)
ba81 dd74ff    ld      (ix-01h),h
ba84 dd75fe    ld      (ix-02h),l
ba87 210400    ld      hl,0004h
ba8a e5        push    hl
ba8b dd6e04    ld      l,(ix+04h)
ba8e dd6605    ld      h,(ix+05h)
ba91 d1        pop     de
ba92 19        add     hl,de
ba93 dd7504    ld      (ix+04h),l
ba96 dd7405    ld      (ix+05h),h
ba99 210200    ld      hl,0002h
ba9c e5        push    hl
ba9d 01dc00    ld      bc,00dch
baa0 c5        push    bc
baa1 dd6e04    ld      l,(ix+04h)
baa4 dd6605    ld      h,(ix+05h)
baa7 e5        push    hl
baa8 01e200    ld      bc,00e2h
baab c5        push    bc
baac 0100c6    ld      bc,0c600h
baaf ed439182  ld      (8291h),bc
bab3 0100d2    ld      bc,0d200h
bab6 ed439482  ld      (8294h),bc
baba 010200    ld      bc,0002h
babd c5        push    bc
babe 0120b3    ld      bc,0b320h
bac1 c5        push    bc
bac2 cd3a84    call    843ah
bac5 32caba    ld      (0bacah),a
bac8 22de00    ld      (00deh),hl
bacb ddf9      ld      sp,ix
bacd dde1      pop     ix
bacf d9        exx     
bad0 c1        pop     bc
bad1 33        inc     sp
bad2 33        inc     sp
bad3 c5        push    bc
bad4 d9        exx     
bad5 c9        ret     

bad6 cd1580    call    8015h
bad9 dde5      push    ix
badb dd210000  ld      ix,0000h
badf dd39      add     ix,sp
bae1 32e6ba    ld      (0bae6h),a
bae4 2ae200    ld      hl,(00e2h)
bae7 cd3986    call    8639h
baea ca0dbb    jp      z,0bb0dh
baed 3a7684    ld      a,(8476h)
baf0 f5        push    af
baf1 32f6ba    ld      (0baf6h),a
baf4 2ae200    ld      hl,(00e2h)
baf7 7c        ld      a,h
baf8 327684    ld      (8476h),a
bafb 3200bb    ld      (0bb00h),a
bafe 2ae800    ld      hl,(00e8h)
bb01 2205bb    ld      (0bb05h),hl
bb04 cd07bb    call    0bb07h
bb07 e3        ex      (sp),hl
bb08 7c        ld      a,h
bb09 e1        pop     hl
bb0a 327684    ld      (8476h),a
bb0d 3212bb    ld      (0bb12h),a
bb10 2ae000    ld      hl,(00e0h)
bb13 cd3986    call    8639h
bb16 ca39bb    jp      z,0bb39h
bb19 3a7684    ld      a,(8476h)
bb1c f5        push    af
bb1d 3222bb    ld      (0bb22h),a
bb20 2ae000    ld      hl,(00e0h)
bb23 7c        ld      a,h
bb24 327684    ld      (8476h),a
bb27 322cbb    ld      (0bb2ch),a
bb2a 2ae800    ld      hl,(00e8h)
bb2d 2231bb    ld      (0bb31h),hl
bb30 cd33bb    call    0bb33h
bb33 e3        ex      (sp),hl
bb34 7c        ld      a,h
bb35 e1        pop     hl
bb36 327684    ld      (8476h),a
bb39 210000    ld      hl,0000h
bb3c 3241bb    ld      (0bb41h),a
bb3f 22e200    ld      (00e2h),hl
bb42 210000    ld      hl,0000h
bb45 324abb    ld      (0bb4ah),a
bb48 22e000    ld      (00e0h),hl
bb4b 210000    ld      hl,0000h
bb4e 5d        ld      e,l
bb4f d5        push    de
bb50 210000    ld      hl,0000h
bb53 7d        ld      a,l
bb54 d1        pop     de
bb55 c608      add     a,08h
bb57 cd9300    call    0093h
bb5a 3a7684    ld      a,(8476h)
bb5d 210000    ld      hl,0000h
bb60 5d        ld      e,l
bb61 d5        push    de
bb62 210100    ld      hl,0001h
bb65 7d        ld      a,l
bb66 d1        pop     de
bb67 c608      add     a,08h
bb69 cd9300    call    0093h
bb6c 3a7684    ld      a,(8476h)
bb6f ddf9      ld      sp,ix
bb71 dde1      pop     ix
bb73 c9        ret     

bb74 cd1580    call    8015h
bb77 dde5      push    ix
bb79 dd210000  ld      ix,0000h
bb7d dd39      add     ix,sp
bb7f 3284bb    ld      (0bb84h),a
bb82 2ae200    ld      hl,(00e2h)
bb85 cd3986    call    8639h
bb88 caabbb    jp      z,0bbabh
bb8b 3a7684    ld      a,(8476h)
bb8e f5        push    af
bb8f 3294bb    ld      (0bb94h),a
bb92 2ae200    ld      hl,(00e2h)
bb95 7c        ld      a,h
bb96 327684    ld      (8476h),a
bb99 329ebb    ld      (0bb9eh),a
bb9c 2ad800    ld      hl,(00d8h)
bb9f 22a3bb    ld      (0bba3h),hl
bba2 cda5bb    call    0bba5h
bba5 e3        ex      (sp),hl
bba6 7c        ld      a,h
bba7 e1        pop     hl
bba8 327684    ld      (8476h),a
bbab 32b0bb    ld      (0bbb0h),a
bbae 2ae000    ld      hl,(00e0h)
bbb1 cd3986    call    8639h
bbb4 cad7bb    jp      z,0bbd7h
bbb7 3a7684    ld      a,(8476h)
bbba f5        push    af
bbbb 32c0bb    ld      (0bbc0h),a
bbbe 2ae000    ld      hl,(00e0h)
bbc1 7c        ld      a,h
bbc2 327684    ld      (8476h),a
bbc5 32cabb    ld      (0bbcah),a
bbc8 2ad800    ld      hl,(00d8h)
bbcb 22cfbb    ld      (0bbcfh),hl
bbce cdd1bb    call    0bbd1h
bbd1 e3        ex      (sp),hl
bbd2 7c        ld      a,h
bbd3 e1        pop     hl
bbd4 327684    ld      (8476h),a
bbd7 32dcbb    ld      (0bbdch),a
bbda 2ade00    ld      hl,(00deh)
bbdd cd3986    call    8639h
bbe0 ca03bc    jp      z,0bc03h
bbe3 3a7684    ld      a,(8476h)
bbe6 f5        push    af
bbe7 32ecbb    ld      (0bbech),a
bbea 2ade00    ld      hl,(00deh)
bbed 7c        ld      a,h
bbee 327684    ld      (8476h),a
bbf1 32f6bb    ld      (0bbf6h),a
bbf4 2ad800    ld      hl,(00d8h)
bbf7 22fbbb    ld      (0bbfbh),hl
bbfa cdfdbb    call    0bbfdh
bbfd e3        ex      (sp),hl
bbfe 7c        ld      a,h
bbff e1        pop     hl
bc00 327684    ld      (8476h),a
bc03 ddf9      ld      sp,ix
bc05 dde1      pop     ix
bc07 c9        ret     

bc08 cd1580    call    8015h
bc0b dde5      push    ix
bc0d dd210000  ld      ix,0000h
bc11 dd39      add     ix,sp
bc13 3218bc    ld      (0bc18h),a
bc16 2ad400    ld      hl,(00d4h)
bc19 221dbc    ld      (0bc1dh),hl
bc1c cd1fbc    call    0bc1fh
bc1f 3a7684    ld      a,(8476h)
bc22 3227bc    ld      (0bc27h),a
bc25 2ade00    ld      hl,(00deh)
bc28 cd3986    call    8639h
bc2b ca4ebc    jp      z,0bc4eh
bc2e 3a7684    ld      a,(8476h)
bc31 f5        push    af
bc32 3237bc    ld      (0bc37h),a
bc35 2ade00    ld      hl,(00deh)
bc38 7c        ld      a,h
bc39 327684    ld      (8476h),a
bc3c 3241bc    ld      (0bc41h),a
bc3f 2ae800    ld      hl,(00e8h)
bc42 2246bc    ld      (0bc46h),hl
bc45 cd48bc    call    0bc48h
bc48 e3        ex      (sp),hl
bc49 7c        ld      a,h
bc4a e1        pop     hl
bc4b 327684    ld      (8476h),a
bc4e 3253bc    ld      (0bc53h),a
bc51 2ae800    ld      hl,(00e8h)
bc54 2258bc    ld      (0bc58h),hl
bc57 cd5abc    call    0bc5ah
bc5a 3a7684    ld      a,(8476h)
bc5d ddf9      ld      sp,ix
bc5f dde1      pop     ix
bc61 c9        ret     

bc62 cd1580    call    8015h
bc65 dde5      push    ix
bc67 dd210000  ld      ix,0000h
bc6b dd39      add     ix,sp
bc6d 210800    ld      hl,0008h
bc70 e5        push    hl
bc71 210100    ld      hl,0001h
bc74 e5        push    hl
bc75 dd6e04    ld      l,(ix+04h)
bc78 dd6605    ld      h,(ix+05h)
bc7b d1        pop     de
bc7c 19        add     hl,de
bc7d 2281bc    ld      (0bc81h),hl
bc80 2a0000    ld      hl,(0000h)
bc83 2600      ld      h,00h
bc85 c1        pop     bc
bc86 41        ld      b,c
bc87 cb25      sla     l
bc89 cb14      rl      h
bc8b 10fa      djnz    0bc87h
bc8d e5        push    hl
bc8e dd6e04    ld      l,(ix+04h)
bc91 dd6605    ld      h,(ix+05h)
bc94 2298bc    ld      (0bc98h),hl
bc97 2a0000    ld      hl,(0000h)
bc9a 2600      ld      h,00h
bc9c d1        pop     de
bc9d 19        add     hl,de
bc9e c3a1bc    jp      0bca1h
bca1 ddf9      ld      sp,ix
bca3 dde1      pop     ix
bca5 d9        exx     
bca6 c1        pop     bc
bca7 33        inc     sp
bca8 33        inc     sp
bca9 c5        push    bc
bcaa d9        exx     
bcab c9        ret     

bcac ae        xor     (hl)
bcad bc        cp      h
bcae dc0500    call    c,0005h
bcb1 00        nop     
bcb2 0a        ld      a,(bc)
bcb3 8e        adc     a,(hl)
bcb4 00        nop     
bcb5 00        nop     
bcb6 00        nop     
bcb7 7c        ld      a,h
bcb8 78        ld      a,b
bcb9 00        nop     
bcba 7a        ld      a,d
bcbb d20a13    jp      nc,130ah
bcbe 1f        rra     
bcbf 1f        rra     
bcc0 1f        rra     
bcc1 1f        rra     
bcc2 1f        rra     
bcc3 1f        rra     
bcc4 1f        rra     
bcc5 1f        rra     
bcc6 1f        rra     
bcc7 1d        dec     e
bcc8 1d        dec     e
bcc9 1c        inc     e
bcca 1c        inc     e
bccb 1a        ld      a,(de)
bccc 1a        ld      a,(de)
bccd 1818      jr      0bce7h
bccf 1c        inc     e
bcd0 1c        inc     e
bcd1 1f        rra     
bcd2 1f        rra     
bcd3 1c        inc     e
bcd4 1c        inc     e
bcd5 1818      jr      0bcefh
bcd7 1c        inc     e
bcd8 1c        inc     e
bcd9 1f        rra     
bcda 1f        rra     
bcdb 1c        inc     e
bcdc 1c        inc     e
bcdd 1a        ld      a,(de)
bcde 1a        ld      a,(de)
bcdf 1d        dec     e
bce0 1d        dec     e
bce1 21211d    ld      hl,1d21h
bce4 1d        dec     e
bce5 1a        ld      a,(de)
bce6 1a        ld      a,(de)
bce7 1d        dec     e
bce8 1d        dec     e
bce9 21211d    ld      hl,1d21h
bcec 1d        dec     e
bced 1818      jr      0bd07h
bcef 1c        inc     e
bcf0 1c        inc     e
bcf1 1f        rra     
bcf2 1f        rra     
bcf3 1c        inc     e
bcf4 1c        inc     e
bcf5 1818      jr      0bd0fh
bcf7 1c        inc     e
bcf8 1c        inc     e
bcf9 1f        rra     
bcfa 1f        rra     
bcfb 1c        inc     e
bcfc 1c        inc     e
bcfd 17        rla     
bcfe 17        rla     
bcff 1a        ld      a,(de)
bd00 1a        ld      a,(de)
bd01 1d        dec     e
bd02 1d        dec     e
bd03 1f        rra     
bd04 1f        rra     
bd05 17        rla     
bd06 17        rla     
bd07 1a        ld      a,(de)
bd08 1a        ld      a,(de)
bd09 1c        inc     e
bd0a 1c        inc     e
bd0b 1f        rra     
bd0c 1c        inc     e
bd0d 1818      jr      0bd27h
bd0f 1c        inc     e
bd10 1c        inc     e
bd11 1f        rra     
bd12 1f        rra     
bd13 1c        inc     e
bd14 1c        inc     e
bd15 1818      jr      0bd2fh
bd17 1c        inc     e
bd18 1c        inc     e
bd19 1f        rra     
bd1a 1f        rra     
bd1b 1c        inc     e
bd1c 1c        inc     e
bd1d 1a        ld      a,(de)
bd1e 1a        ld      a,(de)
bd1f 1d        dec     e
bd20 1d        dec     e
bd21 21211d    ld      hl,1d21h
bd24 1d        dec     e
bd25 1a        ld      a,(de)
bd26 1a        ld      a,(de)
bd27 1d        dec     e
bd28 1d        dec     e
bd29 212123    ld      hl,2321h
bd2c 23        inc     hl
bd2d 3032      jr      nc,0bd61h
bd2f 323232    ld      (3232h),a
bd32 323232    ld      (3232h),a
bd35 34        inc     (hl)
bd36 34        inc     (hl)
bd37 323230    ld      (3032h),a
bd3a 302d      jr      nc,0bd69h
bd3c 2d        dec     l
bd3d 68        ld      l,b
bd3e 7b        ld      a,e
bd3f ff        rst     38h
bd40 ff        rst     38h
bd41 ff        rst     38h
bd42 ff        rst     38h
bd43 ff        rst     38h
bd44 ff        rst     38h
bd45 8e        adc     a,(hl)
bd46 00        nop     
bd47 00        nop     
bd48 00        nop     
bd49 7c        ld      a,h
bd4a 78        ld      a,b
bd4b 00        nop     
bd4c 7a        ld      a,d
bd4d d20a07    jp      nc,070ah
bd50 13        inc     de
bd51 13        inc     de
bd52 13        inc     de
bd53 13        inc     de
bd54 13        inc     de
bd55 13        inc     de
bd56 13        inc     de
bd57 13        inc     de
bd58 13        inc     de
bd59 15        dec     d
bd5a 15        dec     d
bd5b 17        rla     
bd5c 17        rla     
bd5d 1818      jr      0bd77h
bd5f 0c        inc     c
bd60 0c        inc     c
bd61 24        inc     h
bd62 0c        inc     c
bd63 0c        inc     c
bd64 24        inc     h
bd65 0c        inc     c
bd66 0c        inc     c
bd67 24        inc     h
bd68 0c        inc     c
bd69 100c      djnz    0bd77h
bd6b 24        inc     h
bd6c 13        inc     de
bd6d 2610      ld      h,10h
bd6f 0e0e      ld      c,0eh
bd71 260e      ld      h,0eh
bd73 0e26      ld      c,26h
bd75 0c        inc     c
bd76 0c        inc     c
bd77 260e      ld      h,0eh
bd79 110c26    ld      de,260ch
bd7c 15        dec     d
bd7d 24        inc     h
bd7e 110c0c    ld      de,0c0ch
bd81 24        inc     h
bd82 0c        inc     c
bd83 0c        inc     c
bd84 24        inc     h
bd85 0c        inc     c
bd86 0c        inc     c
bd87 24        inc     h
bd88 0c        inc     c
bd89 100c      djnz    0bd97h
bd8b 24        inc     h
bd8c 13        inc     de
bd8d 2810      jr      z,0bd9fh
bd8f 0b        dec     bc
bd90 0b        dec     bc
bd91 23        inc     hl
bd92 0b        dec     bc
bd93 0b        dec     bc
bd94 23        inc     hl
bd95 0b        dec     bc
bd96 0b        dec     bc
bd97 29        add     hl,hl
bd98 23        inc     hl
bd99 0e0c      ld      c,0ch
bd9b 29        add     hl,hl
bd9c 1028      djnz    0bdc6h
bd9e 100c      djnz    0bdach
bda0 0c        inc     c
bda1 24        inc     h
bda2 100c      djnz    0bdb0h
bda4 24        inc     h
bda5 1010      djnz    0bdb7h
bda7 24        inc     h
bda8 0c        inc     c
bda9 100c      djnz    0bdb7h
bdab 24        inc     h
bdac 13        inc     de
bdad 2610      ld      h,10h
bdaf 0e0e      ld      c,0eh
bdb1 2611      ld      h,11h
bdb3 0e26      ld      c,26h
bdb5 111126    ld      de,2611h
bdb8 0e11      ld      c,11h
bdba 0c        inc     c
bdbb 2615      ld      h,15h
bdbd 2b        dec     hl
bdbe 17        rla     
bdbf 63        ld      h,e
bdc0 1f        rra     
bdc1 1f        rra     
bdc2 1f        rra     
bdc3 1f        rra     
bdc4 1f        rra     
bdc5 1f        rra     
bdc6 1f        rra     
bdc7 1f        rra     
bdc8 1f        rra     
bdc9 212123    ld      hl,2321h
bdcc 23        inc     hl
bdcd 24        inc     h
bdce 24        inc     h
bdcf 68        ld      l,b
bdd0 7b        ld      a,e
bdd1 ff        rst     38h
bdd2 ff        rst     38h
bdd3 ff        rst     38h
bdd4 ff        rst     38h
bdd5 ff        rst     38h
bdd6 ff        rst     38h
bdd7 04        inc     b
bdd8 00        nop     
bdd9 00        nop     
bdda 00        nop     
bddb 7c        ld      a,h
bddc ff        rst     38h
bddd ff        rst     38h
bdde ff        rst     38h
bddf 04        inc     b
bde0 00        nop     
bde1 00        nop     
bde2 00        nop     
bde3 7c        ld      a,h
bde4 ff        rst     38h
bde5 ff        rst     38h
bde6 ff        rst     38h
bde7 04        inc     b
bde8 00        nop     
bde9 00        nop     
bdea 00        nop     
bdeb 7c        ld      a,h
bdec ff        rst     38h
bded ff        rst     38h
bdee ff        rst     38h
bdef 04        inc     b
bdf0 00        nop     
bdf1 00        nop     
bdf2 00        nop     
bdf3 7c        ld      a,h
bdf4 ff        rst     38h
bdf5 ff        rst     38h
bdf6 ff        rst     38h
bdf7 04        inc     b
bdf8 00        nop     
bdf9 00        nop     
bdfa 00        nop     
bdfb 7c        ld      a,h
bdfc ff        rst     38h
bdfd ff        rst     38h
bdfe ff        rst     38h
bdff 04        inc     b
be00 00        nop     
be01 00        nop     
be02 00        nop     
be03 7c        ld      a,h
be04 ff        rst     38h
be05 ff        rst     38h
be06 ff        rst     38h
be07 04        inc     b
be08 00        nop     
be09 00        nop     
be0a 00        nop     
be0b 7c        ld      a,h
be0c ff        rst     38h
be0d ff        rst     38h
be0e ff        rst     38h
be0f 04        inc     b
be10 00        nop     
be11 00        nop     
be12 00        nop     
be13 7c        ld      a,h
be14 ff        rst     38h
be15 ff        rst     38h
be16 ff        rst     38h
be17 19        add     hl,de
be18 be        cp      (hl)
be19 dc0500    call    c,0005h
be1c 00        nop     
be1d 0a        ld      a,(bc)
be1e 1c        inc     e
be1f 00        nop     
be20 00        nop     
be21 00        nop     
be22 7c        ld      a,h
be23 64        ld      h,h
be24 60        ld      h,b
be25 7a        ld      a,d
be26 b4        or      h
be27 02        ld      (bc),a
be28 47        ld      b,a
be29 46        ld      b,(hl)
be2a 63        ld      h,e
be2b 47        ld      b,a
be2c 46        ld      b,(hl)
be2d 47        ld      b,a
be2e 46        ld      b,(hl)
be2f 47        ld      b,a
be30 46        ld      b,(hl)
be31 47        ld      b,a
be32 46        ld      b,(hl)
be33 47        ld      b,a
be34 46        ld      b,(hl)
be35 47        ld      b,a
be36 46        ld      b,(hl)
be37 47        ld      b,a
be38 46        ld      b,(hl)
be39 47        ld      b,a
be3a 46        ld      b,(hl)
be3b ff        rst     38h
be3c ff        rst     38h
be3d ff        rst     38h
be3e 04        inc     b
be3f 00        nop     
be40 00        nop     
be41 00        nop     
be42 7c        ld      a,h
be43 ff        rst     38h
be44 ff        rst     38h
be45 ff        rst     38h
be46 04        inc     b
be47 00        nop     
be48 00        nop     
be49 00        nop     
be4a 7c        ld      a,h
be4b ff        rst     38h
be4c ff        rst     38h
be4d ff        rst     38h
be4e 04        inc     b
be4f 00        nop     
be50 00        nop     
be51 00        nop     
be52 7c        ld      a,h
be53 ff        rst     38h
be54 ff        rst     38h
be55 ff        rst     38h
be56 04        inc     b
be57 00        nop     
be58 00        nop     
be59 00        nop     
be5a 7c        ld      a,h
be5b ff        rst     38h
be5c ff        rst     38h
be5d ff        rst     38h
be5e 04        inc     b
be5f 00        nop     
be60 00        nop     
be61 00        nop     
be62 7c        ld      a,h
be63 ff        rst     38h
be64 ff        rst     38h
be65 ff        rst     38h
be66 04        inc     b
be67 00        nop     
be68 00        nop     
be69 00        nop     
be6a 7c        ld      a,h
be6b ff        rst     38h
be6c ff        rst     38h
be6d ff        rst     38h
be6e 04        inc     b
be6f 00        nop     
be70 00        nop     
be71 00        nop     
be72 7c        ld      a,h
be73 ff        rst     38h
be74 ff        rst     38h
be75 ff        rst     38h
be76 04        inc     b
be77 00        nop     
be78 00        nop     
be79 00        nop     
be7a 7c        ld      a,h
be7b ff        rst     38h
be7c ff        rst     38h
be7d ff        rst     38h
be7e 04        inc     b
be7f 00        nop     
be80 00        nop     
be81 00        nop     
be82 7c        ld      a,h
be83 ff        rst     38h
be84 ff        rst     38h
be85 ff        rst     38h
be86 88        adc     a,b
be87 be        cp      (hl)
be88 dc0500    call    c,0005h
be8b 00        nop     
be8c 0a        ld      a,(bc)
be8d 37        scf     
be8e 00        nop     
be8f 00        nop     
be90 00        nop     
be91 7c        ld      a,h
be92 7a        ld      a,d
be93 b4        or      h
be94 02        ld      (bc),a
be95 64        ld      h,h
be96 60        ld      h,b
be97 3024      jr      nc,0bebdh
be99 180c      jr      0bea7h
be9b 64        ld      h,h
be9c 58        ld      e,b
be9d 3024      jr      nc,0bec3h
be9f 180c      jr      0beadh
bea1 64        ld      h,h
bea2 48        ld      c,b
bea3 39        add     hl,sp
bea4 35        dec     (hl)
bea5 34        inc     (hl)
bea6 323063    ld      (6330h),a
bea9 64        ld      h,h
beaa 40        ld      b,b
beab 37        scf     
beac 35        dec     (hl)
bead 34        inc     (hl)
beae 323063    ld      (6330h),a
beb1 64        ld      h,h
beb2 3835      jr      c,0bee9h
beb4 34        inc     (hl)
beb5 323063    ld      (6330h),a
beb8 64        ld      h,h
beb9 3034      jr      nc,0beefh
bebb 323063    ld      (6330h),a
bebe 64        ld      h,h
bebf 2030      jr      nz,0bef1h
bec1 2e2d      ld      l,2dh
bec3 2115ff    ld      hl,0ff15h
bec6 ff        rst     38h
bec7 ff        rst     38h
bec8 04        inc     b
bec9 00        nop     
beca 00        nop     
becb 00        nop     
becc 7c        ld      a,h
becd ff        rst     38h
bece ff        rst     38h
becf ff        rst     38h
bed0 04        inc     b
bed1 00        nop     
bed2 00        nop     
bed3 00        nop     
bed4 7c        ld      a,h
bed5 ff        rst     38h
bed6 ff        rst     38h
bed7 ff        rst     38h
bed8 04        inc     b
bed9 00        nop     
beda 00        nop     
bedb 00        nop     
bedc 7c        ld      a,h
bedd ff        rst     38h
bede ff        rst     38h
bedf ff        rst     38h
bee0 04        inc     b
bee1 00        nop     
bee2 00        nop     
bee3 00        nop     
bee4 7c        ld      a,h
bee5 ff        rst     38h
bee6 ff        rst     38h
bee7 ff        rst     38h
bee8 04        inc     b
bee9 00        nop     
beea 00        nop     
beeb 00        nop     
beec 7c        ld      a,h
beed ff        rst     38h
beee ff        rst     38h
beef ff        rst     38h
bef0 04        inc     b
bef1 00        nop     
bef2 00        nop     
bef3 00        nop     
bef4 7c        ld      a,h
bef5 ff        rst     38h
bef6 ff        rst     38h
bef7 ff        rst     38h
bef8 04        inc     b
bef9 00        nop     
befa 00        nop     
befb 00        nop     
befc 7c        ld      a,h
befd ff        rst     38h
befe ff        rst     38h
beff ff        rst     38h
bf00 04        inc     b
bf01 00        nop     
bf02 00        nop     
bf03 00        nop     
bf04 7c        ld      a,h
bf05 ff        rst     38h
bf06 ff        rst     38h
bf07 ff        rst     38h
bf08 04        inc     b
bf09 00        nop     
bf0a 00        nop     
bf0b 00        nop     
bf0c 7c        ld      a,h
bf0d ff        rst     38h
bf0e ff        rst     38h
bf0f ff        rst     38h
bf10 12        ld      (de),a
bf11 bf        cp      a
bf12 dc0500    call    c,0005h
bf15 00        nop     
bf16 0a        ld      a,(bc)
bf17 15        dec     d
bf18 00        nop     
bf19 00        nop     
bf1a 00        nop     
bf1b 7c        ld      a,h
bf1c 7a        ld      a,d
bf1d b4        or      h
bf1e 02        ld      (bc),a
bf1f 2d        dec     l
bf20 29        add     hl,hl
bf21 64        ld      h,h
bf22 48        ld      c,b
bf23 2e2a      ld      l,2ah
bf25 64        ld      h,h
bf26 40        ld      b,b
bf27 2f        cpl     
bf28 2b        dec     hl
bf29 64        ld      h,h
bf2a 3830      jr      c,0bf5ch
bf2c 2c        inc     l
bf2d ff        rst     38h
bf2e ff        rst     38h
bf2f ff        rst     38h
bf30 04        inc     b
bf31 00        nop     
bf32 00        nop     
bf33 00        nop     
bf34 7c        ld      a,h
bf35 ff        rst     38h
bf36 ff        rst     38h
bf37 ff        rst     38h
bf38 04        inc     b
bf39 00        nop     
bf3a 00        nop     
bf3b 00        nop     
bf3c 7c        ld      a,h
bf3d ff        rst     38h
bf3e ff        rst     38h
bf3f ff        rst     38h
bf40 04        inc     b
bf41 00        nop     
bf42 00        nop     
bf43 00        nop     
bf44 7c        ld      a,h
bf45 ff        rst     38h
bf46 ff        rst     38h
bf47 ff        rst     38h
bf48 04        inc     b
bf49 00        nop     
bf4a 00        nop     
bf4b 00        nop     
bf4c 7c        ld      a,h
bf4d ff        rst     38h
bf4e ff        rst     38h
bf4f ff        rst     38h
bf50 04        inc     b
bf51 00        nop     
bf52 00        nop     
bf53 00        nop     
bf54 7c        ld      a,h
bf55 ff        rst     38h
bf56 ff        rst     38h
bf57 ff        rst     38h
bf58 04        inc     b
bf59 00        nop     
bf5a 00        nop     
bf5b 00        nop     
bf5c 7c        ld      a,h
bf5d ff        rst     38h
bf5e ff        rst     38h
bf5f ff        rst     38h
bf60 04        inc     b
bf61 00        nop     
bf62 00        nop     
bf63 00        nop     
bf64 7c        ld      a,h
bf65 ff        rst     38h
bf66 ff        rst     38h
bf67 ff        rst     38h
bf68 04        inc     b
bf69 00        nop     
bf6a 00        nop     
bf6b 00        nop     
bf6c 7c        ld      a,h
bf6d ff        rst     38h
bf6e ff        rst     38h
bf6f ff        rst     38h
bf70 04        inc     b
bf71 00        nop     
bf72 00        nop     
bf73 00        nop     
bf74 7c        ld      a,h
bf75 ff        rst     38h
bf76 ff        rst     38h
bf77 ff        rst     38h
bf78 7a        ld      a,d
bf79 bf        cp      a
bf7a dc0500    call    c,0005h
bf7d 00        nop     
bf7e 0a        ld      a,(bc)
bf7f 0c        inc     c
bf80 00        nop     
bf81 00        nop     
bf82 00        nop     
bf83 7c        ld      a,h
bf84 7a        ld      a,d
bf85 b4        or      h
bf86 02        ld      (bc),a
bf87 64        ld      h,h
bf88 40        ld      b,b
bf89 24        inc     h
bf8a 2829      jr      z,0bfb5h
bf8c ff        rst     38h
bf8d ff        rst     38h
bf8e ff        rst     38h
bf8f 04        inc     b
bf90 00        nop     
bf91 00        nop     
bf92 00        nop     
bf93 7c        ld      a,h
bf94 ff        rst     38h
bf95 ff        rst     38h
bf96 ff        rst     38h
bf97 04        inc     b
bf98 00        nop     
bf99 00        nop     
bf9a 00        nop     
bf9b 7c        ld      a,h
bf9c ff        rst     38h
bf9d ff        rst     38h
bf9e ff        rst     38h
bf9f 04        inc     b
bfa0 00        nop     
bfa1 00        nop     
bfa2 00        nop     
bfa3 7c        ld      a,h
bfa4 ff        rst     38h
bfa5 ff        rst     38h
bfa6 ff        rst     38h
bfa7 04        inc     b
bfa8 00        nop     
bfa9 00        nop     
bfaa 00        nop     
bfab 7c        ld      a,h
bfac ff        rst     38h
bfad ff        rst     38h
bfae ff        rst     38h
bfaf 04        inc     b
bfb0 00        nop     
bfb1 00        nop     
bfb2 00        nop     
bfb3 7c        ld      a,h
bfb4 ff        rst     38h
bfb5 ff        rst     38h
bfb6 ff        rst     38h
bfb7 04        inc     b
bfb8 00        nop     
bfb9 00        nop     
bfba 00        nop     
bfbb 7c        ld      a,h
bfbc ff        rst     38h
bfbd ff        rst     38h
bfbe ff        rst     38h
bfbf 04        inc     b
bfc0 00        nop     
bfc1 00        nop     
bfc2 00        nop     
bfc3 7c        ld      a,h
bfc4 ff        rst     38h
bfc5 ff        rst     38h
bfc6 ff        rst     38h
bfc7 04        inc     b
bfc8 00        nop     
bfc9 00        nop     
bfca 00        nop     
bfcb 7c        ld      a,h
bfcc ff        rst     38h
bfcd ff        rst     38h
bfce ff        rst     38h
bfcf 04        inc     b
bfd0 00        nop     
bfd1 00        nop     
bfd2 00        nop     
bfd3 7c        ld      a,h
bfd4 ff        rst     38h
bfd5 ff        rst     38h
bfd6 ff        rst     38h
bfd7 d9        exx     
bfd8 bf        cp      a
bfd9 00        nop     
bfda 00        nop     
bfdb 00        nop     
bfdc 00        nop     
bfdd 00        nop     
bfde 00        nop     
bfdf 00        nop     
bfe0 00        nop     
bfe1 e3        ex      (sp),hl
bfe2 bf        cp      a
bfe3 00        nop     
bfe4 00        nop     
bfe5 00        nop     
bfe6 00        nop     
bfe7 00        nop     
bfe8 00        nop     
bfe9 00        nop     
bfea 00        nop     
bfeb edbf      db      0edh, 0bfh       ; Undocumented 8 T-State NOP
bfed 09        add     hl,bc
bfee 00        nop     
bfef 07        rlca    
bff0 00        nop     
bff1 03        inc     bc
bff2 00        nop     
bff3 0b        dec     bc
bff4 00        nop     
bff5 f7        rst     30h
bff6 bf        cp      a
bff7 03        inc     bc
bff8 00        nop     
bff9 00        nop     
bffa 00        nop     
bffb 010002    ld      bc,0200h
bffe 00        nop     
bfff 01c000    ld      bc,00c0h
c002 00        nop     
c003 010000    ld      bc,0000h
c006 00        nop     
c007 00        nop     
c008 00        nop     
c009 0b        dec     bc
c00a c0        ret     nz

c00b 00        nop     
c00c 00        nop     
c00d 00        nop     
c00e 00        nop     
c00f 00        nop     
c010 00        nop     
c011 00        nop     
c012 00        nop     
c013 00        nop     
c014 00        nop     
c015 00        nop     
c016 00        nop     
c017 00        nop     
c018 00        nop     
c019 00        nop     
c01a 00        nop     
c01b 00        nop     
c01c 00        nop     
c01d 00        nop     
c01e 00        nop     
c01f 00        nop     
c020 00        nop     
c021 00        nop     
c022 00        nop     
c023 00        nop     
c024 00        nop     
c025 00        nop     
c026 00        nop     
c027 00        nop     
c028 00        nop     
c029 00        nop     
c02a 00        nop     
c02b 00        nop     
c02c 00        nop     
c02d 00        nop     
c02e 00        nop     
c02f 00        nop     
c030 00        nop     
c031 00        nop     
c032 00        nop     
c033 00        nop     
c034 00        nop     
c035 110038    ld      de,3800h
c038 2142c0    ld      hl,0c042h
c03b 010008    ld      bc,0800h
c03e cd5c00    call    005ch
c041 c9        ret     

c042 0c        inc     c
c043 0e0f      ld      c,0fh
c045 4f        ld      c,a
c046 3d        dec     a
c047 1d        dec     e
c048 7f        ld      a,a
c049 1b        dec     de
c04a 0c        inc     c
c04b 3f        ccf     
c04c 7f        ld      a,a
c04d 7f        ld      a,a
c04e 6f        ld      l,a
c04f 0f        rrca    
c050 060c      ld      b,0ch
c052 1838      jr      0c08ch
c054 f8        ret     m

c055 f9        ld      sp,hl
c056 dedc      sbc     a,0dch
c058 7f        ld      a,a
c059 6c        ld      l,h
c05a 98        sbc     a,b
c05b fcfefe    call    m,0fefeh
c05e f6f0      or      0f0h
c060 60        ld      h,b
c061 70        ld      (hl),b
c062 0c        inc     c
c063 0e0f      ld      c,0fh
c065 4f        ld      c,a
c066 3d        dec     a
c067 1d        dec     e
c068 7f        ld      a,a
c069 1b        dec     de
c06a 0c        inc     c
c06b 3f        ccf     
c06c 7f        ld      a,a
c06d 7f        ld      a,a
c06e ef        rst     28h
c06f ef        rst     28h
c070 0606      ld      b,06h
c072 1838      jr      0c0ach
c074 f8        ret     m

c075 f9        ld      sp,hl
c076 dedc      sbc     a,0dch
c078 7f        ld      a,a
c079 6c        ld      l,h
c07a 98        sbc     a,b
c07b fcfefe    call    m,0fefeh
c07e d478f0    call    nc,0f078h
c081 00        nop     
c082 181c      jr      0c0a0h
c084 1f        rra     
c085 9f        sbc     a,a
c086 7b        ld      a,e
c087 3b        dec     sp
c088 fe36      cp      36h
c08a 19        add     hl,de
c08b 3f        ccf     
c08c 7f        ld      a,a
c08d 7f        ld      a,a
c08e 2b        dec     hl
c08f 1e0f      ld      e,0fh
c091 00        nop     
c092 3070      jr      nc,0c104h
c094 f0        ret     p

c095 f2bcb8    jp      p,0b8bch
c098 fed8      cp      0d8h
c09a 30fc      jr      nc,0c098h
c09c fefe      cp      0feh
c09e f7        rst     30h
c09f f7        rst     30h
c0a0 60        ld      h,b
c0a1 60        ld      h,b
c0a2 2c        inc     l
c0a3 8e        adc     a,(hl)
c0a4 0f        rrca    
c0a5 4b        ld      c,e
c0a6 3d        dec     a
c0a7 117f1d    ld      de,1d7fh
c0aa caff7f    jp      z,7fffh
c0ad 3f        ccf     
c0ae 15        dec     d
c0af 1f        rra     
c0b0 0e00      ld      c,00h
c0b2 1c        inc     e
c0b3 39        add     hl,sp
c0b4 f8        ret     m

c0b5 e9        jp      (hl)
c0b6 dec4      sbc     a,0c4h
c0b8 7f        ld      a,a
c0b9 5c        ld      e,h
c0ba ab        xor     e
c0bb ff        rst     38h
c0bc ff        rst     38h
c0bd feac      cp      0ach
c0bf f8        ret     m

c0c0 70        ld      (hl),b
c0c1 00        nop     
c0c2 010101    ld      bc,0101h
c0c5 02        ld      (bc),a
c0c6 03        inc     bc
c0c7 92        sub     d
c0c8 96        sub     (hl)
c0c9 f6f6      or      0f6h
c0cb fefe      cp      0feh
c0cd feff      cp      0ffh
c0cf af        xor     a
c0d0 2600      ld      h,00h
c0d2 80        add     a,b
c0d3 80        add     a,b
c0d4 80        add     a,b
c0d5 40        ld      b,b
c0d6 c0        ret     nz

c0d7 49        ld      c,c
c0d8 69        ld      l,c
c0d9 6f        ld      l,a
c0da 6f        ld      l,a
c0db 7f        ld      a,a
c0dc 7f        ld      a,a
c0dd 7f        ld      a,a
c0de ff        rst     38h
c0df f5        push    af
c0e0 64        ld      h,h
c0e1 00        nop     
c0e2 08        ex      af,af'
c0e3 1030      djnz    0c115h
c0e5 3018      jr      nc,0c0ffh
c0e7 0f        rrca    
c0e8 3f        ccf     
c0e9 37        scf     
c0ea 7b        ld      a,e
c0eb 7d        ld      a,l
c0ec 3f        ccf     
c0ed 1f        rra     
c0ee 37        scf     
c0ef 60        ld      h,b
c0f0 70        ld      (hl),b
c0f1 0c        inc     c
c0f2 08        ex      af,af'
c0f3 04        inc     b
c0f4 0606      ld      b,06h
c0f6 0c        inc     c
c0f7 f8        ret     m

c0f8 fef6      cp      0f6h
c0fa ef        rst     28h
c0fb df        rst     18h
c0fc fefc      cp      0fch
c0fe f603      or      03h
c100 07        rlca    
c101 1800      jr      0c103h
c103 010101    ld      bc,0101h
c106 010101    ld      bc,0101h
c109 010101    ld      bc,0101h
c10c 010101    ld      bc,0101h
c10f 010000    ld      bc,0000h
c112 80        add     a,b
c113 c0        ret     nz

c114 c0        ret     nz

c115 c0        ret     nz

c116 c0        ret     nz

c117 c0        ret     nz

c118 c0        ret     nz

c119 c0        ret     nz

c11a c0        ret     nz

c11b c0        ret     nz

c11c c0        ret     nz

c11d c0        ret     nz

c11e c0        ret     nz

c11f c0        ret     nz

c120 80        add     a,b
c121 00        nop     
c122 00        nop     
c123 00        nop     
c124 00        nop     
c125 00        nop     
c126 03        inc     bc
c127 0f        rrca    
c128 0f        rrca    
c129 1f        rra     
c12a 1f        rra     
c12b 1f        rra     
c12c 1f        rra     
c12d 0f        rrca    
c12e 0f        rrca    
c12f 03        inc     bc
c130 00        nop     
c131 00        nop     
c132 00        nop     
c133 00        nop     
c134 00        nop     
c135 00        nop     
c136 c0        ret     nz

c137 f0        ret     p

c138 f0        ret     p

c139 f8        ret     m

c13a f8        ret     m

c13b f8        ret     m

c13c f8        ret     m

c13d f0        ret     p

c13e f0        ret     p

c13f c0        ret     nz

c140 00        nop     
c141 00        nop     
c142 00        nop     
c143 00        nop     
c144 1e1f      ld      e,1fh
c146 0f        rrca    
c147 7f        ld      a,a
c148 7f        ld      a,a
c149 3f        ccf     
c14a 3f        ccf     
c14b 7f        ld      a,a
c14c 7f        ld      a,a
c14d 1f        rra     
c14e 1f        rra     
c14f 3f        ccf     
c150 39        add     hl,sp
c151 00        nop     
c152 00        nop     
c153 00        nop     
c154 08        ex      af,af'
c155 be        cp      (hl)
c156 fefc      cp      0fch
c158 f8        ret     m

c159 f8        ret     m

c15a feff      cp      0ffh
c15c ff        rst     38h
c15d fefc      cp      0fch
c15f fcb800    call    m,00b8h
c162 00        nop     
c163 00        nop     
c164 00        nop     
c165 00        nop     
c166 00        nop     
c167 00        nop     
c168 00        nop     
c169 00        nop     
c16a 00        nop     
c16b 00        nop     
c16c 00        nop     
c16d 00        nop     
c16e 00        nop     
c16f 00        nop     
c170 00        nop     
c171 00        nop     
c172 00        nop     
c173 00        nop     
c174 00        nop     
c175 00        nop     
c176 00        nop     
c177 00        nop     
c178 00        nop     
c179 00        nop     
c17a 00        nop     
c17b 00        nop     
c17c 00        nop     
c17d 00        nop     
c17e 00        nop     
c17f 00        nop     
c180 00        nop     
c181 00        nop     
c182 00        nop     
c183 00        nop     
c184 00        nop     
c185 00        nop     
c186 00        nop     
c187 00        nop     
c188 00        nop     
c189 00        nop     
c18a 00        nop     
c18b 00        nop     
c18c 00        nop     
c18d 00        nop     
c18e 00        nop     
c18f 00        nop     
c190 00        nop     
c191 00        nop     
c192 00        nop     
c193 00        nop     
c194 00        nop     
c195 00        nop     
c196 00        nop     
c197 00        nop     
c198 00        nop     
c199 00        nop     
c19a 00        nop     
c19b 00        nop     
c19c 00        nop     
c19d 00        nop     
c19e 00        nop     
c19f 00        nop     
c1a0 00        nop     
c1a1 00        nop     
c1a2 00        nop     
c1a3 00        nop     
c1a4 00        nop     
c1a5 00        nop     
c1a6 00        nop     
c1a7 00        nop     
c1a8 00        nop     
c1a9 00        nop     
c1aa 00        nop     
c1ab 00        nop     
c1ac 00        nop     
c1ad 00        nop     
c1ae 00        nop     
c1af 00        nop     
c1b0 00        nop     
c1b1 00        nop     
c1b2 00        nop     
c1b3 00        nop     
c1b4 00        nop     
c1b5 00        nop     
c1b6 00        nop     
c1b7 00        nop     
c1b8 00        nop     
c1b9 00        nop     
c1ba 00        nop     
c1bb 00        nop     
c1bc 00        nop     
c1bd 00        nop     
c1be 00        nop     
c1bf 00        nop     
c1c0 00        nop     
c1c1 00        nop     
c1c2 00        nop     
c1c3 00        nop     
c1c4 00        nop     
c1c5 00        nop     
c1c6 00        nop     
c1c7 00        nop     
c1c8 00        nop     
c1c9 00        nop     
c1ca 00        nop     
c1cb 00        nop     
c1cc 00        nop     
c1cd 00        nop     
c1ce 00        nop     
c1cf 00        nop     
c1d0 00        nop     
c1d1 00        nop     
c1d2 00        nop     
c1d3 00        nop     
c1d4 00        nop     
c1d5 00        nop     
c1d6 00        nop     
c1d7 00        nop     
c1d8 00        nop     
c1d9 00        nop     
c1da 00        nop     
c1db 00        nop     
c1dc 00        nop     
c1dd 00        nop     
c1de 00        nop     
c1df 00        nop     
c1e0 00        nop     
c1e1 00        nop     
c1e2 00        nop     
c1e3 00        nop     
c1e4 00        nop     
c1e5 00        nop     
c1e6 00        nop     
c1e7 00        nop     
c1e8 00        nop     
c1e9 00        nop     
c1ea 00        nop     
c1eb 00        nop     
c1ec 00        nop     
c1ed 00        nop     
c1ee 00        nop     
c1ef 00        nop     
c1f0 00        nop     
c1f1 00        nop     
c1f2 00        nop     
c1f3 00        nop     
c1f4 00        nop     
c1f5 00        nop     
c1f6 00        nop     
c1f7 00        nop     
c1f8 00        nop     
c1f9 00        nop     
c1fa 00        nop     
c1fb 00        nop     
c1fc 00        nop     
c1fd 00        nop     
c1fe 00        nop     
c1ff 00        nop     
c200 00        nop     
c201 00        nop     
c202 00        nop     
c203 00        nop     
c204 00        nop     
c205 00        nop     
c206 00        nop     
c207 00        nop     
c208 00        nop     
c209 00        nop     
c20a 00        nop     
c20b 00        nop     
c20c 00        nop     
c20d 00        nop     
c20e 00        nop     
c20f 00        nop     
c210 00        nop     
c211 00        nop     
c212 00        nop     
c213 00        nop     
c214 00        nop     
c215 00        nop     
c216 00        nop     
c217 00        nop     
c218 00        nop     
c219 00        nop     
c21a 00        nop     
c21b 00        nop     
c21c 00        nop     
c21d 00        nop     
c21e 00        nop     
c21f 00        nop     
c220 00        nop     
c221 00        nop     
c222 00        nop     
c223 00        nop     
c224 00        nop     
c225 00        nop     
c226 00        nop     
c227 00        nop     
c228 00        nop     
c229 00        nop     
c22a 00        nop     
c22b 00        nop     
c22c 00        nop     
c22d 00        nop     
c22e 00        nop     
c22f 00        nop     
c230 00        nop     
c231 00        nop     
c232 00        nop     
c233 00        nop     
c234 00        nop     
c235 00        nop     
c236 00        nop     
c237 00        nop     
c238 00        nop     
c239 00        nop     
c23a 00        nop     
c23b 00        nop     
c23c 00        nop     
c23d 00        nop     
c23e 00        nop     
c23f 00        nop     
c240 00        nop     
c241 00        nop     
c242 00        nop     
c243 03        inc     bc
c244 47        ld      b,a
c245 2f        cpl     
c246 1d        dec     e
c247 1d        dec     e
c248 3f        ccf     
c249 5f        ld      e,a
c24a 1c        inc     e
c24b 0f        rrca    
c24c 07        rlca    
c24d 03        inc     bc
c24e 04        inc     b
c24f 04        inc     b
c250 04        inc     b
c251 00        nop     
c252 00        nop     
c253 c0        ret     nz

c254 e2f4b8    jp      po,0b8f4h
c257 b8        cp      b
c258 fcfa38    call    m,38fah
c25b f0        ret     p

c25c e0        ret     po

c25d c0        ret     nz

c25e 2020      jr      nz,0c280h
c260 2000      jr      nz,0c262h
c262 80        add     a,b
c263 40        ld      b,b
c264 2f        cpl     
c265 1f        rra     
c266 3f        ccf     
c267 3b        dec     sp
c268 3b        dec     sp
c269 3f        ccf     
c26a 3f        ccf     
c26b 3f        ccf     
c26c 3f        ccf     
c26d 301f      jr      nc,0c28eh
c26f 2f        cpl     
c270 40        ld      b,b
c271 80        add     a,b
c272 0102f4    ld      bc,0f402h
c275 f8        ret     m

c276 fcdcdc    call    m,0dcdch
c279 fcfcfc    call    m,0fcfch
c27c fc0cf8    call    m,0f80ch
c27f f40201    call    p,0102h
c282 00        nop     
c283 07        rlca    
c284 1f        rra     
c285 3b        dec     sp
c286 3b        dec     sp
c287 3f        ccf     
c288 3f        ccf     
c289 381f      jr      c,0c2aah
c28b 0f        rrca    
c28c 12        ld      (de),a
c28d e24202    jp      po,0242h
c290 04        inc     b
c291 0c        inc     c
c292 00        nop     
c293 e0        ret     po

c294 f8        ret     m

c295 dcdcfc    call    c,0fcdch
c298 fc1cf8    call    m,0f81ch
c29b f0        ret     p

c29c 48        ld      c,b
c29d 47        ld      b,a
c29e 42        ld      b,d
c29f 40        ld      b,b
c2a0 2030      jr      nz,0c2d2h
c2a2 00        nop     
c2a3 07        rlca    
c2a4 07        rlca    
c2a5 0f        rrca    
c2a6 0d        dec     c
c2a7 0d        dec     c
c2a8 0f        rrca    
c2a9 0f        rrca    
c2aa 0f        rrca    
c2ab 0c        inc     c
c2ac 1f        rra     
c2ad 3f        ccf     
c2ae 77        ld      (hl),a
c2af 67        ld      h,a
c2b0 46        ld      b,(hl)
c2b1 00        nop     
c2b2 00        nop     
c2b3 e0        ret     po

c2b4 e0        ret     po

c2b5 f0        ret     p

c2b6 b0        or      b
c2b7 b0        or      b
c2b8 f0        ret     p

c2b9 f0        ret     p

c2ba f0        ret     p

c2bb 30f8      jr      nc,0c2b5h
c2bd fceee6    call    m,0e6eeh
c2c0 62        ld      h,d
c2c1 00        nop     
c2c2 1f        rra     
c2c3 3f        ccf     
c2c4 eded      db      0edh, 0edh       ; Undocumented 8 T-State NOP
c2c6 ff        rst     38h
c2c7 c7        rst     00h
c2c8 7f        ld      a,a
c2c9 0f        rrca    
c2ca 1f        rra     
c2cb 3f        ccf     
c2cc 3e7f      ld      a,7fh
c2ce 7f        ld      a,a
c2cf 7f        ld      a,a
c2d0 3f        ccf     
c2d1 0f        rrca    
c2d2 c0        ret     nz

c2d3 e0        ret     po

c2d4 e0        ret     po

c2d5 e0        ret     po

c2d6 c0        ret     nz

c2d7 c0        ret     nz

c2d8 c0        ret     nz

c2d9 80        add     a,b
c2da 00        nop     
c2db 00        nop     
c2dc 07        rlca    
c2dd 0f        rrca    
c2de 3f        ccf     
c2df fefc      cp      0fch
c2e1 f0        ret     p

c2e2 00        nop     
c2e3 00        nop     
c2e4 07        rlca    
c2e5 0f        rrca    
c2e6 1f        rra     
c2e7 3f        ccf     
c2e8 7f        ld      a,a
c2e9 7f        ld      a,a
c2ea ff        rst     38h
c2eb ff        rst     38h
c2ec ff        rst     38h
c2ed feff      cp      0ffh
c2ef 7f        ld      a,a
c2f0 7e        ld      a,(hl)
c2f1 00        nop     
c2f2 0f        rrca    
c2f3 ff        rst     38h
c2f4 ff        rst     38h
c2f5 ff        rst     38h
c2f6 ff        rst     38h
c2f7 b7        or      a
c2f8 b7        or      a
c2f9 ff        rst     38h
c2fa fefe      cp      0feh
c2fc fc00f0    call    m,0f000h
c2ff c0        ret     nz

c300 00        nop     
c301 00        nop     
c302 0f        rrca    
c303 3f        ccf     
c304 7f        ld      a,a
c305 7b        ld      a,e
c306 fb        ei      
c307 ff        rst     38h
c308 ff        rst     38h
c309 78        ld      a,b
c30a 7f        ld      a,a
c30b 3f        ccf     
c30c 3f        ccf     
c30d 1a        ld      a,(de)
c30e 32627a    ld      (7a62h),a
c311 08        ex      af,af'
c312 f0        ret     p

c313 fcfede    call    m,0defeh
c316 df        rst     18h
c317 ff        rst     38h
c318 ff        rst     38h
c319 1efe      ld      e,0feh
c31b fcfc58    call    m,58fch
c31e 4c        ld      c,h
c31f 46        ld      b,(hl)
c320 5e        ld      e,(hl)
c321 1020      djnz    0c343h
c323 303d      jr      nc,0c362h
c325 3f        ccf     
c326 3f        ccf     
c327 1f        rra     
c328 df        rst     18h
c329 fd7d      ld      a,iyl
c32b 7f        ld      a,a
c32c 7f        ld      a,a
c32d 3f        ccf     
c32e 3c        inc     a
c32f 1f        rra     
c330 07        rlca    
c331 03        inc     bc
c332 04        inc     b
c333 0c        inc     c
c334 bc        cp      h
c335 fcfcf8    call    m,0f8fch
c338 fb        ei      
c339 bf        cp      a
c33a be        cp      (hl)
c33b fefe      cp      0feh
c33d fc3cf8    call    m,0f83ch
c340 e0        ret     po

c341 c0        ret     nz

c342 010103    ld      bc,0301h
c345 03        inc     bc
c346 07        rlca    
c347 0f        rrca    
c348 0f        rrca    
c349 1b        dec     de
c34a 3b        dec     sp
c34b 3f        ccf     
c34c 3f        ccf     
c34d 3f        ccf     
c34e 3c        inc     a
c34f 1f        rra     
c350 0f        rrca    
c351 03        inc     bc
c352 80        add     a,b
c353 80        add     a,b
c354 c0        ret     nz

c355 c0        ret     nz

c356 e0        ret     po

c357 f0        ret     p

c358 f0        ret     p

c359 d8        ret     c

c35a dcfcfc    call    c,0fcfch
c35d fc3cf8    call    m,0f83ch
c360 f0        ret     p

c361 c0        ret     nz

c362 00        nop     
c363 00        nop     
c364 00        nop     
c365 00        nop     
c366 00        nop     
c367 00        nop     
c368 00        nop     
c369 00        nop     
c36a 00        nop     
c36b 00        nop     
c36c 00        nop     
c36d 00        nop     
c36e 00        nop     
c36f 00        nop     
c370 00        nop     
c371 00        nop     
c372 00        nop     
c373 00        nop     
c374 00        nop     
c375 00        nop     
c376 00        nop     
c377 00        nop     
c378 00        nop     
c379 00        nop     
c37a 00        nop     
c37b 00        nop     
c37c 00        nop     
c37d 00        nop     
c37e 00        nop     
c37f 00        nop     
c380 00        nop     
c381 00        nop     
c382 00        nop     
c383 00        nop     
c384 00        nop     
c385 00        nop     
c386 00        nop     
c387 00        nop     
c388 00        nop     
c389 00        nop     
c38a 00        nop     
c38b 00        nop     
c38c 00        nop     
c38d 00        nop     
c38e 00        nop     
c38f 00        nop     
c390 00        nop     
c391 00        nop     
c392 00        nop     
c393 00        nop     
c394 00        nop     
c395 00        nop     
c396 00        nop     
c397 00        nop     
c398 00        nop     
c399 00        nop     
c39a 00        nop     
c39b 00        nop     
c39c 00        nop     
c39d 00        nop     
c39e 00        nop     
c39f 00        nop     
c3a0 00        nop     
c3a1 00        nop     
c3a2 00        nop     
c3a3 00        nop     
c3a4 00        nop     
c3a5 00        nop     
c3a6 00        nop     
c3a7 00        nop     
c3a8 00        nop     
c3a9 00        nop     
c3aa 00        nop     
c3ab 00        nop     
c3ac 00        nop     
c3ad 00        nop     
c3ae 00        nop     
c3af 00        nop     
c3b0 00        nop     
c3b1 00        nop     
c3b2 00        nop     
c3b3 00        nop     
c3b4 00        nop     
c3b5 00        nop     
c3b6 00        nop     
c3b7 00        nop     
c3b8 00        nop     
c3b9 00        nop     
c3ba 00        nop     
c3bb 00        nop     
c3bc 00        nop     
c3bd 00        nop     
c3be 00        nop     
c3bf 00        nop     
c3c0 00        nop     
c3c1 00        nop     
c3c2 00        nop     
c3c3 00        nop     
c3c4 00        nop     
c3c5 00        nop     
c3c6 00        nop     
c3c7 00        nop     
c3c8 00        nop     
c3c9 00        nop     
c3ca 00        nop     
c3cb 00        nop     
c3cc 00        nop     
c3cd 00        nop     
c3ce 00        nop     
c3cf 00        nop     
c3d0 00        nop     
c3d1 00        nop     
c3d2 00        nop     
c3d3 00        nop     
c3d4 00        nop     
c3d5 00        nop     
c3d6 00        nop     
c3d7 00        nop     
c3d8 00        nop     
c3d9 00        nop     
c3da 00        nop     
c3db 00        nop     
c3dc 00        nop     
c3dd 00        nop     
c3de 00        nop     
c3df 00        nop     
c3e0 00        nop     
c3e1 00        nop     
c3e2 00        nop     
c3e3 00        nop     
c3e4 00        nop     
c3e5 00        nop     
c3e6 00        nop     
c3e7 00        nop     
c3e8 00        nop     
c3e9 00        nop     
c3ea 00        nop     
c3eb 00        nop     
c3ec 00        nop     
c3ed 00        nop     
c3ee 00        nop     
c3ef 00        nop     
c3f0 00        nop     
c3f1 00        nop     
c3f2 00        nop     
c3f3 00        nop     
c3f4 00        nop     
c3f5 00        nop     
c3f6 00        nop     
c3f7 00        nop     
c3f8 00        nop     
c3f9 00        nop     
c3fa 00        nop     
c3fb 00        nop     
c3fc 00        nop     
c3fd 00        nop     
c3fe 00        nop     
c3ff 00        nop     
c400 00        nop     
c401 00        nop     
c402 00        nop     
c403 00        nop     
c404 00        nop     
c405 00        nop     
c406 00        nop     
c407 00        nop     
c408 00        nop     
c409 00        nop     
c40a 00        nop     
c40b 00        nop     
c40c 00        nop     
c40d 00        nop     
c40e 00        nop     
c40f 00        nop     
c410 00        nop     
c411 00        nop     
c412 00        nop     
c413 00        nop     
c414 00        nop     
c415 00        nop     
c416 00        nop     
c417 00        nop     
c418 00        nop     
c419 00        nop     
c41a 00        nop     
c41b 00        nop     
c41c 00        nop     
c41d 00        nop     
c41e 00        nop     
c41f 00        nop     
c420 00        nop     
c421 00        nop     
c422 00        nop     
c423 00        nop     
c424 00        nop     
c425 00        nop     
c426 00        nop     
c427 00        nop     
c428 00        nop     
c429 00        nop     
c42a 00        nop     
c42b 00        nop     
c42c 00        nop     
c42d 00        nop     
c42e 00        nop     
c42f 00        nop     
c430 00        nop     
c431 00        nop     
c432 00        nop     
c433 00        nop     
c434 00        nop     
c435 00        nop     
c436 00        nop     
c437 00        nop     
c438 00        nop     
c439 00        nop     
c43a 00        nop     
c43b 00        nop     
c43c 00        nop     
c43d 00        nop     
c43e 00        nop     
c43f 00        nop     
c440 00        nop     
c441 00        nop     
c442 00        nop     
c443 00        nop     
c444 00        nop     
c445 00        nop     
c446 00        nop     
c447 00        nop     
c448 00        nop     
c449 00        nop     
c44a 00        nop     
c44b 00        nop     
c44c 00        nop     
c44d 00        nop     
c44e 00        nop     
c44f 00        nop     
c450 00        nop     
c451 00        nop     
c452 00        nop     
c453 00        nop     
c454 00        nop     
c455 00        nop     
c456 00        nop     
c457 00        nop     
c458 00        nop     
c459 00        nop     
c45a 00        nop     
c45b 00        nop     
c45c 00        nop     
c45d 00        nop     
c45e 00        nop     
c45f 00        nop     
c460 00        nop     
c461 00        nop     
c462 00        nop     
c463 00        nop     
c464 00        nop     
c465 00        nop     
c466 00        nop     
c467 00        nop     
c468 00        nop     
c469 00        nop     
c46a 00        nop     
c46b 00        nop     
c46c 00        nop     
c46d 00        nop     
c46e 00        nop     
c46f 00        nop     
c470 00        nop     
c471 00        nop     
c472 00        nop     
c473 00        nop     
c474 00        nop     
c475 00        nop     
c476 00        nop     
c477 00        nop     
c478 00        nop     
c479 00        nop     
c47a 00        nop     
c47b 00        nop     
c47c 00        nop     
c47d 00        nop     
c47e 00        nop     
c47f 00        nop     
c480 00        nop     
c481 00        nop     
c482 00        nop     
c483 00        nop     
c484 00        nop     
c485 00        nop     
c486 00        nop     
c487 00        nop     
c488 00        nop     
c489 00        nop     
c48a 00        nop     
c48b 00        nop     
c48c 00        nop     
c48d 00        nop     
c48e 00        nop     
c48f 00        nop     
c490 00        nop     
c491 00        nop     
c492 00        nop     
c493 00        nop     
c494 00        nop     
c495 00        nop     
c496 00        nop     
c497 00        nop     
c498 00        nop     
c499 00        nop     
c49a 00        nop     
c49b 00        nop     
c49c 00        nop     
c49d 00        nop     
c49e 00        nop     
c49f 00        nop     
c4a0 00        nop     
c4a1 00        nop     
c4a2 00        nop     
c4a3 00        nop     
c4a4 00        nop     
c4a5 00        nop     
c4a6 00        nop     
c4a7 00        nop     
c4a8 00        nop     
c4a9 00        nop     
c4aa 00        nop     
c4ab 00        nop     
c4ac 00        nop     
c4ad 00        nop     
c4ae 00        nop     
c4af 00        nop     
c4b0 00        nop     
c4b1 00        nop     
c4b2 00        nop     
c4b3 00        nop     
c4b4 00        nop     
c4b5 00        nop     
c4b6 00        nop     
c4b7 00        nop     
c4b8 00        nop     
c4b9 00        nop     
c4ba 00        nop     
c4bb 00        nop     
c4bc 00        nop     
c4bd 00        nop     
c4be 00        nop     
c4bf 00        nop     
c4c0 00        nop     
c4c1 00        nop     
c4c2 00        nop     
c4c3 00        nop     
c4c4 00        nop     
c4c5 00        nop     
c4c6 00        nop     
c4c7 00        nop     
c4c8 00        nop     
c4c9 00        nop     
c4ca 00        nop     
c4cb 00        nop     
c4cc 00        nop     
c4cd 00        nop     
c4ce 00        nop     
c4cf 00        nop     
c4d0 00        nop     
c4d1 00        nop     
c4d2 00        nop     
c4d3 00        nop     
c4d4 00        nop     
c4d5 00        nop     
c4d6 00        nop     
c4d7 00        nop     
c4d8 00        nop     
c4d9 00        nop     
c4da 00        nop     
c4db 00        nop     
c4dc 00        nop     
c4dd 00        nop     
c4de 00        nop     
c4df 00        nop     
c4e0 00        nop     
c4e1 00        nop     
c4e2 00        nop     
c4e3 00        nop     
c4e4 00        nop     
c4e5 00        nop     
c4e6 00        nop     
c4e7 00        nop     
c4e8 00        nop     
c4e9 00        nop     
c4ea 00        nop     
c4eb 00        nop     
c4ec 00        nop     
c4ed 00        nop     
c4ee 00        nop     
c4ef 00        nop     
c4f0 00        nop     
c4f1 00        nop     
c4f2 00        nop     
c4f3 00        nop     
c4f4 00        nop     
c4f5 00        nop     
c4f6 00        nop     
c4f7 00        nop     
c4f8 00        nop     
c4f9 00        nop     
c4fa 00        nop     
c4fb 00        nop     
c4fc 00        nop     
c4fd 00        nop     
c4fe 00        nop     
c4ff 00        nop     
c500 00        nop     
c501 00        nop     
c502 00        nop     
c503 00        nop     
c504 00        nop     
c505 00        nop     
c506 00        nop     
c507 00        nop     
c508 00        nop     
c509 00        nop     
c50a 00        nop     
c50b 00        nop     
c50c 00        nop     
c50d 00        nop     
c50e 00        nop     
c50f 00        nop     
c510 00        nop     
c511 00        nop     
c512 00        nop     
c513 00        nop     
c514 00        nop     
c515 00        nop     
c516 00        nop     
c517 00        nop     
c518 00        nop     
c519 00        nop     
c51a 00        nop     
c51b 00        nop     
c51c 00        nop     
c51d 00        nop     
c51e 00        nop     
c51f 00        nop     
c520 00        nop     
c521 00        nop     
c522 00        nop     
c523 00        nop     
c524 00        nop     
c525 00        nop     
c526 00        nop     
c527 00        nop     
c528 00        nop     
c529 00        nop     
c52a 00        nop     
c52b 00        nop     
c52c 00        nop     
c52d 00        nop     
c52e 00        nop     
c52f 00        nop     
c530 00        nop     
c531 00        nop     
c532 00        nop     
c533 00        nop     
c534 00        nop     
c535 00        nop     
c536 00        nop     
c537 00        nop     
c538 00        nop     
c539 00        nop     
c53a 00        nop     
c53b 00        nop     
c53c 00        nop     
c53d 00        nop     
c53e 00        nop     
c53f 00        nop     
c540 00        nop     
c541 00        nop     
c542 00        nop     
c543 00        nop     
c544 00        nop     
c545 00        nop     
c546 00        nop     
c547 00        nop     
c548 00        nop     
c549 00        nop     
c54a 00        nop     
c54b 00        nop     
c54c 00        nop     
c54d 00        nop     
c54e 00        nop     
c54f 00        nop     
c550 00        nop     
c551 00        nop     
c552 00        nop     
c553 00        nop     
c554 00        nop     
c555 00        nop     
c556 00        nop     
c557 00        nop     
c558 00        nop     
c559 00        nop     
c55a 00        nop     
c55b 00        nop     
c55c 00        nop     
c55d 00        nop     
c55e 00        nop     
c55f 00        nop     
c560 00        nop     
c561 00        nop     
c562 00        nop     
c563 00        nop     
c564 00        nop     
c565 00        nop     
c566 00        nop     
c567 00        nop     
c568 00        nop     
c569 00        nop     
c56a 00        nop     
c56b 00        nop     
c56c 00        nop     
c56d 00        nop     
c56e 00        nop     
c56f 00        nop     
c570 00        nop     
c571 00        nop     
c572 00        nop     
c573 00        nop     
c574 00        nop     
c575 00        nop     
c576 00        nop     
c577 00        nop     
c578 00        nop     
c579 00        nop     
c57a 00        nop     
c57b 00        nop     
c57c 00        nop     
c57d 00        nop     
c57e 00        nop     
c57f 00        nop     
c580 00        nop     
c581 00        nop     
c582 00        nop     
c583 00        nop     
c584 00        nop     
c585 00        nop     
c586 00        nop     
c587 00        nop     
c588 00        nop     
c589 00        nop     
c58a 00        nop     
c58b 00        nop     
c58c 00        nop     
c58d 00        nop     
c58e 00        nop     
c58f 00        nop     
c590 00        nop     
c591 00        nop     
c592 00        nop     
c593 00        nop     
c594 00        nop     
c595 00        nop     
c596 00        nop     
c597 00        nop     
c598 00        nop     
c599 00        nop     
c59a 00        nop     
c59b 00        nop     
c59c 00        nop     
c59d 00        nop     
c59e 00        nop     
c59f 00        nop     
c5a0 00        nop     
c5a1 00        nop     
c5a2 00        nop     
c5a3 00        nop     
c5a4 00        nop     
c5a5 00        nop     
c5a6 00        nop     
c5a7 00        nop     
c5a8 00        nop     
c5a9 00        nop     
c5aa 00        nop     
c5ab 00        nop     
c5ac 00        nop     
c5ad 00        nop     
c5ae 00        nop     
c5af 00        nop     
c5b0 00        nop     
c5b1 00        nop     
c5b2 00        nop     
c5b3 00        nop     
c5b4 00        nop     
c5b5 00        nop     
c5b6 00        nop     
c5b7 00        nop     
c5b8 00        nop     
c5b9 00        nop     
c5ba 00        nop     
c5bb 00        nop     
c5bc 00        nop     
c5bd 00        nop     
c5be 00        nop     
c5bf 00        nop     
c5c0 00        nop     
c5c1 00        nop     
c5c2 00        nop     
c5c3 00        nop     
c5c4 00        nop     
c5c5 00        nop     
c5c6 00        nop     
c5c7 00        nop     
c5c8 00        nop     
c5c9 00        nop     
c5ca 00        nop     
c5cb 00        nop     
c5cc 00        nop     
c5cd 00        nop     
c5ce 00        nop     
c5cf 00        nop     
c5d0 00        nop     
c5d1 00        nop     
c5d2 00        nop     
c5d3 00        nop     
c5d4 00        nop     
c5d5 00        nop     
c5d6 00        nop     
c5d7 00        nop     
c5d8 00        nop     
c5d9 00        nop     
c5da 00        nop     
c5db 00        nop     
c5dc 00        nop     
c5dd 00        nop     
c5de 00        nop     
c5df 00        nop     
c5e0 00        nop     
c5e1 00        nop     
c5e2 00        nop     
c5e3 00        nop     
c5e4 00        nop     
c5e5 00        nop     
c5e6 00        nop     
c5e7 00        nop     
c5e8 00        nop     
c5e9 00        nop     
c5ea 00        nop     
c5eb 00        nop     
c5ec 00        nop     
c5ed 00        nop     
c5ee 00        nop     
c5ef 00        nop     
c5f0 00        nop     
c5f1 00        nop     
c5f2 00        nop     
c5f3 00        nop     
c5f4 00        nop     
c5f5 00        nop     
c5f6 00        nop     
c5f7 00        nop     
c5f8 00        nop     
c5f9 00        nop     
c5fa 00        nop     
c5fb 00        nop     
c5fc 00        nop     
c5fd 00        nop     
c5fe 00        nop     
c5ff 00        nop     
c600 00        nop     
c601 00        nop     
c602 00        nop     
c603 00        nop     
c604 00        nop     
c605 00        nop     
c606 00        nop     
c607 00        nop     
c608 00        nop     
c609 00        nop     
c60a 00        nop     
c60b 00        nop     
c60c 00        nop     
c60d 00        nop     
c60e 00        nop     
c60f 00        nop     
c610 00        nop     
c611 00        nop     
c612 00        nop     
c613 00        nop     
c614 00        nop     
c615 00        nop     
c616 00        nop     
c617 00        nop     
c618 00        nop     
c619 00        nop     
c61a 00        nop     
c61b 00        nop     
c61c 00        nop     
c61d 00        nop     
c61e 00        nop     
c61f 00        nop     
c620 00        nop     
c621 00        nop     
c622 00        nop     
c623 00        nop     
c624 00        nop     
c625 00        nop     
c626 00        nop     
c627 00        nop     
c628 00        nop     
c629 00        nop     
c62a 00        nop     
c62b 00        nop     
c62c 00        nop     
c62d 00        nop     
c62e 00        nop     
c62f 00        nop     
c630 00        nop     
c631 00        nop     
c632 00        nop     
c633 00        nop     
c634 00        nop     
c635 00        nop     
c636 00        nop     
c637 00        nop     
c638 00        nop     
c639 00        nop     
c63a 00        nop     
c63b 00        nop     
c63c 00        nop     
c63d 00        nop     
c63e 00        nop     
c63f 00        nop     
c640 00        nop     
c641 00        nop     
c642 00        nop     
c643 00        nop     
c644 00        nop     
c645 00        nop     
c646 00        nop     
c647 00        nop     
c648 00        nop     
c649 00        nop     
c64a 00        nop     
c64b 00        nop     
c64c 00        nop     
c64d 00        nop     
c64e 00        nop     
c64f 00        nop     
c650 00        nop     
c651 00        nop     
c652 00        nop     
c653 00        nop     
c654 00        nop     
c655 00        nop     
c656 00        nop     
c657 00        nop     
c658 00        nop     
c659 00        nop     
c65a 00        nop     
c65b 00        nop     
c65c 00        nop     
c65d 00        nop     
c65e 00        nop     
c65f 00        nop     
c660 00        nop     
c661 00        nop     
c662 00        nop     
c663 00        nop     
c664 00        nop     
c665 00        nop     
c666 00        nop     
c667 00        nop     
c668 00        nop     
c669 00        nop     
c66a 00        nop     
c66b 00        nop     
c66c 00        nop     
c66d 00        nop     
c66e 00        nop     
c66f 00        nop     
c670 00        nop     
c671 00        nop     
c672 00        nop     
c673 00        nop     
c674 00        nop     
c675 00        nop     
c676 00        nop     
c677 00        nop     
c678 00        nop     
c679 00        nop     
c67a 00        nop     
c67b 00        nop     
c67c 00        nop     
c67d 00        nop     
c67e 00        nop     
c67f 00        nop     
c680 00        nop     
c681 00        nop     
c682 00        nop     
c683 00        nop     
c684 00        nop     
c685 00        nop     
c686 00        nop     
c687 00        nop     
c688 00        nop     
c689 00        nop     
c68a 00        nop     
c68b 00        nop     
c68c 00        nop     
c68d 00        nop     
c68e 00        nop     
c68f 00        nop     
c690 00        nop     
c691 00        nop     
c692 00        nop     
c693 00        nop     
c694 00        nop     
c695 00        nop     
c696 00        nop     
c697 00        nop     
c698 00        nop     
c699 00        nop     
c69a 00        nop     
c69b 00        nop     
c69c 00        nop     
c69d 00        nop     
c69e 00        nop     
c69f 00        nop     
c6a0 00        nop     
c6a1 00        nop     
c6a2 00        nop     
c6a3 00        nop     
c6a4 00        nop     
c6a5 00        nop     
c6a6 00        nop     
c6a7 00        nop     
c6a8 00        nop     
c6a9 00        nop     
c6aa 00        nop     
c6ab 00        nop     
c6ac 00        nop     
c6ad 00        nop     
c6ae 00        nop     
c6af 00        nop     
c6b0 00        nop     
c6b1 00        nop     
c6b2 00        nop     
c6b3 00        nop     
c6b4 00        nop     
c6b5 00        nop     
c6b6 00        nop     
c6b7 00        nop     
c6b8 00        nop     
c6b9 00        nop     
c6ba 00        nop     
c6bb 00        nop     
c6bc 00        nop     
c6bd 00        nop     
c6be 00        nop     
c6bf 00        nop     
c6c0 00        nop     
c6c1 00        nop     
c6c2 00        nop     
c6c3 00        nop     
c6c4 00        nop     
c6c5 00        nop     
c6c6 00        nop     
c6c7 00        nop     
c6c8 00        nop     
c6c9 00        nop     
c6ca 00        nop     
c6cb 00        nop     
c6cc 00        nop     
c6cd 00        nop     
c6ce 00        nop     
c6cf 00        nop     
c6d0 00        nop     
c6d1 00        nop     
c6d2 00        nop     
c6d3 00        nop     
c6d4 00        nop     
c6d5 00        nop     
c6d6 00        nop     
c6d7 00        nop     
c6d8 00        nop     
c6d9 00        nop     
c6da 00        nop     
c6db 00        nop     
c6dc 00        nop     
c6dd 00        nop     
c6de 00        nop     
c6df 00        nop     
c6e0 00        nop     
c6e1 00        nop     
c6e2 00        nop     
c6e3 00        nop     
c6e4 00        nop     
c6e5 00        nop     
c6e6 00        nop     
c6e7 00        nop     
c6e8 00        nop     
c6e9 00        nop     
c6ea 00        nop     
c6eb 00        nop     
c6ec 00        nop     
c6ed 00        nop     
c6ee 00        nop     
c6ef 00        nop     
c6f0 00        nop     
c6f1 00        nop     
c6f2 00        nop     
c6f3 00        nop     
c6f4 00        nop     
c6f5 00        nop     
c6f6 00        nop     
c6f7 00        nop     
c6f8 00        nop     
c6f9 00        nop     
c6fa 00        nop     
c6fb 00        nop     
c6fc 00        nop     
c6fd 00        nop     
c6fe 00        nop     
c6ff 00        nop     
c700 00        nop     
c701 00        nop     
c702 00        nop     
c703 00        nop     
c704 00        nop     
c705 00        nop     
c706 00        nop     
c707 00        nop     
c708 00        nop     
c709 00        nop     
c70a 00        nop     
c70b 00        nop     
c70c 00        nop     
c70d 00        nop     
c70e 00        nop     
c70f 00        nop     
c710 00        nop     
c711 00        nop     
c712 00        nop     
c713 00        nop     
c714 00        nop     
c715 00        nop     
c716 00        nop     
c717 00        nop     
c718 00        nop     
c719 00        nop     
c71a 00        nop     
c71b 00        nop     
c71c 00        nop     
c71d 00        nop     
c71e 00        nop     
c71f 00        nop     
c720 00        nop     
c721 00        nop     
c722 00        nop     
c723 00        nop     
c724 00        nop     
c725 00        nop     
c726 00        nop     
c727 00        nop     
c728 00        nop     
c729 00        nop     
c72a 00        nop     
c72b 00        nop     
c72c 00        nop     
c72d 00        nop     
c72e 00        nop     
c72f 00        nop     
c730 00        nop     
c731 00        nop     
c732 00        nop     
c733 00        nop     
c734 00        nop     
c735 00        nop     
c736 00        nop     
c737 00        nop     
c738 00        nop     
c739 00        nop     
c73a 00        nop     
c73b 00        nop     
c73c 00        nop     
c73d 00        nop     
c73e 00        nop     
c73f 00        nop     
c740 00        nop     
c741 00        nop     
c742 00        nop     
c743 00        nop     
c744 00        nop     
c745 00        nop     
c746 00        nop     
c747 00        nop     
c748 00        nop     
c749 00        nop     
c74a 00        nop     
c74b 00        nop     
c74c 00        nop     
c74d 00        nop     
c74e 00        nop     
c74f 00        nop     
c750 00        nop     
c751 00        nop     
c752 00        nop     
c753 00        nop     
c754 00        nop     
c755 00        nop     
c756 00        nop     
c757 00        nop     
c758 00        nop     
c759 00        nop     
c75a 00        nop     
c75b 00        nop     
c75c 00        nop     
c75d 00        nop     
c75e 00        nop     
c75f 00        nop     
c760 00        nop     
c761 00        nop     
c762 00        nop     
c763 00        nop     
c764 00        nop     
c765 00        nop     
c766 00        nop     
c767 00        nop     
c768 00        nop     
c769 00        nop     
c76a 00        nop     
c76b 00        nop     
c76c 00        nop     
c76d 00        nop     
c76e 00        nop     
c76f 00        nop     
c770 00        nop     
c771 00        nop     
c772 00        nop     
c773 00        nop     
c774 00        nop     
c775 00        nop     
c776 00        nop     
c777 00        nop     
c778 00        nop     
c779 00        nop     
c77a 00        nop     
c77b 00        nop     
c77c 00        nop     
c77d 00        nop     
c77e 00        nop     
c77f 00        nop     
c780 00        nop     
c781 00        nop     
c782 00        nop     
c783 00        nop     
c784 00        nop     
c785 00        nop     
c786 00        nop     
c787 00        nop     
c788 00        nop     
c789 00        nop     
c78a 00        nop     
c78b 00        nop     
c78c 00        nop     
c78d 00        nop     
c78e 00        nop     
c78f 00        nop     
c790 00        nop     
c791 00        nop     
c792 00        nop     
c793 00        nop     
c794 00        nop     
c795 00        nop     
c796 00        nop     
c797 00        nop     
c798 00        nop     
c799 00        nop     
c79a 00        nop     
c79b 00        nop     
c79c 00        nop     
c79d 00        nop     
c79e 00        nop     
c79f 00        nop     
c7a0 00        nop     
c7a1 00        nop     
c7a2 00        nop     
c7a3 00        nop     
c7a4 00        nop     
c7a5 00        nop     
c7a6 00        nop     
c7a7 00        nop     
c7a8 00        nop     
c7a9 00        nop     
c7aa 00        nop     
c7ab 00        nop     
c7ac 00        nop     
c7ad 00        nop     
c7ae 00        nop     
c7af 00        nop     
c7b0 00        nop     
c7b1 00        nop     
c7b2 00        nop     
c7b3 00        nop     
c7b4 00        nop     
c7b5 00        nop     
c7b6 00        nop     
c7b7 00        nop     
c7b8 00        nop     
c7b9 00        nop     
c7ba 00        nop     
c7bb 00        nop     
c7bc 00        nop     
c7bd 00        nop     
c7be 00        nop     
c7bf 00        nop     
c7c0 00        nop     
c7c1 00        nop     
c7c2 00        nop     
c7c3 00        nop     
c7c4 00        nop     
c7c5 00        nop     
c7c6 00        nop     
c7c7 00        nop     
c7c8 00        nop     
c7c9 00        nop     
c7ca 00        nop     
c7cb 00        nop     
c7cc 00        nop     
c7cd 00        nop     
c7ce 00        nop     
c7cf 00        nop     
c7d0 00        nop     
c7d1 00        nop     
c7d2 00        nop     
c7d3 00        nop     
c7d4 00        nop     
c7d5 00        nop     
c7d6 00        nop     
c7d7 00        nop     
c7d8 00        nop     
c7d9 00        nop     
c7da 00        nop     
c7db 00        nop     
c7dc 00        nop     
c7dd 00        nop     
c7de 00        nop     
c7df 00        nop     
c7e0 00        nop     
c7e1 00        nop     
c7e2 00        nop     
c7e3 00        nop     
c7e4 00        nop     
c7e5 00        nop     
c7e6 00        nop     
c7e7 00        nop     
c7e8 00        nop     
c7e9 00        nop     
c7ea 00        nop     
c7eb 00        nop     
c7ec 00        nop     
c7ed 00        nop     
c7ee 00        nop     
c7ef 00        nop     
c7f0 00        nop     
c7f1 00        nop     
c7f2 00        nop     
c7f3 00        nop     
c7f4 00        nop     
c7f5 00        nop     
c7f6 00        nop     
c7f7 00        nop     
c7f8 00        nop     
c7f9 00        nop     
c7fa 00        nop     
c7fb 00        nop     
c7fc 00        nop     
c7fd 00        nop     
c7fe 00        nop     
c7ff 00        nop     
c800 00        nop     
c801 00        nop     
c802 00        nop     
c803 00        nop     
c804 00        nop     
c805 00        nop     
c806 00        nop     
c807 00        nop     
c808 00        nop     
c809 00        nop     
c80a 00        nop     
c80b 00        nop     
c80c 00        nop     
c80d 00        nop     
c80e 00        nop     
c80f 00        nop     
c810 00        nop     
c811 00        nop     
c812 00        nop     
c813 00        nop     
c814 00        nop     
c815 00        nop     
c816 00        nop     
c817 00        nop     
c818 00        nop     
c819 00        nop     
c81a 00        nop     
c81b 00        nop     
c81c 00        nop     
c81d 00        nop     
c81e 00        nop     
c81f 00        nop     
c820 00        nop     
c821 00        nop     
c822 00        nop     
c823 00        nop     
c824 00        nop     
c825 00        nop     
c826 00        nop     
c827 00        nop     
c828 00        nop     
c829 00        nop     
c82a 00        nop     
c82b 00        nop     
c82c 00        nop     
c82d 00        nop     
c82e 00        nop     
c82f 00        nop     
c830 00        nop     
c831 00        nop     
c832 00        nop     
c833 00        nop     
c834 00        nop     
c835 00        nop     
c836 00        nop     
c837 00        nop     
c838 00        nop     
c839 00        nop     
c83a 00        nop     
c83b 00        nop     
c83c 00        nop     
c83d 00        nop     
c83e 00        nop     
c83f 00        nop     
c840 00        nop     
c841 00        nop     
c842 110000    ld      de,0000h
c845 2197c8    ld      hl,0c897h
c848 010004    ld      bc,0400h
c84b cd5c00    call    005ch
c84e 110008    ld      de,0800h
c851 2197c8    ld      hl,0c897h
c854 010004    ld      bc,0400h
c857 cd5c00    call    005ch
c85a 110010    ld      de,1000h
c85d 2197c8    ld      hl,0c897h
c860 010004    ld      bc,0400h
c863 cd5c00    call    005ch
c866 110020    ld      de,2000h
c869 2197cc    ld      hl,0cc97h
c86c 010004    ld      bc,0400h
c86f cd5c00    call    005ch
c872 110028    ld      de,2800h
c875 2197cc    ld      hl,0cc97h
c878 010004    ld      bc,0400h
c87b cd5c00    call    005ch
c87e 110030    ld      de,3000h
c881 2197cc    ld      hl,0cc97h
c884 010004    ld      bc,0400h
c887 cd5c00    call    005ch
c88a 110018    ld      de,1800h
c88d 2197d0    ld      hl,0d097h
c890 010003    ld      bc,0300h
c893 cd5c00    call    005ch
c896 c9        ret     

c897 00        nop     
c898 00        nop     
c899 00        nop     
c89a 00        nop     
c89b 00        nop     
c89c 00        nop     
c89d 00        nop     
c89e 00        nop     
c89f 2020      jr      nz,0c8c1h
c8a1 2000      jr      nz,0c8a3h
c8a3 04        inc     b
c8a4 04        inc     b
c8a5 04        inc     b
c8a6 00        nop     
c8a7 2020      jr      nz,0c8c9h
c8a9 2000      jr      nz,0c8abh
c8ab 04        inc     b
c8ac 04        inc     b
c8ad 04        inc     b
c8ae 00        nop     
c8af 00        nop     
c8b0 80        add     a,b
c8b1 80        add     a,b
c8b2 80        add     a,b
c8b3 80        add     a,b
c8b4 80        add     a,b
c8b5 80        add     a,b
c8b6 aa        xor     d
c8b7 00        nop     
c8b8 80        add     a,b
c8b9 80        add     a,b
c8ba 80        add     a,b
c8bb 80        add     a,b
c8bc 80        add     a,b
c8bd 80        add     a,b
c8be aa        xor     d
c8bf 00        nop     
c8c0 80        add     a,b
c8c1 80        add     a,b
c8c2 80        add     a,b
c8c3 80        add     a,b
c8c4 80        add     a,b
c8c5 80        add     a,b
c8c6 55        ld      d,l
c8c7 55        ld      d,l
c8c8 80        add     a,b
c8c9 00        nop     
c8ca 80        add     a,b
c8cb 00        nop     
c8cc 80        add     a,b
c8cd 00        nop     
c8ce 55        ld      d,l
c8cf 2000      jr      nz,0c8d1h
c8d1 12        ld      (de),a
c8d2 80        add     a,b
c8d3 1005      djnz    0c8dah
c8d5 80        add     a,b
c8d6 1070      djnz    0c948h
c8d8 70        ld      (hl),b
c8d9 70        ld      (hl),b
c8da 70        ld      (hl),b
c8db 70        ld      (hl),b
c8dc 70        ld      (hl),b
c8dd 70        ld      (hl),b
c8de 80        add     a,b
c8df 00        nop     
c8e0 00        nop     
c8e1 00        nop     
c8e2 00        nop     
c8e3 00        nop     
c8e4 00        nop     
c8e5 00        nop     
c8e6 00        nop     
c8e7 f0        ret     p

c8e8 f0        ret     p

c8e9 f0        ret     p

c8ea f0        ret     p

c8eb f0        ret     p

c8ec f0        ret     p

c8ed f0        ret     p

c8ee f0        ret     p

c8ef 03        inc     bc
c8f0 03        inc     bc
c8f1 03        inc     bc
c8f2 03        inc     bc
c8f3 03        inc     bc
c8f4 03        inc     bc
c8f5 03        inc     bc
c8f6 03        inc     bc
c8f7 00        nop     
c8f8 00        nop     
c8f9 00        nop     
c8fa 00        nop     
c8fb 00        nop     
c8fc 00        nop     
c8fd 00        nop     
c8fe 00        nop     
c8ff 00        nop     
c900 00        nop     
c901 00        nop     
c902 00        nop     
c903 00        nop     
c904 00        nop     
c905 00        nop     
c906 00        nop     
c907 00        nop     
c908 00        nop     
c909 00        nop     
c90a 00        nop     
c90b 00        nop     
c90c 00        nop     
c90d 00        nop     
c90e 00        nop     
c90f 00        nop     
c910 00        nop     
c911 00        nop     
c912 00        nop     
c913 00        nop     
c914 00        nop     
c915 00        nop     
c916 00        nop     
c917 00        nop     
c918 00        nop     
c919 00        nop     
c91a 00        nop     
c91b 00        nop     
c91c 00        nop     
c91d 00        nop     
c91e 00        nop     
c91f 00        nop     
c920 00        nop     
c921 00        nop     
c922 00        nop     
c923 00        nop     
c924 00        nop     
c925 00        nop     
c926 00        nop     
c927 00        nop     
c928 00        nop     
c929 00        nop     
c92a 00        nop     
c92b 00        nop     
c92c 00        nop     
c92d 00        nop     
c92e 00        nop     
c92f 00        nop     
c930 00        nop     
c931 00        nop     
c932 00        nop     
c933 00        nop     
c934 00        nop     
c935 00        nop     
c936 00        nop     
c937 00        nop     
c938 00        nop     
c939 00        nop     
c93a 00        nop     
c93b 00        nop     
c93c 00        nop     
c93d 00        nop     
c93e 00        nop     
c93f 00        nop     
c940 00        nop     
c941 00        nop     
c942 00        nop     
c943 00        nop     
c944 00        nop     
c945 00        nop     
c946 00        nop     
c947 00        nop     
c948 00        nop     
c949 00        nop     
c94a 00        nop     
c94b 00        nop     
c94c 00        nop     
c94d 00        nop     
c94e 00        nop     
c94f 00        nop     
c950 00        nop     
c951 00        nop     
c952 00        nop     
c953 00        nop     
c954 00        nop     
c955 00        nop     
c956 00        nop     
c957 00        nop     
c958 00        nop     
c959 00        nop     
c95a 00        nop     
c95b 00        nop     
c95c 00        nop     
c95d 00        nop     
c95e 00        nop     
c95f 00        nop     
c960 00        nop     
c961 00        nop     
c962 00        nop     
c963 00        nop     
c964 00        nop     
c965 00        nop     
c966 00        nop     
c967 00        nop     
c968 00        nop     
c969 00        nop     
c96a 00        nop     
c96b 00        nop     
c96c 00        nop     
c96d 00        nop     
c96e 00        nop     
c96f 00        nop     
c970 00        nop     
c971 00        nop     
c972 00        nop     
c973 00        nop     
c974 00        nop     
c975 00        nop     
c976 00        nop     
c977 00        nop     
c978 00        nop     
c979 00        nop     
c97a 00        nop     
c97b 00        nop     
c97c 00        nop     
c97d 00        nop     
c97e 00        nop     
c97f 00        nop     
c980 00        nop     
c981 00        nop     
c982 00        nop     
c983 00        nop     
c984 00        nop     
c985 00        nop     
c986 00        nop     
c987 00        nop     
c988 00        nop     
c989 00        nop     
c98a 00        nop     
c98b 00        nop     
c98c 00        nop     
c98d 00        nop     
c98e 00        nop     
c98f 00        nop     
c990 00        nop     
c991 00        nop     
c992 00        nop     
c993 00        nop     
c994 00        nop     
c995 00        nop     
c996 00        nop     
c997 00        nop     
c998 00        nop     
c999 00        nop     
c99a 00        nop     
c99b 00        nop     
c99c 00        nop     
c99d 00        nop     
c99e 00        nop     
c99f 1818      jr      0c9b9h
c9a1 1818      jr      0c9bbh
c9a3 00        nop     
c9a4 1818      jr      0c9beh
c9a6 00        nop     
c9a7 6c        ld      l,h
c9a8 6c        ld      l,h
c9a9 24        inc     h
c9aa 48        ld      c,b
c9ab 00        nop     
c9ac 00        nop     
c9ad 00        nop     
c9ae 00        nop     
c9af 6c        ld      l,h
c9b0 6c        ld      l,h
c9b1 016c01    ld      bc,016ch
c9b4 6c        ld      l,h
c9b5 6c        ld      l,h
c9b6 00        nop     
c9b7 2881      jr      z,0c93ah
c9b9 e8        ret     pe

c9ba 83        add     a,e
c9bb 2e03      ld      l,03h
c9bd 2800      jr      z,0c9bfh
c9bf 44        ld      b,h
c9c0 ac        xor     h
c9c1 58        ld      e,b
c9c2 3068      jr      nc,0ca2ch
c9c4 d48800    call    nc,0088h
c9c7 3058      jr      nc,0ca21h
c9c9 3070      jr      nc,0ca3bh
c9cb 25        dec     h
c9cc cc8900    call    z,0089h
c9cf 3030      jr      nc,0ca01h
c9d1 1020      djnz    0c9f3h
c9d3 00        nop     
c9d4 00        nop     
c9d5 00        nop     
c9d6 00        nop     
c9d7 1830      jr      0ca09h
c9d9 60        ld      h,b
c9da 60        ld      h,b
c9db 60        ld      h,b
c9dc 3018      jr      nc,0c9f6h
c9de 00        nop     
c9df 60        ld      h,b
c9e0 3018      jr      nc,0c9fah
c9e2 1818      jr      0c9fch
c9e4 3060      jr      nc,0ca46h
c9e6 00        nop     
c9e7 3003      jr      nc,0c9ech
c9e9 78        ld      a,b
c9ea 3078      jr      nc,0ca64h
c9ec 03        inc     bc
c9ed 3000      jr      nc,0c9efh
c9ef 00        nop     
c9f0 3030      jr      nc,0ca22h
c9f2 03        inc     bc
c9f3 3030      jr      nc,0ca25h
c9f5 00        nop     
c9f6 00        nop     
c9f7 00        nop     
c9f8 00        nop     
c9f9 00        nop     
c9fa 3030      jr      nc,0ca2ch
c9fc 1020      djnz    0ca1eh
c9fe 00        nop     
c9ff 00        nop     
ca00 00        nop     
ca01 00        nop     
ca02 83        add     a,e
ca03 00        nop     
ca04 00        nop     
ca05 00        nop     
ca06 00        nop     
ca07 00        nop     
ca08 00        nop     
ca09 00        nop     
ca0a 00        nop     
ca0b 00        nop     
ca0c 3030      jr      nc,0ca3eh
ca0e 00        nop     
ca0f 00        nop     
ca10 060c      ld      b,0ch
ca12 1830      jr      0ca44h
ca14 60        ld      h,b
ca15 c0        ret     nz

ca16 00        nop     
ca17 3844      jr      c,0ca5dh
ca19 312919    ld      sp,1929h
ca1c 44        ld      b,h
ca1d 3800      jr      c,0ca1fh
ca1f 1838      jr      0ca59h
ca21 78        ld      a,b
ca22 1818      jr      0ca3ch
ca24 1883      jr      0c9a9h
ca26 00        nop     
ca27 83        add     a,e
ca28 c686      add     a,86h
ca2a 1c        inc     e
ca2b 3060      jr      nc,0ca8dh
ca2d 010083    ld      bc,8300h
ca30 c606      add     a,06h
ca32 1c        inc     e
ca33 06c6      ld      b,0c6h
ca35 83        add     a,e
ca36 00        nop     
ca37 1c        inc     e
ca38 3c        inc     a
ca39 6c        ld      l,h
ca3a cc010c    call    z,0c01h
ca3d 0c        inc     c
ca3e 00        nop     
ca3f 01c003    ld      bc,03c0h
ca42 0606      ld      b,06h
ca44 c683      add     a,83h
ca46 00        nop     
ca47 83        add     a,e
ca48 c6c0      add     a,0c0h
ca4a 03        inc     bc
ca4b c6c6      add     a,0c6h
ca4d 83        add     a,e
ca4e 00        nop     
ca4f 01060c    ld      bc,0c06h
ca52 1830      jr      0ca84h
ca54 3030      jr      nc,0ca86h
ca56 00        nop     
ca57 83        add     a,e
ca58 c6c6      add     a,0c6h
ca5a 83        add     a,e
ca5b c6c6      add     a,0c6h
ca5d 83        add     a,e
ca5e 00        nop     
ca5f 83        add     a,e
ca60 c6c6      add     a,0c6h
ca62 81        add     a,c
ca63 06c6      ld      b,0c6h
ca65 83        add     a,e
ca66 00        nop     
ca67 3030      jr      nc,0ca99h
ca69 00        nop     
ca6a 00        nop     
ca6b 3030      jr      nc,0ca9dh
ca6d 00        nop     
ca6e 00        nop     
ca6f 3030      jr      nc,0caa1h
ca71 00        nop     
ca72 00        nop     
ca73 3030      jr      nc,0caa5h
ca75 1020      djnz    0ca97h
ca77 0c        inc     c
ca78 1830      jr      0caaah
ca7a 60        ld      h,b
ca7b 3018      jr      nc,0ca95h
ca7d 0c        inc     c
ca7e 00        nop     
ca7f 00        nop     
ca80 00        nop     
ca81 83        add     a,e
ca82 00        nop     
ca83 83        add     a,e
ca84 00        nop     
ca85 00        nop     
ca86 00        nop     
ca87 60        ld      h,b
ca88 3018      jr      nc,0caa2h
ca8a 0c        inc     c
ca8b 1830      jr      0cabdh
ca8d 60        ld      h,b
ca8e 00        nop     
ca8f 83        add     a,e
ca90 c6c6      add     a,0c6h
ca92 1c        inc     e
ca93 3000      jr      nc,0ca95h
ca95 3000      jr      nc,0ca97h
ca97 3c        inc     a
ca98 66        ld      h,(hl)
ca99 25        dec     h
ca9a aa        xor     d
ca9b 21603c    ld      hl,3c60h
ca9e 00        nop     
ca9f 386c      jr      c,0cb0dh
caa1 c6c6      add     a,0c6h
caa3 01c6c6    ld      bc,0c6c6h
caa6 00        nop     
caa7 03        inc     bc
caa8 c6c6      add     a,0c6h
caaa 03        inc     bc
caab c6c6      add     a,0c6h
caad 03        inc     bc
caae 00        nop     
caaf 3c        inc     a
cab0 66        ld      h,(hl)
cab1 c0        ret     nz

cab2 c0        ret     nz

cab3 c0        ret     nz

cab4 62        ld      h,d
cab5 3c        inc     a
cab6 00        nop     
cab7 07        rlca    
cab8 ccc6c6    call    z,0c6c6h
cabb c6cc      add     a,0cch
cabd 07        rlca    
cabe 00        nop     
cabf 01c0c0    ld      bc,0c0c0h
cac2 07        rlca    
cac3 c0        ret     nz

cac4 c0        ret     nz

cac5 010001    ld      bc,0100h
cac8 c0        ret     nz

cac9 c0        ret     nz

caca 07        rlca    
cacb c0        ret     nz

cacc c0        ret     nz

cacd c0        ret     nz

cace 00        nop     
cacf 3c        inc     a
cad0 66        ld      h,(hl)
cad1 c0        ret     nz

cad2 31c666    ld      sp,66c6h
cad5 c1        pop     bc
cad6 00        nop     
cad7 c6c6      add     a,0c6h
cad9 c601      add     a,01h
cadb c6c6      add     a,0c6h
cadd c600      add     a,00h
cadf 78        ld      a,b
cae0 3030      jr      nc,0cb12h
cae2 3030      jr      nc,0cb14h
cae4 3078      jr      nc,0cb5eh
cae6 00        nop     
cae7 1e0c      ld      e,0ch
cae9 0c        inc     c
caea 0c        inc     c
caeb 8c        adc     a,h
caec 23        inc     hl
caed 78        ld      a,b
caee 00        nop     
caef c621      add     a,21h
caf1 07        rlca    
caf2 f0        ret     p

caf3 07        rlca    
caf4 21c600    ld      hl,00c6h
caf7 c0        ret     nz

caf8 c0        ret     nz

caf9 c0        ret     nz

cafa c0        ret     nz

cafb c0        ret     nz

cafc c0        ret     nz

cafd 0100c6    ld      bc,0c600h
cb00 110129    ld      de,2901h
cb03 c6c6      add     a,0c6h
cb05 c600      add     a,00h
cb07 c619      add     a,19h
cb09 09        add     hl,bc
cb0a 2131c6    ld      hl,0c631h
cb0d c600      add     a,00h
cb0f 83        add     a,e
cb10 c6c6      add     a,0c6h
cb12 c6c6      add     a,0c6h
cb14 c683      add     a,83h
cb16 00        nop     
cb17 03        inc     bc
cb18 c6c6      add     a,0c6h
cb1a 03        inc     bc
cb1b c0        ret     nz

cb1c c0        ret     nz

cb1d c0        ret     nz

cb1e 00        nop     
cb1f 83        add     a,e
cb20 c6c6      add     a,0c6h
cb22 c621      add     a,21h
cb24 cc8500    call    z,0085h
cb27 03        inc     bc
cb28 c6c6      add     a,0c6h
cb2a 03        inc     bc
cb2b d8        ret     c

cb2c ccc600    call    z,00c6h
cb2f 83        add     a,e
cb30 c6c0      add     a,0c0h
cb32 83        add     a,e
cb33 06c6      ld      b,0c6h
cb35 83        add     a,e
cb36 00        nop     
cb37 013030    ld      bc,3030h
cb3a 3030      jr      nc,0cb6ch
cb3c 3030      jr      nc,0cb6eh
cb3e 00        nop     
cb3f c6c6      add     a,0c6h
cb41 c6c6      add     a,0c6h
cb43 c6c6      add     a,0c6h
cb45 83        add     a,e
cb46 00        nop     
cb47 c6c6      add     a,0c6h
cb49 6c        ld      l,h
cb4a 6c        ld      l,h
cb4b 6c        ld      l,h
cb4c 3838      jr      c,0cb86h
cb4e 00        nop     
cb4f c6c6      add     a,0c6h
cb51 29        add     hl,hl
cb52 29        add     hl,hl
cb53 29        add     hl,hl
cb54 016c00    ld      bc,006ch
cb57 c66c      add     a,6ch
cb59 3810      jr      c,0cb6bh
cb5b 386c      jr      c,0cbc9h
cb5d c600      add     a,00h
cb5f 82        add     a,d
cb60 c66c      add     a,6ch
cb62 3830      jr      c,0cb94h
cb64 3030      jr      nc,0cb96h
cb66 00        nop     
cb67 01060c    ld      bc,0c06h
cb6a 1830      jr      0cb9ch
cb6c 60        ld      h,b
cb6d 010078    ld      bc,7800h
cb70 60        ld      h,b
cb71 60        ld      h,b
cb72 60        ld      h,b
cb73 60        ld      h,b
cb74 60        ld      h,b
cb75 78        ld      a,b
cb76 00        nop     
cb77 80        add     a,b
cb78 c0        ret     nz

cb79 60        ld      h,b
cb7a 3018      jr      nc,0cb94h
cb7c 0c        inc     c
cb7d 0600      ld      b,00h
cb7f 78        ld      a,b
cb80 1818      jr      0cb9ah
cb82 1818      jr      0cb9ch
cb84 1878      jr      0cbfeh
cb86 00        nop     
cb87 1038      djnz    0cbc1h
cb89 6c        ld      l,h
cb8a c600      add     a,00h
cb8c 00        nop     
cb8d 00        nop     
cb8e 00        nop     
cb8f 00        nop     
cb90 00        nop     
cb91 00        nop     
cb92 00        nop     
cb93 00        nop     
cb94 00        nop     
cb95 03        inc     bc
cb96 00        nop     
cb97 3030      jr      nc,0cbc9h
cb99 1020      djnz    0cbbbh
cb9b 00        nop     
cb9c 00        nop     
cb9d 00        nop     
cb9e 00        nop     
cb9f 00        nop     
cba0 78        ld      a,b
cba1 0c        inc     c
cba2 83        add     a,e
cba3 cccc89    call    z,89cch
cba6 00        nop     
cba7 60        ld      h,b
cba8 60        ld      h,b
cba9 60        ld      h,b
cbaa 83        add     a,e
cbab 66        ld      h,(hl)
cbac 66        ld      h,(hl)
cbad 43        ld      b,e
cbae 00        nop     
cbaf 00        nop     
cbb0 00        nop     
cbb1 83        add     a,e
cbb2 c6c0      add     a,0c0h
cbb4 c683      add     a,83h
cbb6 00        nop     
cbb7 0c        inc     c
cbb8 0c        inc     c
cbb9 0c        inc     c
cbba 83        add     a,e
cbbb cccc85    call    z,85cch
cbbe 00        nop     
cbbf 00        nop     
cbc0 00        nop     
cbc1 83        add     a,e
cbc2 c601      add     a,01h
cbc4 c0        ret     nz

cbc5 81        add     a,c
cbc6 00        nop     
cbc7 1830      jr      0cbf9h
cbc9 3003      jr      nc,0cbceh
cbcb 3030      jr      nc,0cbfdh
cbcd 3000      jr      nc,0cbcfh
cbcf 00        nop     
cbd0 00        nop     
cbd1 85        add     a,l
cbd2 313189    ld      sp,8931h
cbd5 0683      ld      b,83h
cbd7 c0        ret     nz

cbd8 c0        ret     nz

cbd9 c0        ret     nz

cbda 23        inc     hl
cbdb 09        add     hl,bc
cbdc c6c6      add     a,0c6h
cbde 00        nop     
cbdf 00        nop     
cbe0 3000      jr      nc,0cbe2h
cbe2 3030      jr      nc,0cc14h
cbe4 3078      jr      nc,0cc5eh
cbe6 00        nop     
cbe7 00        nop     
cbe8 0600      ld      b,00h
cbea 0606      ld      b,06h
cbec 66        ld      h,(hl)
cbed 6c        ld      l,h
cbee 38c0      jr      c,0cbb0h
cbf0 c0        ret     nz

cbf1 ccd8f0    call    z,0f0d8h
cbf4 d8        ret     c

cbf5 cc0060    call    z,6000h
cbf8 60        ld      h,b
cbf9 60        ld      h,b
cbfa 60        ld      h,b
cbfb 60        ld      h,b
cbfc 60        ld      h,b
cbfd 3000      jr      nc,0cbffh
cbff 00        nop     
cc00 00        nop     
cc01 6c        ld      l,h
cc02 29        add     hl,hl
cc03 29        add     hl,hl
cc04 29        add     hl,hl
cc05 29        add     hl,hl
cc06 00        nop     
cc07 00        nop     
cc08 00        nop     
cc09 83        add     a,e
cc0a c6c6      add     a,0c6h
cc0c c6c6      add     a,0c6h
cc0e 00        nop     
cc0f 00        nop     
cc10 00        nop     
cc11 83        add     a,e
cc12 c6c6      add     a,0c6h
cc14 c683      add     a,83h
cc16 00        nop     
cc17 00        nop     
cc18 00        nop     
cc19 23        inc     hl
cc1a 19        add     hl,de
cc1b 19        add     hl,de
cc1c 23        inc     hl
cc1d c0        ret     nz

cc1e c0        ret     nz

cc1f 00        nop     
cc20 00        nop     
cc21 89        adc     a,c
cc22 31c631    ld      sp,31c6h
cc25 89        adc     a,c
cc26 0600      ld      b,00h
cc28 00        nop     
cc29 23        inc     hl
cc2a 09        add     hl,bc
cc2b c0        ret     nz

cc2c c0        ret     nz

cc2d c0        ret     nz

cc2e 00        nop     
cc2f 00        nop     
cc30 00        nop     
cc31 81        add     a,c
cc32 c0        ret     nz

cc33 010603    ld      bc,0306h
cc36 00        nop     
cc37 00        nop     
cc38 00        nop     
cc39 3001      jr      nc,0cc3ch
cc3b 3030      jr      nc,0cc6dh
cc3d 1e00      ld      e,00h
cc3f 00        nop     
cc40 00        nop     
cc41 00        nop     
cc42 cccccc    call    z,0cccch
cc45 85        add     a,l
cc46 00        nop     
cc47 00        nop     
cc48 00        nop     
cc49 00        nop     
cc4a c66c      add     a,6ch
cc4c 3810      jr      c,0cc5eh
cc4e 00        nop     
cc4f 00        nop     
cc50 00        nop     
cc51 00        nop     
cc52 29        add     hl,hl
cc53 29        add     hl,hl
cc54 29        add     hl,hl
cc55 83        add     a,e
cc56 00        nop     
cc57 00        nop     
cc58 00        nop     
cc59 c66c      add     a,6ch
cc5b 386c      jr      c,0ccc9h
cc5d c600      add     a,00h
cc5f 00        nop     
cc60 00        nop     
cc61 c66c      add     a,6ch
cc63 3830      jr      c,0cc95h
cc65 60        ld      h,b
cc66 c0        ret     nz

cc67 00        nop     
cc68 00        nop     
cc69 011830    ld      bc,3018h
cc6c 60        ld      h,b
cc6d 010018    ld      bc,1800h
cc70 3030      jr      nc,0cca2h
cc72 e0        ret     po

cc73 3030      jr      nc,0cca5h
cc75 1800      jr      0cc77h
cc77 3030      jr      nc,0cca9h
cc79 3030      jr      nc,0ccabh
cc7b 3030      jr      nc,0ccadh
cc7d 3000      jr      nc,0cc7fh
cc7f 60        ld      h,b
cc80 3030      jr      nc,0ccb2h
cc82 1c        inc     e
cc83 3030      jr      nc,0ccb5h
cc85 60        ld      h,b
cc86 00        nop     
cc87 00        nop     
cc88 83        add     a,e
cc89 00        nop     
cc8a 00        nop     
cc8b 00        nop     
cc8c 00        nop     
cc8d 00        nop     
cc8e 00        nop     
cc8f 00        nop     
cc90 00        nop     
cc91 00        nop     
cc92 00        nop     
cc93 00        nop     
cc94 00        nop     
cc95 00        nop     
cc96 00        nop     
cc97 010101    ld      bc,0101h
cc9a 010101    ld      bc,0101h
cc9d 010119    ld      bc,1901h
cca0 1818      jr      0ccbah
cca2 011918    ld      bc,1819h
cca5 1801      jr      0cca8h
cca7 1e1e      ld      e,1eh
cca9 15        dec     d
ccaa 011e1e    ld      bc,1e1eh
ccad 15        dec     d
ccae 010886    ld      bc,8608h
ccb1 86        add     a,(hl)
ccb2 86        add     a,(hl)
ccb3 86        add     a,(hl)
ccb4 86        add     a,(hl)
ccb5 86        add     a,(hl)
ccb6 61        ld      h,c
ccb7 05        dec     b
ccb8 54        ld      d,h
ccb9 54        ld      d,h
ccba 54        ld      d,h
ccbb 54        ld      d,h
ccbc 54        ld      d,h
ccbd 54        ld      d,h
ccbe 41        ld      b,c
ccbf 02        ld      (bc),a
ccc0 2c        inc     l
ccc1 2c        inc     l
ccc2 2c        inc     l
ccc3 2c        inc     l
ccc4 2c        inc     l
ccc5 2c        inc     l
ccc6 c1        pop     bc
ccc7 ba        cp      d
ccc8 ba        cp      d
ccc9 0a        ld      a,(bc)
ccca ba        cp      d
cccb 0a        ld      a,(bc)
cccc ba        cp      d
cccd 0a        ld      a,(bc)
ccce a1        and     c
cccf a1        and     c
ccd0 01c141    ld      bc,41c1h
ccd3 41        ld      b,c
ccd4 61        ld      h,c
ccd5 41        ld      b,c
ccd6 41        ld      b,c
ccd7 2b        dec     hl
ccd8 2b        dec     hl
ccd9 2b        dec     hl
ccda 2b        dec     hl
ccdb 2b        dec     hl
ccdc 2b        dec     hl
ccdd 2b        dec     hl
ccde 12        ld      (de),a
ccdf 0b        dec     bc
cce0 0b        dec     bc
cce1 0b        dec     bc
cce2 0b        dec     bc
cce3 0b        dec     bc
cce4 0b        dec     bc
cce5 0b        dec     bc
cce6 0c        inc     c
cce7 b6        or      (hl)
cce8 b6        or      (hl)
cce9 b6        or      (hl)
ccea b6        or      (hl)
cceb b6        or      (hl)
ccec b6        or      (hl)
cced b6        or      (hl)
ccee c686      add     a,86h
ccf0 86        add     a,(hl)
ccf1 86        add     a,(hl)
ccf2 86        add     a,(hl)
ccf3 86        add     a,(hl)
ccf4 86        add     a,(hl)
ccf5 86        add     a,(hl)
ccf6 86        add     a,(hl)
ccf7 08        ex      af,af'
ccf8 08        ex      af,af'
ccf9 08        ex      af,af'
ccfa 08        ex      af,af'
ccfb 08        ex      af,af'
ccfc 08        ex      af,af'
ccfd 08        ex      af,af'
ccfe 08        ex      af,af'
ccff 010101    ld      bc,0101h
cd02 010101    ld      bc,0101h
cd05 010101    ld      bc,0101h
cd08 010101    ld      bc,0101h
cd0b 010101    ld      bc,0101h
cd0e 010101    ld      bc,0101h
cd11 010101    ld      bc,0101h
cd14 010101    ld      bc,0101h
cd17 010101    ld      bc,0101h
cd1a 010101    ld      bc,0101h
cd1d 010101    ld      bc,0101h
cd20 010101    ld      bc,0101h
cd23 010101    ld      bc,0101h
cd26 010101    ld      bc,0101h
cd29 010101    ld      bc,0101h
cd2c 010101    ld      bc,0101h
cd2f 010101    ld      bc,0101h
cd32 010101    ld      bc,0101h
cd35 010101    ld      bc,0101h
cd38 010101    ld      bc,0101h
cd3b 010101    ld      bc,0101h
cd3e 010101    ld      bc,0101h
cd41 010101    ld      bc,0101h
cd44 010101    ld      bc,0101h
cd47 010101    ld      bc,0101h
cd4a 010101    ld      bc,0101h
cd4d 010101    ld      bc,0101h
cd50 010101    ld      bc,0101h
cd53 010101    ld      bc,0101h
cd56 010101    ld      bc,0101h
cd59 010101    ld      bc,0101h
cd5c 010101    ld      bc,0101h
cd5f 010101    ld      bc,0101h
cd62 010101    ld      bc,0101h
cd65 010101    ld      bc,0101h
cd68 010101    ld      bc,0101h
cd6b 010101    ld      bc,0101h
cd6e 010101    ld      bc,0101h
cd71 010101    ld      bc,0101h
cd74 010101    ld      bc,0101h
cd77 010101    ld      bc,0101h
cd7a 010101    ld      bc,0101h
cd7d 010101    ld      bc,0101h
cd80 010101    ld      bc,0101h
cd83 010101    ld      bc,0101h
cd86 010101    ld      bc,0101h
cd89 010101    ld      bc,0101h
cd8c 010101    ld      bc,0101h
cd8f 010101    ld      bc,0101h
cd92 010101    ld      bc,0101h
cd95 010101    ld      bc,0101h
cd98 010101    ld      bc,0101h
cd9b 010101    ld      bc,0101h
cd9e 01f1f1    ld      bc,0f1f1h
cda1 f1        pop     af
cda2 f1        pop     af
cda3 01f1f1    ld      bc,0f1f1h
cda6 01f1f1    ld      bc,0f1f1h
cda9 f1        pop     af
cdaa f1        pop     af
cdab 010101    ld      bc,0101h
cdae 01f1f1    ld      bc,0f1f1h
cdb1 1f        rra     
cdb2 f1        pop     af
cdb3 1f        rra     
cdb4 f1        pop     af
cdb5 f1        pop     af
cdb6 01f11f    ld      bc,1ff1h
cdb9 f1        pop     af
cdba 1f        rra     
cdbb f1        pop     af
cdbc 1f        rra     
cdbd f1        pop     af
cdbe 01f1f1    ld      bc,0f1f1h
cdc1 f1        pop     af
cdc2 f1        pop     af
cdc3 f1        pop     af
cdc4 f1        pop     af
cdc5 f1        pop     af
cdc6 01f1f1    ld      bc,0f1f1h
cdc9 f1        pop     af
cdca f1        pop     af
cdcb 1f        rra     
cdcc f1        pop     af
cdcd 1f        rra     
cdce 01f1f1    ld      bc,0f1f1h
cdd1 f1        pop     af
cdd2 f1        pop     af
cdd3 010101    ld      bc,0101h
cdd6 01f1f1    ld      bc,0f1f1h
cdd9 f1        pop     af
cdda f1        pop     af
cddb f1        pop     af
cddc f1        pop     af
cddd f1        pop     af
cdde 01f1f1    ld      bc,0f1f1h
cde1 f1        pop     af
cde2 f1        pop     af
cde3 f1        pop     af
cde4 f1        pop     af
cde5 f1        pop     af
cde6 01f11f    ld      bc,1ff1h
cde9 f1        pop     af
cdea f1        pop     af
cdeb f1        pop     af
cdec 1f        rra     
cded f1        pop     af
cdee 0101f1    ld      bc,0f101h
cdf1 f1        pop     af
cdf2 1f        rra     
cdf3 f1        pop     af
cdf4 f1        pop     af
cdf5 010101    ld      bc,0101h
cdf8 0101f1    ld      bc,0f101h
cdfb f1        pop     af
cdfc f1        pop     af
cdfd f1        pop     af
cdfe 010101    ld      bc,0101h
ce01 011f01    ld      bc,011fh
ce04 010101    ld      bc,0101h
ce07 010101    ld      bc,0101h
ce0a 0101f1    ld      bc,0f101h
ce0d f1        pop     af
ce0e 0101f1    ld      bc,0f101h
ce11 f1        pop     af
ce12 f1        pop     af
ce13 f1        pop     af
ce14 f1        pop     af
ce15 f1        pop     af
ce16 01f1f1    ld      bc,0f1f1h
ce19 1f        rra     
ce1a 1f        rra     
ce1b 1f        rra     
ce1c f1        pop     af
ce1d f1        pop     af
ce1e 01f1f1    ld      bc,0f1f1h
ce21 f1        pop     af
ce22 f1        pop     af
ce23 f1        pop     af
ce24 f1        pop     af
ce25 1f        rra     
ce26 011ff1    ld      bc,0f11fh
ce29 f1        pop     af
ce2a f1        pop     af
ce2b f1        pop     af
ce2c f1        pop     af
ce2d 1f        rra     
ce2e 011ff1    ld      bc,0f11fh
ce31 f1        pop     af
ce32 f1        pop     af
ce33 f1        pop     af
ce34 f1        pop     af
ce35 1f        rra     
ce36 01f1f1    ld      bc,0f1f1h
ce39 f1        pop     af
ce3a f1        pop     af
ce3b 1f        rra     
ce3c f1        pop     af
ce3d f1        pop     af
ce3e 011ff1    ld      bc,0f11fh
ce41 1f        rra     
ce42 f1        pop     af
ce43 f1        pop     af
ce44 f1        pop     af
ce45 1f        rra     
ce46 011ff1    ld      bc,0f11fh
ce49 f1        pop     af
ce4a 1f        rra     
ce4b f1        pop     af
ce4c f1        pop     af
ce4d 1f        rra     
ce4e 011ff1    ld      bc,0f11fh
ce51 f1        pop     af
ce52 f1        pop     af
ce53 f1        pop     af
ce54 f1        pop     af
ce55 f1        pop     af
ce56 011ff1    ld      bc,0f11fh
ce59 f1        pop     af
ce5a 1f        rra     
ce5b f1        pop     af
ce5c f1        pop     af
ce5d 1f        rra     
ce5e 011ff1    ld      bc,0f11fh
ce61 f1        pop     af
ce62 1f        rra     
ce63 f1        pop     af
ce64 f1        pop     af
ce65 1f        rra     
ce66 01f1f1    ld      bc,0f1f1h
ce69 0101f1    ld      bc,0f101h
ce6c f1        pop     af
ce6d 0101f1    ld      bc,0f101h
ce70 f1        pop     af
ce71 0101f1    ld      bc,0f101h
ce74 f1        pop     af
ce75 f1        pop     af
ce76 f1        pop     af
ce77 f1        pop     af
ce78 f1        pop     af
ce79 f1        pop     af
ce7a f1        pop     af
ce7b f1        pop     af
ce7c f1        pop     af
ce7d f1        pop     af
ce7e 010101    ld      bc,0101h
ce81 1f        rra     
ce82 011f01    ld      bc,011fh
ce85 0101f1    ld      bc,0f101h
ce88 f1        pop     af
ce89 f1        pop     af
ce8a f1        pop     af
ce8b f1        pop     af
ce8c f1        pop     af
ce8d f1        pop     af
ce8e 011ff1    ld      bc,0f11fh
ce91 f1        pop     af
ce92 f1        pop     af
ce93 f1        pop     af
ce94 01f101    ld      bc,01f1h
ce97 f1        pop     af
ce98 f1        pop     af
ce99 1f        rra     
ce9a f1        pop     af
ce9b 1f        rra     
ce9c f1        pop     af
ce9d f1        pop     af
ce9e 01f1f1    ld      bc,0f1f1h
cea1 f1        pop     af
cea2 f1        pop     af
cea3 1f        rra     
cea4 f1        pop     af
cea5 f1        pop     af
cea6 011ff1    ld      bc,0f11fh
cea9 f1        pop     af
ceaa 1f        rra     
ceab f1        pop     af
ceac f1        pop     af
cead 1f        rra     
ceae 01f1f1    ld      bc,0f1f1h
ceb1 f1        pop     af
ceb2 f1        pop     af
ceb3 f1        pop     af
ceb4 f1        pop     af
ceb5 f1        pop     af
ceb6 011ff1    ld      bc,0f11fh
ceb9 f1        pop     af
ceba f1        pop     af
cebb f1        pop     af
cebc f1        pop     af
cebd 1f        rra     
cebe 011ff1    ld      bc,0f11fh
cec1 f1        pop     af
cec2 1f        rra     
cec3 f1        pop     af
cec4 f1        pop     af
cec5 1f        rra     
cec6 011ff1    ld      bc,0f11fh
cec9 f1        pop     af
ceca 1f        rra     
cecb f1        pop     af
cecc f1        pop     af
cecd f1        pop     af
cece 01f1f1    ld      bc,0f1f1h
ced1 f1        pop     af
ced2 1f        rra     
ced3 f1        pop     af
ced4 f1        pop     af
ced5 1f        rra     
ced6 01f1f1    ld      bc,0f1f1h
ced9 f1        pop     af
ceda 1f        rra     
cedb f1        pop     af
cedc f1        pop     af
cedd f1        pop     af
cede 01f1f1    ld      bc,0f1f1h
cee1 f1        pop     af
cee2 f1        pop     af
cee3 f1        pop     af
cee4 f1        pop     af
cee5 f1        pop     af
cee6 01f1f1    ld      bc,0f1f1h
cee9 f1        pop     af
ceea f1        pop     af
ceeb f1        pop     af
ceec 1f        rra     
ceed f1        pop     af
ceee 01f11f    ld      bc,1ff1h
cef1 1f        rra     
cef2 f1        pop     af
cef3 1f        rra     
cef4 1f        rra     
cef5 f1        pop     af
cef6 01f1f1    ld      bc,0f1f1h
cef9 f1        pop     af
cefa f1        pop     af
cefb f1        pop     af
cefc f1        pop     af
cefd 1f        rra     
cefe 01f11f    ld      bc,1ff1h
cf01 1f        rra     
cf02 1f        rra     
cf03 f1        pop     af
cf04 f1        pop     af
cf05 f1        pop     af
cf06 01f11f    ld      bc,1ff1h
cf09 1f        rra     
cf0a 1f        rra     
cf0b 1f        rra     
cf0c f1        pop     af
cf0d f1        pop     af
cf0e 011ff1    ld      bc,0f11fh
cf11 f1        pop     af
cf12 f1        pop     af
cf13 f1        pop     af
cf14 f1        pop     af
cf15 1f        rra     
cf16 011ff1    ld      bc,0f11fh
cf19 f1        pop     af
cf1a 1f        rra     
cf1b f1        pop     af
cf1c f1        pop     af
cf1d f1        pop     af
cf1e 011ff1    ld      bc,0f11fh
cf21 f1        pop     af
cf22 f1        pop     af
cf23 1f        rra     
cf24 f1        pop     af
cf25 1f        rra     
cf26 011ff1    ld      bc,0f11fh
cf29 f1        pop     af
cf2a 1f        rra     
cf2b f1        pop     af
cf2c f1        pop     af
cf2d f1        pop     af
cf2e 011ff1    ld      bc,0f11fh
cf31 f1        pop     af
cf32 1f        rra     
cf33 f1        pop     af
cf34 f1        pop     af
cf35 1f        rra     
cf36 011ff1    ld      bc,0f11fh
cf39 f1        pop     af
cf3a f1        pop     af
cf3b f1        pop     af
cf3c f1        pop     af
cf3d f1        pop     af
cf3e 01f1f1    ld      bc,0f1f1h
cf41 f1        pop     af
cf42 f1        pop     af
cf43 f1        pop     af
cf44 f1        pop     af
cf45 1f        rra     
cf46 01f1f1    ld      bc,0f1f1h
cf49 f1        pop     af
cf4a f1        pop     af
cf4b f1        pop     af
cf4c f1        pop     af
cf4d f1        pop     af
cf4e 01f1f1    ld      bc,0f1f1h
cf51 1f        rra     
cf52 1f        rra     
cf53 1f        rra     
cf54 1f        rra     
cf55 f1        pop     af
cf56 01f1f1    ld      bc,0f1f1h
cf59 f1        pop     af
cf5a f1        pop     af
cf5b f1        pop     af
cf5c f1        pop     af
cf5d f1        pop     af
cf5e 01f1f1    ld      bc,0f1f1h
cf61 f1        pop     af
cf62 f1        pop     af
cf63 f1        pop     af
cf64 f1        pop     af
cf65 f1        pop     af
cf66 011ff1    ld      bc,0f11fh
cf69 f1        pop     af
cf6a f1        pop     af
cf6b f1        pop     af
cf6c f1        pop     af
cf6d 1f        rra     
cf6e 01f1f1    ld      bc,0f1f1h
cf71 f1        pop     af
cf72 f1        pop     af
cf73 f1        pop     af
cf74 f1        pop     af
cf75 f1        pop     af
cf76 01f1f1    ld      bc,0f1f1h
cf79 f1        pop     af
cf7a f1        pop     af
cf7b f1        pop     af
cf7c f1        pop     af
cf7d f1        pop     af
cf7e 01f1f1    ld      bc,0f1f1h
cf81 f1        pop     af
cf82 f1        pop     af
cf83 f1        pop     af
cf84 f1        pop     af
cf85 f1        pop     af
cf86 01f1f1    ld      bc,0f1f1h
cf89 f1        pop     af
cf8a f1        pop     af
cf8b 010101    ld      bc,0101h
cf8e 010101    ld      bc,0101h
cf91 010101    ld      bc,0101h
cf94 011f01    ld      bc,011fh
cf97 f1        pop     af
cf98 f1        pop     af
cf99 f1        pop     af
cf9a f1        pop     af
cf9b 010101    ld      bc,0101h
cf9e 0101f1    ld      bc,0f101h
cfa1 f1        pop     af
cfa2 1f        rra     
cfa3 f1        pop     af
cfa4 f1        pop     af
cfa5 1f        rra     
cfa6 01f1f1    ld      bc,0f1f1h
cfa9 f1        pop     af
cfaa 1f        rra     
cfab f1        pop     af
cfac f1        pop     af
cfad 1f        rra     
cfae 010101    ld      bc,0101h
cfb1 1f        rra     
cfb2 f1        pop     af
cfb3 f1        pop     af
cfb4 f1        pop     af
cfb5 1f        rra     
cfb6 01f1f1    ld      bc,0f1f1h
cfb9 f1        pop     af
cfba 1f        rra     
cfbb f1        pop     af
cfbc f1        pop     af
cfbd 1f        rra     
cfbe 010101    ld      bc,0101h
cfc1 1f        rra     
cfc2 f1        pop     af
cfc3 1f        rra     
cfc4 f1        pop     af
cfc5 1f        rra     
cfc6 01f1f1    ld      bc,0f1f1h
cfc9 f1        pop     af
cfca 1f        rra     
cfcb f1        pop     af
cfcc f1        pop     af
cfcd f1        pop     af
cfce 010101    ld      bc,0101h
cfd1 1f        rra     
cfd2 1f        rra     
cfd3 1f        rra     
cfd4 1f        rra     
cfd5 f1        pop     af
cfd6 1f        rra     
cfd7 f1        pop     af
cfd8 f1        pop     af
cfd9 f1        pop     af
cfda 1f        rra     
cfdb 1f        rra     
cfdc f1        pop     af
cfdd f1        pop     af
cfde 0101f1    ld      bc,0f101h
cfe1 01f1f1    ld      bc,0f1f1h
cfe4 f1        pop     af
cfe5 f1        pop     af
cfe6 0101f1    ld      bc,0f101h
cfe9 01f1f1    ld      bc,0f1f1h
cfec f1        pop     af
cfed f1        pop     af
cfee f1        pop     af
cfef f1        pop     af
cff0 f1        pop     af
cff1 f1        pop     af
cff2 f1        pop     af
cff3 f1        pop     af
cff4 f1        pop     af
cff5 f1        pop     af
cff6 01f1f1    ld      bc,0f1f1h
cff9 f1        pop     af
cffa f1        pop     af
cffb f1        pop     af
cffc f1        pop     af
cffd f1        pop     af
cffe 010101    ld      bc,0101h
d001 f1        pop     af
d002 1f        rra     
d003 1f        rra     
d004 1f        rra     
d005 1f        rra     
d006 010101    ld      bc,0101h
d009 1f        rra     
d00a f1        pop     af
d00b f1        pop     af
d00c f1        pop     af
d00d f1        pop     af
d00e 010101    ld      bc,0101h
d011 1f        rra     
d012 f1        pop     af
d013 f1        pop     af
d014 f1        pop     af
d015 1f        rra     
d016 010101    ld      bc,0101h
d019 1f        rra     
d01a 1f        rra     
d01b 1f        rra     
d01c 1f        rra     
d01d f1        pop     af
d01e f1        pop     af
d01f 01011f    ld      bc,1f01h
d022 1f        rra     
d023 f1        pop     af
d024 1f        rra     
d025 1f        rra     
d026 f1        pop     af
d027 01011f    ld      bc,1f01h
d02a 1f        rra     
d02b f1        pop     af
d02c f1        pop     af
d02d f1        pop     af
d02e 010101    ld      bc,0101h
d031 1f        rra     
d032 f1        pop     af
d033 1f        rra     
d034 f1        pop     af
d035 1f        rra     
d036 010101    ld      bc,0101h
d039 f1        pop     af
d03a 1f        rra     
d03b f1        pop     af
d03c f1        pop     af
d03d f1        pop     af
d03e 010101    ld      bc,0101h
d041 01f1f1    ld      bc,0f1f1h
d044 f1        pop     af
d045 1f        rra     
d046 010101    ld      bc,0101h
d049 01f1f1    ld      bc,0f1f1h
d04c f1        pop     af
d04d f1        pop     af
d04e 010101    ld      bc,0101h
d051 011f1f    ld      bc,1f1fh
d054 1f        rra     
d055 1f        rra     
d056 010101    ld      bc,0101h
d059 f1        pop     af
d05a f1        pop     af
d05b f1        pop     af
d05c f1        pop     af
d05d f1        pop     af
d05e 010101    ld      bc,0101h
d061 f1        pop     af
d062 f1        pop     af
d063 f1        pop     af
d064 f1        pop     af
d065 f1        pop     af
d066 f1        pop     af
d067 01011f    ld      bc,1f01h
d06a f1        pop     af
d06b f1        pop     af
d06c f1        pop     af
d06d 1f        rra     
d06e 01f1f1    ld      bc,0f1f1h
d071 f1        pop     af
d072 f1        pop     af
d073 f1        pop     af
d074 f1        pop     af
d075 f1        pop     af
d076 01f1f1    ld      bc,0f1f1h
d079 f1        pop     af
d07a f1        pop     af
d07b f1        pop     af
d07c f1        pop     af
d07d f1        pop     af
d07e 01f1f1    ld      bc,0f1f1h
d081 f1        pop     af
d082 f1        pop     af
d083 f1        pop     af
d084 f1        pop     af
d085 f1        pop     af
d086 01011f    ld      bc,1f01h
d089 010101    ld      bc,0101h
d08c 010101    ld      bc,0101h
d08f 010101    ld      bc,0101h
d092 010101    ld      bc,0101h
d095 010120    ld      bc,2001h
d098 2020      jr      nz,0d0bah
d09a 2020      jr      nz,0d0bch
d09c 2020      jr      nz,0d0beh
d09e 2020      jr      nz,0d0c0h
d0a0 2020      jr      nz,0d0c2h
d0a2 2020      jr      nz,0d0c4h
d0a4 2020      jr      nz,0d0c6h
d0a6 2020      jr      nz,0d0c8h
d0a8 2020      jr      nz,0d0cah
d0aa 2020      jr      nz,0d0cch
d0ac 2020      jr      nz,0d0ceh
d0ae 2020      jr      nz,0d0d0h
d0b0 2020      jr      nz,0d0d2h
d0b2 2020      jr      nz,0d0d4h
d0b4 2020      jr      nz,0d0d6h
d0b6 2020      jr      nz,0d0d8h
d0b8 2020      jr      nz,0d0dah
d0ba 2020      jr      nz,0d0dch
d0bc 2020      jr      nz,0d0deh
d0be 2020      jr      nz,0d0e0h
d0c0 2020      jr      nz,0d0e2h
d0c2 2020      jr      nz,0d0e4h
d0c4 2020      jr      nz,0d0e6h
d0c6 2020      jr      nz,0d0e8h
d0c8 2020      jr      nz,0d0eah
d0ca 2020      jr      nz,0d0ech
d0cc 2020      jr      nz,0d0eeh
d0ce 2020      jr      nz,0d0f0h
d0d0 2020      jr      nz,0d0f2h
d0d2 2020      jr      nz,0d0f4h
d0d4 2020      jr      nz,0d0f6h
d0d6 2020      jr      nz,0d0f8h
d0d8 2020      jr      nz,0d0fah
d0da 2020      jr      nz,0d0fch
d0dc 2020      jr      nz,0d0feh
d0de 2020      jr      nz,0d100h
d0e0 2020      jr      nz,0d102h
d0e2 2020      jr      nz,0d104h
d0e4 2020      jr      nz,0d106h
d0e6 2020      jr      nz,0d108h
d0e8 2020      jr      nz,0d10ah
d0ea 2020      jr      nz,0d10ch
d0ec 2020      jr      nz,0d10eh
d0ee 2020      jr      nz,0d110h
d0f0 2020      jr      nz,0d112h
d0f2 2020      jr      nz,0d114h
d0f4 2020      jr      nz,0d116h
d0f6 2020      jr      nz,0d118h
d0f8 2020      jr      nz,0d11ah
d0fa 2020      jr      nz,0d11ch
d0fc 2020      jr      nz,0d11eh
d0fe 2020      jr      nz,0d120h
d100 2020      jr      nz,0d122h
d102 2020      jr      nz,0d124h
d104 2020      jr      nz,0d126h
d106 2020      jr      nz,0d128h
d108 2020      jr      nz,0d12ah
d10a 2020      jr      nz,0d12ch
d10c 2020      jr      nz,0d12eh
d10e 2020      jr      nz,0d130h
d110 2020      jr      nz,0d132h
d112 2020      jr      nz,0d134h
d114 2020      jr      nz,0d136h
d116 2020      jr      nz,0d138h
d118 2020      jr      nz,0d13ah
d11a 2020      jr      nz,0d13ch
d11c 2020      jr      nz,0d13eh
d11e 2020      jr      nz,0d140h
d120 2020      jr      nz,0d142h
d122 2020      jr      nz,0d144h
d124 2020      jr      nz,0d146h
d126 2020      jr      nz,0d148h
d128 2020      jr      nz,0d14ah
d12a 2020      jr      nz,0d14ch
d12c 2020      jr      nz,0d14eh
d12e 2020      jr      nz,0d150h
d130 2020      jr      nz,0d152h
d132 2020      jr      nz,0d154h
d134 2020      jr      nz,0d156h
d136 2020      jr      nz,0d158h
d138 2020      jr      nz,0d15ah
d13a 2020      jr      nz,0d15ch
d13c 2020      jr      nz,0d15eh
d13e 2020      jr      nz,0d160h
d140 2020      jr      nz,0d162h
d142 2020      jr      nz,0d164h
d144 2020      jr      nz,0d166h
d146 2020      jr      nz,0d168h
d148 2020      jr      nz,0d16ah
d14a 2020      jr      nz,0d16ch
d14c 2020      jr      nz,0d16eh
d14e 2020      jr      nz,0d170h
d150 2020      jr      nz,0d172h
d152 2020      jr      nz,0d174h
d154 2020      jr      nz,0d176h
d156 2020      jr      nz,0d178h
d158 2020      jr      nz,0d17ah
d15a 2020      jr      nz,0d17ch
d15c 2020      jr      nz,0d17eh
d15e 2020      jr      nz,0d180h
d160 2020      jr      nz,0d182h
d162 2020      jr      nz,0d184h
d164 2020      jr      nz,0d186h
d166 2020      jr      nz,0d188h
d168 2020      jr      nz,0d18ah
d16a 2020      jr      nz,0d18ch
d16c 2020      jr      nz,0d18eh
d16e 2020      jr      nz,0d190h
d170 2020      jr      nz,0d192h
d172 2020      jr      nz,0d194h
d174 2020      jr      nz,0d196h
d176 2020      jr      nz,0d198h
d178 2020      jr      nz,0d19ah
d17a 2020      jr      nz,0d19ch
d17c 2020      jr      nz,0d19eh
d17e 2020      jr      nz,0d1a0h
d180 2020      jr      nz,0d1a2h
d182 2020      jr      nz,0d1a4h
d184 2020      jr      nz,0d1a6h
d186 2020      jr      nz,0d1a8h
d188 2020      jr      nz,0d1aah
d18a 2020      jr      nz,0d1ach
d18c 2020      jr      nz,0d1aeh
d18e 2020      jr      nz,0d1b0h
d190 2020      jr      nz,0d1b2h
d192 2020      jr      nz,0d1b4h
d194 2020      jr      nz,0d1b6h
d196 2020      jr      nz,0d1b8h
d198 2020      jr      nz,0d1bah
d19a 2020      jr      nz,0d1bch
d19c 2020      jr      nz,0d1beh
d19e 2020      jr      nz,0d1c0h
d1a0 2020      jr      nz,0d1c2h
d1a2 2020      jr      nz,0d1c4h
d1a4 2020      jr      nz,0d1c6h
d1a6 2020      jr      nz,0d1c8h
d1a8 2020      jr      nz,0d1cah
d1aa 2020      jr      nz,0d1cch
d1ac 2020      jr      nz,0d1ceh
d1ae 2020      jr      nz,0d1d0h
d1b0 2020      jr      nz,0d1d2h
d1b2 2020      jr      nz,0d1d4h
d1b4 2020      jr      nz,0d1d6h
d1b6 2020      jr      nz,0d1d8h
d1b8 2020      jr      nz,0d1dah
d1ba 2020      jr      nz,0d1dch
d1bc 2020      jr      nz,0d1deh
d1be 2020      jr      nz,0d1e0h
d1c0 2020      jr      nz,0d1e2h
d1c2 2020      jr      nz,0d1e4h
d1c4 2020      jr      nz,0d1e6h
d1c6 2020      jr      nz,0d1e8h
d1c8 2020      jr      nz,0d1eah
d1ca 2020      jr      nz,0d1ech
d1cc 2020      jr      nz,0d1eeh
d1ce 2020      jr      nz,0d1f0h
d1d0 2020      jr      nz,0d1f2h
d1d2 2020      jr      nz,0d1f4h
d1d4 2020      jr      nz,0d1f6h
d1d6 2020      jr      nz,0d1f8h
d1d8 2020      jr      nz,0d1fah
d1da 2020      jr      nz,0d1fch
d1dc 2020      jr      nz,0d1feh
d1de 2020      jr      nz,0d200h
d1e0 2020      jr      nz,0d202h
d1e2 2020      jr      nz,0d204h
d1e4 2020      jr      nz,0d206h
d1e6 2020      jr      nz,0d208h
d1e8 2020      jr      nz,0d20ah
d1ea 2020      jr      nz,0d20ch
d1ec 2020      jr      nz,0d20eh
d1ee 2020      jr      nz,0d210h
d1f0 2020      jr      nz,0d212h
d1f2 2020      jr      nz,0d214h
d1f4 2020      jr      nz,0d216h
d1f6 2020      jr      nz,0d218h
d1f8 2020      jr      nz,0d21ah
d1fa 2020      jr      nz,0d21ch
d1fc 2020      jr      nz,0d21eh
d1fe 2020      jr      nz,0d220h
d200 2020      jr      nz,0d222h
d202 2020      jr      nz,0d224h
d204 2020      jr      nz,0d226h
d206 2020      jr      nz,0d228h
d208 2020      jr      nz,0d22ah
d20a 2020      jr      nz,0d22ch
d20c 2020      jr      nz,0d22eh
d20e 2020      jr      nz,0d230h
d210 2020      jr      nz,0d232h
d212 2020      jr      nz,0d234h
d214 2020      jr      nz,0d236h
d216 2020      jr      nz,0d238h
d218 2020      jr      nz,0d23ah
d21a 2020      jr      nz,0d23ch
d21c 2020      jr      nz,0d23eh
d21e 2020      jr      nz,0d240h
d220 2020      jr      nz,0d242h
d222 2020      jr      nz,0d244h
d224 2020      jr      nz,0d246h
d226 2020      jr      nz,0d248h
d228 2020      jr      nz,0d24ah
d22a 2020      jr      nz,0d24ch
d22c 2020      jr      nz,0d24eh
d22e 2020      jr      nz,0d250h
d230 2020      jr      nz,0d252h
d232 2020      jr      nz,0d254h
d234 2020      jr      nz,0d256h
d236 2020      jr      nz,0d258h
d238 2020      jr      nz,0d25ah
d23a 2020      jr      nz,0d25ch
d23c 2020      jr      nz,0d25eh
d23e 2020      jr      nz,0d260h
d240 2020      jr      nz,0d262h
d242 2020      jr      nz,0d264h
d244 2020      jr      nz,0d266h
d246 2020      jr      nz,0d268h
d248 2020      jr      nz,0d26ah
d24a 2020      jr      nz,0d26ch
d24c 2020      jr      nz,0d26eh
d24e 2020      jr      nz,0d270h
d250 2020      jr      nz,0d272h
d252 2020      jr      nz,0d274h
d254 2020      jr      nz,0d276h
d256 2020      jr      nz,0d278h
d258 2020      jr      nz,0d27ah
d25a 2020      jr      nz,0d27ch
d25c 2020      jr      nz,0d27eh
d25e 2020      jr      nz,0d280h
d260 2020      jr      nz,0d282h
d262 2020      jr      nz,0d284h
d264 2020      jr      nz,0d286h
d266 2020      jr      nz,0d288h
d268 2020      jr      nz,0d28ah
d26a 2020      jr      nz,0d28ch
d26c 2020      jr      nz,0d28eh
d26e 2020      jr      nz,0d290h
d270 2020      jr      nz,0d292h
d272 2020      jr      nz,0d294h
d274 2020      jr      nz,0d296h
d276 2020      jr      nz,0d298h
d278 2020      jr      nz,0d29ah
d27a 2020      jr      nz,0d29ch
d27c 2020      jr      nz,0d29eh
d27e 2020      jr      nz,0d2a0h
d280 2020      jr      nz,0d2a2h
d282 2020      jr      nz,0d2a4h
d284 2020      jr      nz,0d2a6h
d286 2020      jr      nz,0d2a8h
d288 2020      jr      nz,0d2aah
d28a 2020      jr      nz,0d2ach
d28c 2020      jr      nz,0d2aeh
d28e 2020      jr      nz,0d2b0h
d290 2020      jr      nz,0d2b2h
d292 2020      jr      nz,0d2b4h
d294 2020      jr      nz,0d2b6h
d296 2020      jr      nz,0d2b8h
d298 2020      jr      nz,0d2bah
d29a 2020      jr      nz,0d2bch
d29c 2020      jr      nz,0d2beh
d29e 2020      jr      nz,0d2c0h
d2a0 2020      jr      nz,0d2c2h
d2a2 2020      jr      nz,0d2c4h
d2a4 2020      jr      nz,0d2c6h
d2a6 2020      jr      nz,0d2c8h
d2a8 2020      jr      nz,0d2cah
d2aa 2020      jr      nz,0d2cch
d2ac 2020      jr      nz,0d2ceh
d2ae 2020      jr      nz,0d2d0h
d2b0 2020      jr      nz,0d2d2h
d2b2 2020      jr      nz,0d2d4h
d2b4 2020      jr      nz,0d2d6h
d2b6 2020      jr      nz,0d2d8h
d2b8 2020      jr      nz,0d2dah
d2ba 2020      jr      nz,0d2dch
d2bc 2020      jr      nz,0d2deh
d2be 2020      jr      nz,0d2e0h
d2c0 2020      jr      nz,0d2e2h
d2c2 2020      jr      nz,0d2e4h
d2c4 2020      jr      nz,0d2e6h
d2c6 2020      jr      nz,0d2e8h
d2c8 2020      jr      nz,0d2eah
d2ca 2020      jr      nz,0d2ech
d2cc 2020      jr      nz,0d2eeh
d2ce 2020      jr      nz,0d2f0h
d2d0 2020      jr      nz,0d2f2h
d2d2 2020      jr      nz,0d2f4h
d2d4 2020      jr      nz,0d2f6h
d2d6 2020      jr      nz,0d2f8h
d2d8 2020      jr      nz,0d2fah
d2da 2020      jr      nz,0d2fch
d2dc 2020      jr      nz,0d2feh
d2de 2020      jr      nz,0d300h
d2e0 2020      jr      nz,0d302h
d2e2 2020      jr      nz,0d304h
d2e4 2020      jr      nz,0d306h
d2e6 2020      jr      nz,0d308h
d2e8 2020      jr      nz,0d30ah
d2ea 2020      jr      nz,0d30ch
d2ec 2020      jr      nz,0d30eh
d2ee 2020      jr      nz,0d310h
d2f0 2020      jr      nz,0d312h
d2f2 2020      jr      nz,0d314h
d2f4 2020      jr      nz,0d316h
d2f6 2020      jr      nz,0d318h
d2f8 2020      jr      nz,0d31ah
d2fa 2020      jr      nz,0d31ch
d2fc 2020      jr      nz,0d31eh
d2fe 2020      jr      nz,0d320h
d300 2020      jr      nz,0d322h
d302 2020      jr      nz,0d324h
d304 2020      jr      nz,0d326h
d306 2020      jr      nz,0d328h
d308 2020      jr      nz,0d32ah
d30a 2020      jr      nz,0d32ch
d30c 2020      jr      nz,0d32eh
d30e 2020      jr      nz,0d330h
d310 2020      jr      nz,0d332h
d312 2020      jr      nz,0d334h
d314 2020      jr      nz,0d336h
d316 2020      jr      nz,0d338h
d318 2020      jr      nz,0d33ah
d31a 2020      jr      nz,0d33ch
d31c 2020      jr      nz,0d33eh
d31e 2020      jr      nz,0d340h
d320 2020      jr      nz,0d342h
d322 2020      jr      nz,0d344h
d324 2020      jr      nz,0d346h
d326 2020      jr      nz,0d348h
d328 2020      jr      nz,0d34ah
d32a 2020      jr      nz,0d34ch
d32c 2020      jr      nz,0d34eh
d32e 2020      jr      nz,0d350h
d330 2020      jr      nz,0d352h
d332 2020      jr      nz,0d354h
d334 2020      jr      nz,0d356h
d336 2020      jr      nz,0d358h
d338 2020      jr      nz,0d35ah
d33a 2020      jr      nz,0d35ch
d33c 2020      jr      nz,0d35eh
d33e 2020      jr      nz,0d360h
d340 2020      jr      nz,0d362h
d342 2020      jr      nz,0d364h
d344 2020      jr      nz,0d366h
d346 2020      jr      nz,0d368h
d348 2020      jr      nz,0d36ah
d34a 2020      jr      nz,0d36ch
d34c 2020      jr      nz,0d36eh
d34e 2020      jr      nz,0d370h
d350 2020      jr      nz,0d372h
d352 2020      jr      nz,0d374h
d354 2020      jr      nz,0d376h
d356 2020      jr      nz,0d378h
d358 2020      jr      nz,0d37ah
d35a 2020      jr      nz,0d37ch
d35c 2020      jr      nz,0d37eh
d35e 2020      jr      nz,0d380h
d360 2020      jr      nz,0d382h
d362 2020      jr      nz,0d384h
d364 2020      jr      nz,0d386h
d366 2020      jr      nz,0d388h
d368 2020      jr      nz,0d38ah
d36a 2020      jr      nz,0d38ch
d36c 2020      jr      nz,0d38eh
d36e 2020      jr      nz,0d390h
d370 2020      jr      nz,0d392h
d372 2020      jr      nz,0d394h
d374 2020      jr      nz,0d396h
d376 2020      jr      nz,0d398h
d378 2020      jr      nz,0d39ah
d37a 2020      jr      nz,0d39ch
d37c 2020      jr      nz,0d39eh
d37e 2020      jr      nz,0d3a0h
d380 2020      jr      nz,0d3a2h
d382 2020      jr      nz,0d3a4h
d384 2020      jr      nz,0d3a6h
d386 2020      jr      nz,0d3a8h
d388 2020      jr      nz,0d3aah
d38a 2020      jr      nz,0d3ach
d38c 2020      jr      nz,0d3aeh
d38e 2020      jr      nz,0d3b0h
d390 2020      jr      nz,0d3b2h
d392 2020      jr      nz,0d3b4h
d394 2020      jr      nz,0d3b6h
d396 2000      jr      nz,0d398h

