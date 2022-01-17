#line 1 "C:/Users/Amogh/OneDrive - vit.ac.in/Documents/MC_LAB/Projects/Single traffic light/mikroC/MyProject.c"

void countSec(int count){
 while (count != 0)
 {
 P1 = Dec2Bcd(count);
 delay_ms(1000);
 count--;

 }

}

void setRed(){
 while (1)
 {
 P2.B1 = 0;
 P2.B0 = 1;
 countSec(20);
 P2.B0 = 0;
 P2.B2 = 1;
 countSec(10);
 P2.B2 = 0;
 P2.B1 = 1;
 countSec(10);

 }
}

void setOrange(){
 while (1)
 {
 P2.B2 = 0;
 P2.B1 = 1;
 countSec(10);
 P2.B1 = 0;
 P2.B0 = 1;
 countSec(20);
 P2.B0 = 0;
 P2.B2 = 1;
 countSec(10);

 }
}

void setGreen(){
 while (1)
 {
 P2.B0 = 0;
 P2.B2 = 1;
 countSec(10);
 P2.B2 = 0;
 P2.B1 = 1;
 countSec(20);
 P2.B1 = 0;
 P2.B0 = 1;
 countSec(10);

 }
}

void setDisplay(){
 char color;
 color = UART1_READ();
 switch (color)
 {
 case 'r':
 setRed();
 break;
 case 'o':
 setOrange();
 break;
 case 'g':
 setGreen();
 break;
 default:
 UART1_WRITE_TEXT(" \r\n Invalid key! \r\n");
 break;
 }
}

void countAndCheck(int count){
 while (count != 0)
 {
 P1 = Dec2Bcd(count);
 delay_ms(1000);
 count--;

 if (UART1_DATA_READY())
 {
 break;
 }

 }

 if (UART1_DATA_READY())
 {
 P2.B0 = 0;
 P2.B1 = 0;
 P2.B2 = 0;
 setDisplay();
 }
}

void main() {


 P1 = 0;
 P2.B0 = 0;
 P2.B1 = 0;
 P2.B2 = 0;

 UART1_INIT(9600);
 PCON.SMOD = 0;
 UART1_WRITE_TEXT("System is ready. \r\n ");
 UART1_WRITE_TEXT("R RED, ");
 UART1_WRITE_TEXT("O ORANGE, ");
 UART1_WRITE_TEXT("G GREEN\r\n");

 while (1)
 {
 P2.B0 = 0;
 P2.B2 = 1;
 countAndCheck(10);
 P2.B2 = 0;
 P2.B1 = 1;
 countAndCheck(10);
 P2.B1 = 0;
 P2.B0 = 1;
 countAndCheck(20);

 }



}
