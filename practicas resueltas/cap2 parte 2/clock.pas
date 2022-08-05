USES CRT, DOS, GRAPH;
CONST
  BGIPATH       =       'D:\PROG\BP\BGI';       { The path of your BGI-files }
  MIDDLE_X      =       320;            { (MIDDLE_X, MIDDLE_Y) is the
center }
  MIDDLE_Y      =       240;            { of the clock }
  RADIUS        =       20;             { The radius of the clock }
  COLOR         =       14;             { The color of the clock }
VAR
  GRDRV,                                { Variables for initgraph }
  GRMD          :       Integer;
  HOUR,                                 { Variables for Gettime }
  MINUTE,
  SECOND,
  SEC100        :       Word;
  OLDSECOND,                            { Variables to check if the }
  OLDMINUTE,                            { time has changed }
  OLDHOUR       :       Word;
PROCEDURE Updateclock(HOURS, MINUTES, SECONDS : WORD; COLOR : BYTE);
{ Updates the second-, minute- and hourhand }
VAR
  DELTA_X,
  DELTA_Y       :       Integer;
BEGIN
  Setcolor (COLOR);             { Sets the color to the color in 'COLOR' }
  DELTA_X := Round(RADIUS*4/5*sin(SECONDS*2*pi/60));
  DELTA_Y := Round(RADIUS*4/5*-cos(SECONDS*2*pi/60));
                                { Calculate the X- and Y- differences
                                  from (MIDDLE_X, MIDDLE_Y), to show
                                  the seconds }
  Line (MIDDLE_X, MIDDLE_Y, MIDDLE_X + DELTA_X, MIDDLE_Y + DELTA_Y);
                                { Show the seconds }
  DELTA_X := Round(RADIUS*4/5*sin(MINUTES*2*pi/60));
  DELTA_Y := Round(RADIUS*4/5*-cos(MINUTES*2*pi/60));
                                { Calculate the X- and Y- differences
                                  from (MIDDLE_X, MIDDLE_Y), to show
                                  the minutes }
  Line (MIDDLE_X, MIDDLE_Y, MIDDLE_X + DELTA_X, MIDDLE_Y + DELTA_Y);
                                { Show the minutes }
  DELTA_X := Round(RADIUS*3/5*sin((HOURS+MINUTES/60)*2*pi/12));
  DELTA_Y := Round(RADIUS*3/5*-cos((HOURS+MINUTES/60)*2*pi/12));
                                { Calculate the X- and Y- differences
                                  from (MIDDLE_X, MIDDLE_Y), to show
                                  the hours }
  Line (MIDDLE_X, MIDDLE_Y, MIDDLE_X + DELTA_X, MIDDLE_Y + DELTA_Y);
                                { Show the hours }
END;
PROCEDURE Displayclock(HOURS, MINUTES, SECONDS : WORD; COLOR : BYTE);
{ Shows the clock (circle) }
BEGIN
  Setcolor (COLOR);             { Sets the color to the color in 'COLOR' }
  Circle (MIDDLE_X, MIDDLE_Y, RADIUS);
                                { Draws a circle around (MIDDLE_X,MIDDLE_Y)
with
                                  a radius of 'RADIUS' pixels }
  Updateclock(HOURS, MINUTES, SECONDS, COLOR);
END;
BEGIN
  GRDRV := VGA;                                 { Set the graphic driver
and Mode to VGA and }
  GRMD  := VGAHI;                               { VGAHI }
  Initgraph (GRDRV, GRMD, BGIPATH);             { Initialize the graphics }
  Gettime (HOUR, MINUTE, OLDSECOND, SEC100);    { Get the starttime }
  directvideo := false;                         { To make the Write-command
work
                                                  in the graphics-mode }
  Displayclock (HOUR, MINUTE, OLDSECOND, COLOR);{ Shows the clock }
  Repeat
    Gettime (HOUR, MINUTE, SECOND, SEC100);     { Gets the time }
    If OLDSECOND <> SECOND then                 { If a second has passed }
      Begin
       { Erase the last
clock (Update the clock with color 0) }
        OLDSECOND := SECOND;                      { For testing the next
second }
        OLDMINUTE := MINUTE;
        OLDHOUR   := HOUR;
        Updateclock (HOUR, MINUTE, SECOND, COLOR);   { Update the clock }
      End;
    Gotoxy(35,25);                              { Textursor to (35,25) }
    Write(HOUR:2,':',MINUTE:2,':',SECOND:2);    { Write the time, just to
check }
  Until Keypressed;                             { Check for a key }
  Readkey;
  Closegraph;                                   { All done }
END.
