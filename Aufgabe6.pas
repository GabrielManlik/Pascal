program Aufgabe6{soll Matrix nach Eingabe transponiert zurückgeben};
const
  GROESSE = 5;
  type
  tMatrix = array [1..GROESSE,1..GROESSE] of integer;


  var
  A : tMatrix;
  tauschPuffer,
  i,
  j : integer;
begin
  {=((1,2,3,4,5),(6,7,8,9,10),(11,12,13,14,15),(16,17,18,19,20),(21,22,23,24,25));}
  writeln('START');
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
      readln (A[i,j]);
  writeln('DONE');


  //___AUSGABE____
   for i:=1 to 5 do
      begin
      for j := 1 to 5 do
          write(A[i,j]:5);
      writeln;
      end;
  //__Transponieren_A  (funktional)

  begin
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
  end;

  //__Transponieren_B    (funktional)

  {begin
  for i := 1 to GROESSE do
    for j := 1 to i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
  end; }

  //__Transponieren_C   (nicht funktional, "tauscht" doppelt, also z.B. [4,2] zu [2,4] zu [4,2])

  {begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
  end;}

  //__Transponieren_D    (nicht funktional, tauscht partiell ("links oben") doppelt, Rest gar nicht)

  {begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE-i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
  end; }

  //__Transponieren_E     (nicht funktional, tendenziell richtige Aufteilung der Matrix, tauscht
  // aber durch Syntax nicht aus, sondern überschreibt sinnlos ->"spiegelt an Diagonale")

  {begin
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[j,i] := A[i,j];
      A[j,i] := tauschPuffer
    end
  end;  }

    //___AUSGABE_2___
   writeln('Transponierte Matrix:');
   for i:=1 to 5 do
      begin
      for j := 1 to 5 do
          write(A[i,j]:5);
      writeln;
      end;

end.

