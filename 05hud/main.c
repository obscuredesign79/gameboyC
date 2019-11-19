#include <gb/gb.h>
#include "bgMap.c"
#include "bgTiles.c"
#include <gb/font.h>

void main(){
    font_t min_font;

    font_init();
    min_font = font_load(font_min);
    font_set(min_font);

    set_bkg_data(38, 9, bgTiles);
    set_bkg_tiles(0, 0, 40, 18, bgMap);

    set_win_tiles(0,0,5,1


    SHOW_BKG;
    DISPLAY_ON;

/*    while(1){
	scroll_bkg(1, 0);
	delay(60);
    }
*/

}
