
void countSec(int count){
    while (count != 0)
    {
        P1 = Dec2Bcd(count);
        delay_ms(1000);
        count--;
        
    }   

}

void setRed(){ // This function enables the red signal when requested by the user and then the system continues to operate normally
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

void setOrange(){ // This function enables the orange signal when requested by the user and then the system continues to operate normally
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

void setGreen(){ // This function enables the green signal when requested by the user and then the system continues to operate normally
    while (1)
    {
        P2.B0 = 0;
        P2.B2 = 1;
        countSec(10);
        P2.B2 = 0;
        P2.B1 = 1;
        countSec(10);
        P2.B1 = 0;
        P2.B0 = 1;
        countSec(20);
            
    }
}

void setDisplay(){
    char color;
    color = UART1_READ(); // Read the data received via UART
    switch (color)
    {
    case 'r':
        setRed(); // If the received character is 'r' then enable the red light
        break;
    case 'o':
        setOrange(); // If the received character is 'o' then enable the orange light
        break;
    case 'g':
        setGreen(); // If the received character is 'g' then enable the green light
        break;    
    default:
        UART1_WRITE_TEXT(" \r\n Invalid key! \r\n"); // Else send a message that the user has entered an invalid key
        break;
    }
}

void countAndCheck(int count){
    while (count != 0)
    {
        P1 = Dec2Bcd(count); // Converting the count to BCD and displaying it on the 7-segment display
        delay_ms(1000); // Generating a delay of 1 second
        count--; // Decrementing the count by 1

        if (UART1_DATA_READY()) // Checking whether some data is received at the serial port
        {
            break; // Exit the loop if some data is received
        }
        
    }   

    if (UART1_DATA_READY())
        {
            P2.B0 = 0;
            P2.B1 = 0;
            P2.B2 = 0;
            setDisplay(); // If some data is received at the serial port then disable all the lights and call the setDisplay() function
        }
}

void main() {

    // Clearing the ports, to which the Traffic Lights and the 7-Segment BCD Display are connected:
    P1 = 0;
    P2.B0 = 0;
    P2.B1 = 0;
    P2.B2 = 0;

    UART1_INIT(9600); // Initialising UART with a Baud rate of 9600
    PCON.SMOD = 0;
    UART1_WRITE_TEXT("System is ready. \r\n "); // Sending some messages to the virtual terminal via UART
    UART1_WRITE_TEXT("R RED, ");
    UART1_WRITE_TEXT("O ORANGE, ");
    UART1_WRITE_TEXT("G GREEN\r\n");

    while (1) // This loop is for the automatic operation of the system
    {
        P2.B0 = 0;
        P2.B2 = 1; // Disabling the red light and enabling the green light
        countAndCheck(10); // The signal stays for 10 seconds and the timing is displayed on the 7-segment display
        P2.B2 = 0;
        P2.B1 = 1; // Disabling the green light and enabling the orange light
        countAndCheck(10);
        P2.B1 = 0;
        P2.B0 = 1; // Disabling the orange light and enabling the red light
        countAndCheck(20);
            
    }

 
   
}