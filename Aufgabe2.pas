program Aufgabe2 (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 5;
  FELDLAENGE2 = 8;
  ERGEBNISFELDLAENGE = 13; { FELDLAENGE1 + FELDLAENGE2 }

  type
  tFeld1 = array [1..FELDLAENGE1] of integer;
  tFeld2 = array [1..FELDLAENGE2] of integer;
  tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  ErgebnisFeld : tErgebnisFeld;
  i : integer;
  j : integer;
  k : integer;
begin
  { sortierte Felder einlesen }
  writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
  for i := 1 to FELDLAENGE1 do
    read (Feld1[i]);
  writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to FELDLAENGE2 do
    read (Feld2[j]);
  // hier ist der einzufügende Part

   i:=1;
   j:=1;
   for k := 1 to ERGEBNISFELDLAENGE do
   begin
     if ((Feld1[i]<Feld2[j]) or (j>FELDLAENGE2) ) and (i<=FELDLAENGE1) then
     begin
        Ergebnisfeld[k]:= Feld1[i];
        i:=i+1;
     end
     else
     begin
         Ergebnisfeld[k]:=Feld2[j];
         j:=j+1;
     end;
   end;{for-Schleife}

  // hier endet der einzufügende Part

  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ':5);
  writeln
end.


