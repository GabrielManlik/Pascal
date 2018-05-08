program Aufgabe1 (input, output);
{Das Programm ließt eine nicht vorgegebene Anzahl von zeilenweise
geschriebenen Integer-Werten ein und gibt das Maximum zurück. Die Zahl Null beendet die Eingabefolge}

    var
    Zahl,
    Eingabe: integer;

    begin{Lese ersten Wert ein und setze ihn als Maximum}
      writeln('Geben Sie Zahlen ein - das Programm bestimmt die größte der eingegebenen Zahlen');
      writeln('Null beendet die Eingabe');
      write('1. Wert: ');
      readln(Eingabe);
      if Eingabe = 0 then
         writeln('Leere Eingabefolge!')
      else
      begin

          Zahl:= Eingabe;
          while Eingabe <> 0 do{Lese so lange Folgewerte ein, bis eine Null eingegeben wird. Aus den Eingaben soll geprüft werden, ob die Zahl größer
          ist als das bestehende Maximum und dieses ggf. ersetzen}
          begin
               write('Der nächste Wert ist: ');
               readln(Eingabe);
               if (Eingabe >= Zahl) then
                  if Eingabe <> 0 then
                     Zahl:=Eingabe;
          end;{while-Schleife}
          writeln('Die größte, eingegebene Zahl ist: ', Zahl)
      end;{if-else Anweisungsblock}
    end.{Maximum}

