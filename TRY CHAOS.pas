program structure_from_chaos;

uses GraphABC;

procedure draw(x0, y0, r: real);
var
   x1,y1, x2,y2, x3,y3, x,y,  xx,yy,  i: real;
begin

   x1 := x0; y1 := y0 - r*sqrt(3) / 2;
   x2 := x0 + r * 0.5;  y2 := y0;
   x3 := x0 - r * 0.5;  y3 := y0;
   
   var d := clBlack;
   i := 0;
   
   PutPixel(round(x0),round(y0),d);
   PutPixel(round(x1),round(y1),d);
   PutPixel(round(x2),round(y2),d);
   PutPixel(round(x3),round(y3),d);
   
   xx := x0; yy := y0;
   var j := 0;
   var k := 0;
   var l := 0;
   var m := 0;
   while i<1 do
    begin
    d := RGB(k,l,m);
     var a := random(1,6);
     if ((a = 1) or (a = 2)) then
       begin
         x := abs(xx + x1)/2;   y := abs(yy + y1)/2;
       end
      else if ((a = 3) or (a = 4)) then
       begin
         x := abs(xx + x2)/2;  y := abs(yy + y2)/2;
       end
      else if ((a = 5) or (a = 6)) then
       begin
       x := abs(xx + x3)/2;  y := abs(yy + y3)/2;
       end;
       
     xx := x;  yy := y;
     
     PutPixel(round(x), round(y), d);
     i  += 0.00001;
     j += 1;
     if (j mod 392) = 0 then k += 1;
     l := k div (50);
     m :=  k div (10);
    end;
end;

begin
  
   var h := ScreenHeight;
   var w := ScreenWidth;
   
   SetWindowWidth(w);
   SetWindowHeight(h);
   
   ClearWindow(RGB(200,200,200));
   
   var x0 := w / 2;
   var y0 := h / 2 + 120;
   var r := 500;
   
   //LockDrawing();
   draw(x0, y0, r);
   //Redraw();
   
end.