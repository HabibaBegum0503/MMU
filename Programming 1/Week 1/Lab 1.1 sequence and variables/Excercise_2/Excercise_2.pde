// drawing a square
//line (20,20,70,20); // top edge 
//line (70,20, 70, 70);//right edge  '' start from where first line ended so (70,20) going down so chnage y (70,70)line (70,70, 20, 70);//bottom edge '' going across so x chamges value and Y stays the same
//line (70,70, 20, 70); //bottom edge '' going across so x value chnaged from (70,70) to (20,70)
//line (20,70, 20,20);//left edge

// drawing a movable square
float x = 20;
float y = 20;
float edge = 50;
line (x,y, x+ edge, y);
line (x+ edge, y, x+edge, y+edge);
line (x+edge, y+edge, x, y+edge);
line (x, y+edge, x, y);
