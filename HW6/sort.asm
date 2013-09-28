;;===============================
;;Name: Antonio Calabrese
;;===============================

.orig x3000

		LEA R7, ARRAY	;THIS IS OUR POINTER TO THE ARRAY
		LD 	R6, LENGTH 	;THIS IS THE LENGTH OF OUR ARRAY USED FOR COMPARISONS IT ALWAYS IS NEGATIVE
		NOT R6, R6
		ADD R6, R6, 1 	;IN THE ALGORITHM THE TWO TIMES WE USE LENGTH, IT IS ADVANTAGEOUS FOR IT TO BE NEGATIVE

		AND R0, R0, 0	;CLEAR R0 FOR K OUR COUNTER OF THE OUTER LOOP

OLOOP	ADD R1, R0, R6	;SETTING THE CONDITION CODE FOR K - LENGTH

		BRZP OOUT		;IF K-LENGTH>=0 THEN THE LOOP WILL BREAK

		AND R2, R2, 0	;THIS IS THE INNER LOOP COUNTER I

ILOOP	AND R1, R1, 0	;THIS REPRESENTS IF THE LIST IS SORTED

		ADD R3, R2, R0 	;ADD I AND K
		ADD R3, R3, R6	;THIS IS NOW I + K - LENGTH SETTING THE CONDITION CODE FOR THE INNER LOOP TERMINATION

		BRZP IOUT		;IF I + K - LENGTH >= 0 GET OUT OF INNER LOOP

		;;THIS IS THE INNER IF STATEMENT
		AND R3, R3, 0	;THE ADDRESS OF ARRAY[I] WILL BE STORED HERE THEN THE ACTUAL DATA WILL BE PLACED THERE
		ADD R3, R7, 0
		ADD R3, R3, R2	;THIS NOW CONTAINS THE ADDRESS OF ARRAY[I]

		LDR R4, R3, -1 	;THIS CONTAINS THE DATA AT ARRAY[I-1]
		LDR R3, R3, 0	;THIS CONTAINS THE DATA AT ARRAY[I]

		ADD R5, R4, 0	;THIS WILL HAVE -ARRAY[I-1]
		NOT R5, R5		;NEGATION OF ARRAY[I-1]
		ADD R5, R5, 1
		ADD R5, R3, R5	;THIS SETS THE CONDITION CODES FOR ARRAY[I] - ARRAY[I-1]

		BRZP NIF		;IF ARRAY[I]>=ARRAY[I-1] THEN SKIP THE SWAP OF DATA

		ADD R5, R7, 0	;R5 NOW CONTAINS THE ADDRESS OF THE ARRAY
		ADD R5, R2, 0	;R5 IS LENGTH + I WE CAN NOW REFERENCE THE LOCATIONS IN THE ARRAY

		STR R3, R5, -1 	;ADDRESS POSITION LENGTH + I - 1 = ARRAY[I]
		STR R4, R5, 0	;ADDRESS POSITION LENGTH + I = ARRAY[I-1]
		;;THIS IS THE END OF THE IF STATEMENT


NIF		ADD R2, R2, 1 	;INCREMENTING I
		BR ILOOP

IOUT  	ADD R1, R1, 0	;SET THE CONDITION CODE TO TEST SORTED
		BRNP OOUT		;IF IT IS SORTED BREAK THE SORTING ALGORITHM AND END

		ADD R0, R0, 1 	;INCREMENT K
		BR OLOOP		;GO BACK TO THE BEGINNING OF THE LOOP TO TEST IF THE FOR LOOP WILL BREAK

OOUT	HALT

ARRAY   .fill x6000
LENGTH  .fill 10
ANSWER  .fill 0
.end

.orig x6000
.fill 8
.fill 4
.fill 7
.fill 0
.fill -3
.fill 11
.fill 5
.fill 9
.fill 2
.fill 4
.end
