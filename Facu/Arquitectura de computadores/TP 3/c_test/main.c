#include <avr/io.h>

int main() {
  char a=0x01;
  // Write your code here
  DDRD |= (1<<1) |(1<<5) ;
  TCCR0A = 0b00010000 ;
  TCCR0B = 0b00000101 ;
  OCR0B = 128;
  while (1)
  { ;
    while ((TIFR0&a) == 0x01)
    {
      PORTD ^= 0x02;
      XXXXXXXXXXXX
    }
}
  return 0;
}
