
_countSec:
;MyProject.c,2 :: 		void countSec(int count){
;MyProject.c,3 :: 		while (count != 0)
L_countSec0:
	MOV A, FARG_countSec_count+0
	ORL A, FARG_countSec_count+1
	JZ L_countSec1
;MyProject.c,5 :: 		P1 = Dec2Bcd(count);
	MOV FARG_Dec2Bcd_decnum+0, FARG_countSec_count+0
	LCALL _Dec2Bcd+0
	MOV P1+0, 0
;MyProject.c,6 :: 		delay_ms(1000);
	MOV R5, 8
	MOV R6, 1
	MOV R7, 245
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;MyProject.c,7 :: 		count--;
	CLR C
	MOV A, FARG_countSec_count+0
	SUBB A, #1
	MOV FARG_countSec_count+0, A
	MOV A, FARG_countSec_count+1
	SUBB A, #0
	MOV FARG_countSec_count+1, A
;MyProject.c,9 :: 		}
	SJMP L_countSec0
L_countSec1:
;MyProject.c,11 :: 		}
	RET
; end of _countSec

_setRed:
;MyProject.c,13 :: 		void setRed(){
;MyProject.c,14 :: 		while (1)
L_setRed2:
;MyProject.c,16 :: 		P2.B1 = 0;
	CLR P2+0
;MyProject.c,17 :: 		P2.B0 = 1;
	SETB P2+0
;MyProject.c,18 :: 		countSec(20);
	MOV FARG_countSec_count+0, #20
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,19 :: 		P2.B0 = 0;
	CLR P2+0
;MyProject.c,20 :: 		P2.B2 = 1;
	SETB P2+0
;MyProject.c,21 :: 		countSec(10);
	MOV FARG_countSec_count+0, #10
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,22 :: 		P2.B2 = 0;
	CLR P2+0
;MyProject.c,23 :: 		P2.B1 = 1;
	SETB P2+0
;MyProject.c,24 :: 		countSec(10);
	MOV FARG_countSec_count+0, #10
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,26 :: 		}
	SJMP L_setRed2
;MyProject.c,27 :: 		}
	RET
; end of _setRed

_setOrange:
;MyProject.c,29 :: 		void setOrange(){
;MyProject.c,30 :: 		while (1)
L_setOrange4:
;MyProject.c,32 :: 		P2.B2 = 0;
	CLR P2+0
;MyProject.c,33 :: 		P2.B1 = 1;
	SETB P2+0
;MyProject.c,34 :: 		countSec(10);
	MOV FARG_countSec_count+0, #10
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,35 :: 		P2.B1 = 0;
	CLR P2+0
;MyProject.c,36 :: 		P2.B0 = 1;
	SETB P2+0
;MyProject.c,37 :: 		countSec(20);
	MOV FARG_countSec_count+0, #20
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,38 :: 		P2.B0 = 0;
	CLR P2+0
;MyProject.c,39 :: 		P2.B2 = 1;
	SETB P2+0
;MyProject.c,40 :: 		countSec(10);
	MOV FARG_countSec_count+0, #10
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,42 :: 		}
	SJMP L_setOrange4
;MyProject.c,43 :: 		}
	RET
; end of _setOrange

_setGreen:
;MyProject.c,45 :: 		void setGreen(){
;MyProject.c,46 :: 		while (1)
L_setGreen6:
;MyProject.c,48 :: 		P2.B0 = 0;
	CLR P2+0
;MyProject.c,49 :: 		P2.B2 = 1;
	SETB P2+0
;MyProject.c,50 :: 		countSec(10);
	MOV FARG_countSec_count+0, #10
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,51 :: 		P2.B2 = 0;
	CLR P2+0
;MyProject.c,52 :: 		P2.B1 = 1;
	SETB P2+0
;MyProject.c,53 :: 		countSec(10);
	MOV FARG_countSec_count+0, #10
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,54 :: 		P2.B1 = 0;
	CLR P2+0
;MyProject.c,55 :: 		P2.B0 = 1;
	SETB P2+0
;MyProject.c,56 :: 		countSec(20);
	MOV FARG_countSec_count+0, #20
	MOV FARG_countSec_count+1, #0
	LCALL _countSec+0
;MyProject.c,58 :: 		}
	SJMP L_setGreen6
;MyProject.c,59 :: 		}
	RET
; end of _setGreen

_setDisplay:
;MyProject.c,61 :: 		void setDisplay(){
;MyProject.c,63 :: 		color = UART1_READ();
	LCALL _UART1_Read+0
	MOV setDisplay_color_L0+0, 0
;MyProject.c,64 :: 		switch (color)
	SJMP L_setDisplay8
;MyProject.c,66 :: 		case 'r':
L_setDisplay10:
;MyProject.c,67 :: 		setRed();
	LCALL _setRed+0
;MyProject.c,68 :: 		break;
	SJMP L_setDisplay9
;MyProject.c,69 :: 		case 'o':
L_setDisplay11:
;MyProject.c,70 :: 		setOrange();
	LCALL _setOrange+0
;MyProject.c,71 :: 		break;
	SJMP L_setDisplay9
;MyProject.c,72 :: 		case 'g':
L_setDisplay12:
;MyProject.c,73 :: 		setGreen();
	LCALL _setGreen+0
;MyProject.c,74 :: 		break;
	SJMP L_setDisplay9
;MyProject.c,75 :: 		default:
L_setDisplay13:
;MyProject.c,76 :: 		UART1_WRITE_TEXT(" \r\n Invalid key! \r\n");
	MOV FARG_UART1_Write_Text_uart_text+0, #?lstr1_MyProject+0
	LCALL _UART1_Write_Text+0
;MyProject.c,77 :: 		break;
	SJMP L_setDisplay9
;MyProject.c,78 :: 		}
L_setDisplay8:
	MOV A, setDisplay_color_L0+0
	XRL A, #114
	JZ L_setDisplay10
	MOV A, setDisplay_color_L0+0
	XRL A, #111
	JZ L_setDisplay11
	MOV A, setDisplay_color_L0+0
	XRL A, #103
	JZ L_setDisplay12
	SJMP L_setDisplay13
