;;===============================
;;Name: Antonio Calabrese
;;===============================

.orig x3000
LD R0, U		;GET THE VALUE THAT WE WANT TO TAKE THE ABSOLUTE VALUE OF
BRZP SKIP		;IF THE VALUE ISN'T NEGATIVE SKIP THE NEGATION PROCESS
NOT R0, R0		;FLIP THE BITS AND THEN ADD ONE TO NEGATE THE NEGATIVE NUMBER
ADD R0, R0, 1
SKIP
ST R0, ANSWER	;FINISH BY PUTTING THE NUMBER BACK IN THE RIGHT ADDRESS

U       .fill -8
ANSWER  .fill 0
.end
