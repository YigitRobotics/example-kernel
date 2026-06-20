#define VGA_BUFFER ((volatile unsigned char*)0xB8000)

void yazdir(char *text, int x_ekseni, int y_ekseni) {
   int index = y_ekseni * 80 + x_ekseni; // 80x25 ekran için 

   for (int i = 0; text[i] != '\0'; i++) {
      VGA_BUFFER[(i + index) * 2] = text[i];
      VGA_BUFFER[(i + index) * 2 + 1] = 0x07; // gri renk ascii
   }
}


void kernel_main(void) {
   yazdir("GitHub: YigitRobotics", 1, 1);

   while (1)
   {
     
   }
   
}