L_setDisplay9:
;MyProject.c,79 :: 		}
	RET
; end of _setDisplay

_countAndCheck:
;MyProject.c,81 :: 		void countAndCheck(int count){
;MyProject.c,82 :: 		while (count != 0)
L_countAndCheck14:
	MOV A, FARG_countAndCheck_count+0
	ORL A, FARG_countAndCheck_count+1
	JZ L_countAndCheck15
;MyProject.c,84 :: 		P1 = Dec2Bcd(count);
	MOV FARG_Dec2Bcd_decnum+0, FARG_countAndCheck_count+0
	LCALL _Dec2Bcd+0
	MOV P1+0, 0
;MyProject.c,85 :: 		delay_ms(1000);
	MOV R5, 8
	MOV R6, 1
	MOV R7, 245
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;MyProject.c,86 :: 		count--;
	CLR C
	MOV A, FARG_countAndCheck_count+0
	SUBB A, #1
	MOV FARG_countAndCheck_count+0, A
	MOV A, FARG_countAndCheck_count+1
	SUBB A, #0
	MOV FARG_countAndCheck_count+1, A
;MyProject.c,88 :: 		if (UART1_DATA_READY())
	LCALL _UART1_Data_Ready+0
	MOV A, R0
	JZ L_countAndCheck16
;MyProject.c,90 :: 		break;
	SJMP L_countAndCheck15
;MyProject.c,91 :: 		}
L_countAndCheck16:
;MyProject.c,93 :: 		}
	SJMP L_countAndCheck14
L_countAndCheck15:
;MyProject.c,95 :: 		if (UART1_DATA_READY())
	LCALL _UART1_Data_Ready+0
	MOV A, R0
	JZ L_countAndCheck17
;MyProject.c,97 :: 		P2.B0 = 0;
	CLR P2+0
;MyProject.c,98 :: 		P2.B1 = 0;
	CLR P2+0
;MyProject.c,99 :: 		P2.B2 = 0;
	CLR P2+0
;MyProject.c,100 :: 		setDisplay();
	LCALL _setDisplay+0
;MyProject.c,101 :: 		}
L_countAndCheck17:
;MyProject.c,102 :: 		}
	RET
; end of _countAndCheck

_main:
	MOV SP+0, #128
;MyProject.c,104 :: 		void main() {
;MyProject.c,106 :: 		P1 = 0;
	MOV P1+0, #0
;MyProject.c,107 :: 		P2.B0 = 0;
	CLR P2+0
;MyProject.c,108 :: 		P2.B1 = 0;
	CLR P2+0
;MyProject.c,109 :: 		P2.B2 = 0;
	CLR P2+0
;MyProject.c,111 :: 		UART1_INIT(9600);
	MOV TH1+0, #253
	MOV TL1+0, #253
	LCALL _UART1_Init+0
;MyProject.c,112 :: 		PCON.SMOD = 0;
	CLR C
	MOV A, PCON+0
	MOV #224, C
	MOV PCON+0, A
;MyProject.c,113 :: 		UART1_WRITE_TEXT("System is ready. \r\n ");
	MOV FARG_UART1_Write_Text_uart_text+0, #?lstr2_MyProject+0
	LCALL _UART1_Write_Text+0
;MyProject.c,114 :: 		UART1_WRITE_TEXT("R RED, ");
	MOV FARG_UART1_Write_Text_uart_text+0, #?lstr3_MyProject+0
	LCALL _UART1_Write_Text+0
;MyProject.c,115 :: 		UART1_WRITE_TEXT("O ORANGE, ");
	MOV FARG_UART1_Write_Text_uart_text+0, #?lstr4_MyProject+0
	LCALL _UART1_Write_Text+0
;MyProject.c,116 :: 		UART1_WRITE_TEXT("G GREEN\r\n");
	MOV FARG_UART1_Write_Text_uart_text+0, #?lstr5_MyProject+0
	LCALL _UART1_Write_Text+0
;MyProject.c,118 :: 		while (1)
L_main18:
;MyProject.c,120 :: 		P2.B2 = 0;
	CLR P2+0
;MyProject.c,121 :: 		P2.B1 = 1;
	SETB P2+0
;MyProject.c,122 :: 		countAndCheck(10);
	MOV FARG_countAndCheck_count+0, #10
	MOV FARG_countAndCheck_count+1, #0
	LCALL _countAndCheck+0
;MyProject.c,123 :: 		P2.B1 = 0;
	CLR P2+0
;MyProject.c,124 :: 		P2.B0 = 1;
	SETB P2+0
;MyProject.c,125 :: 		countAndCheck(20);
	MOV FARG_countAndCheck_count+0, #20
	MOV FARG_countAndCheck_count+1, #0
	LCALL _countAndCheck+0
;MyProject.c,126 :: 		P2.B0 = 0;
	CLR P2+0
;MyProject.c,127 :: 		P2.B2 = 1;
	SETB P2+0
;MyProject.c,128 :: 		countAndCheck(10);
	MOV FARG_countAndCheck_count+0, #10
	MOV FARG_countAndCheck_count+1, #0
	LCALL _countAndCheck+0
;MyProject.c,130 :: 		}
	SJMP L_main18
;MyProject.c,134 :: 		}
	SJMP #254
; end of _main
