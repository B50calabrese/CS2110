;;===============================
;;Name:
;;===============================

.orig x3000
		LD R0, U 		;THE FIRST REGISTER WILL CONTAIN OUR U
		AND R2, R2, 0	;CLEAR OUT R1, THIS WILL REPRESENT T
		LD R1, V		;THE THIRD REGISTER WILL BE V

LOOP	BRNZ OLOOP		;GET OUT OF LOOP IF THE REMAINDER IS 0
		AND R2, R2, 0	;CLEAR THE REGISTER BEFORE ASSIGNMENT
		ADD R2, R1, 0	;SET THE VALUE OF T TO V
		JSR UDIV		;DO MODOLUS SUBROUTINE
		AND R0, R0, 0 	;CLEAR OUT U BEFORE ASSIGNMENT
		ADD R0, R2, 0	;SET U TO T
		ADD R1, R1, 0	;SET CONDITION CODES WITH V
		BR LOOP			;GO BACK TO START OF ALGORITHM


OLOOP 	ST R0, ANSWER 	;RETURN THE ANSWER BY STORING IT BACK IN
HALT

U       .fill 12
V       .fill 4
ANSWER  .fill 0

UDIV
.fill x0042
.fill x1DBB
.fill x7F84
.fill x7B83
.fill x7982
.fill x7781
.fill x7580
.fill xEA2E
.fill x947F
.fill x14A1
.fill x56E0
.fill x16FF
.fill x16E1
.fill x1943
.fill x7500
.fill x1482
.fill x09FB
.fill x5260
.fill x1943
.fill x6500
.fill x1480
.fill x0804
.fill x10A0
.fill x1930
.fill x6500
.fill x1242
.fill x16FF
.fill x07F6
.fill x1460
.fill x1220
.fill x10A0
.fill x6580
.fill x6781
.fill x6982
.fill x6B83
.fill x6F84
.fill x1DA5
.fill xC1C0
.fill x0001
.fill x0002
.fill x0004
.fill x0008
.fill x0010
.fill x0020
.fill x0040
.fill x0080
.fill x0100
.fill x0200
.fill x0400
.fill x0800
.fill x1000
.fill x2000
.fill x4000
.fill x8000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.fill x0000
.end

