program serpinski_tr;

uses GraphABC;

const
   h = ScreenHeight;
   w = ScreenWidth;
   lenght = 250.0;
   angle = pi / 3;
   x0 = w / 2;
   y0 = h / 2 + lenght * sqrt(2) / 3 +10;

procedure drawtrngl(x, y, len, ang: real; r, g, b: byte);
var
   x1, y1, x2, y2: real;

begin
   x1 := x + len; y1 := y;
   x2 := x + len * cos(ang); y2 := y - len * sin(ang);
   
   line(round(x), round(y), round(x1), round(y1), RGB(r, g, b));
   line(round(x), round(y), round(x2), round(y2), RGB(r, g, b));
   line(round(x2), round(y2), round(x1), round(y1), RGB(r, g, b));
end;

procedure drawsrpnski(x, y, len, ang: real);
var
   x1, y1, x2, y2: real;
   r, g, b: byte;
begin
   while (len > 1) do
   begin
      x1 := x + len; y1 := y;
      x2 := x + len * cos(ang); y2 := y - len * sin(ang);
      
       if ((x1 <= (x0 + lenght)) and (y1 > (y0 - lenght*sin(ang)))) then
          begin
            r := 200; g := 50; b := 50;
          end
      else  if ((x1 > (x0 + lenght)) and (y1 > (y0 - lenght*sin(ang)))) then
         begin
            r := 50; g := 50; b := 200;
          end
       else if (y1 <= (y0 - lenght*sin(ang))) then
          begin
            r := 50; g := 200; b := 50;
          end;
      
      drawtrngl(x, y, len, ang, r, g, b);
      drawtrngl(x1, y1, len, ang, r, g, b);
      drawtrngl(x2, y2, len, ang, r, g, b); 
      
      len := len / 2;
      
      drawsrpnski(x1, y1, len, ang);
      drawsrpnski(x2, y2, len, ang);
   end;
end;

begin
   
   SetWindowWidth(w);
   SetWindowHeight(h);
   
   var ang := pi/36;
   
   while true do
   begin
      while (ang < pi*0.48) do
      begin
         Lockdrawing();
         ClearWindow(RGB(175, 170, 175));
         drawsrpnski(x0, y0, lenght, ang);
         ang += 0.05;
         Redraw();
      end;
      while (ang > pi/6) do
      begin
         Lockdrawing();
         ClearWindow(RGB(175, 170, 175));
         drawsrpnski(x0, y0, lenght, ang);
         ang += -0.05;
         Redraw();
      end;
   end;
end.