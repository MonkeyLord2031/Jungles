program mnogougolnick;

uses GraphABC;

function sgn(x: real): integer;
begin
   if x < 0 then sgn := -1
   else if x > 0 then sgn := 1
   else sgn := 0;
end;

function supershape(ang, m, n1, a, n2, b, n3: real): real;
begin
   
   var part1 := (1 / a) * cos(ang * (m / 4));
   part1 := abs(part1);
   part1 := power(part1, n2);
   
   var part2 := (1 / b) * sin(ang * (m / 4));
   part2 := abs(part2);
   part2 := power(part2, n3);
   
   var part3 := part1 + part2;
   part3 := power(part3, 1 / n1);
   
   if (part3 <> 0) then
      supershape := 1 / part3
   else supershape := 0;
 end;

procedure Draw(x0, y0, supang, m, n1, a, n2, b, n3, r: real);
 var 
      x1,y1, x2,y2, sh : real; angle := 0.0;
 
 begin
    while angle <= supang do
      begin
                //var x:= x0 + r*cos(n/250);
                // var y:= y0 + r*sin(n/250);
         //var na := 2 / n;
              // x := x0 + r * a * power(abs(cos(angle)), na) * sgn(cos(angle));
              // y := y0 + r * b * power(abs(sin(angle)), na) * sgn(sin(angle));
         
         sh := supershape(angle, m, n1, a, n2, b, n3);
         
         x1 := x0 + r * sh * cos(angle);
         y1 := y0 + r * sh * sin(angle);
         x2 := x0 + r * sh * cos(angle + 0.001);
         y2 := y0 + r * sh * sin(angle + 0.001);
         
         angle += 0.001;
         
         //PutPixel(round(x) , round(y),  clBlack);
         Line(round(x1), round(y1), round(x2), round(y2));         
      end;
 end;

begin
   
   var w := 1366 * 0.75;
   var h := 768 * 0.75;
   
   var r := 150;
   
   var x0 := w / 2;
   var y0 := h / 2;
   
    //var n:  real;
   
   // writeln('Введите параметр n>0');
   // readln(n);
   // writeln(n);
   
   // var n := 0.5;
   var n1 := 0.8;
   var n2 := 0.6;
   var n3 := 0.4;
   var m := 0;
   var a := 1;
   var b := 1;
   
   var supang := 24 * pi;
   
   SetWindowWidth(round(w));
   SetWindowHeight(round(h));
   
   SetPenColor(RGB(20, 20, 20));
   SetSmoothingOff();
   
  // var sh := 0.0;
   
   FloodFill(0, 0, RGB(200, 200, 200));
   
   while true do
   
   begin
      
      writeln('Введите значение параметра m');
      readln(m);
        
      LockDrawing();
      
      ClearWindow();
      Draw(x0, y0, supang, m, n1, a, n2, b, n3,r);
      
      Redraw(); 
      
   end;
   
end.