program Trial5(input,output);

const
  FELDGROESSE = 10;

var
    unten, oben, Mitte : integer;
    Feld : array[1..FELDGROESSE] of integer;
    Suchwert : integer;
    gefunden : boolean;
    i:integer;


begin
  for i:= 1 to FELDGROESSE do
  begin
    write('Bitte aufsteigende Zahlen eingeben bis der Stop-Befehl kommt!');
    readln(Feld[i]);
  end;
  writeln('STOP! Jetzt bitte Suchwert eingeben!');
  readln(Suchwert);

  unten := 1;
  oben := FELDGROESSE;
  repeat
    Mitte := (oben + unten) div 2;
    if Suchwert > Feld[Mitte] then
      unten := Mitte
    else
      oben := Mitte;
      gefunden := (Feld[Mitte] = Suchwert)
  until gefunden or (unten >= oben);
  writeln(Mitte);
end.

