/*
 * main.c
 */

#include <msp430.h>
#include "mylib.h"

int main(void) {
    WDTCTL = WDTPW | WDTHOLD;	// Stop watchdog timer

    P1DIR |= BIT0;	// P1.0 to output
    P1OUT &= ~BIT0;	// P1.0 to 'low'

    int num0 = -2, num1 = 2;

    /* use of the add from the assembly file from 'mylib' */
    int numAdd = add(num0, num1);

    /* use of the subtract from the assembly file from 'mylib' */
    int numSub = subtract(num0, num1);
	
	while(1){
		/* just using numAdd and numSub to do something */
		if(numAdd > numSub){
			P1OUT |= BIT0;
		}
	}
}
