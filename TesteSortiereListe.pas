{$R+}
{$B+}
program TesteSortiereListe(input, output);
{ sortiert eine Liste durch Einfügen }

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             wert : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;
  inSuchwert : tNatZahl;
  gefunden: boolean;

  procedure moveToFront (
                inSuchwert : integer;
            var ioAnfang : tRefListe;
            var outGefunden : boolean);
{ bestimmt in einer linearen Liste das erste Element mit dem
  Wert inSuchwert und positioniert es als erstes Listen-
  element }

  var
  ZuletztGeprueftesElement,
  UmhaengeHilfe : tRefListe;
  gefunden : boolean;

begin
  gefunden := false;
  if ioAnfang <> nil then { Liste ist nicht leer }
    if ioAnfang^.wert = inSuchwert then
      { gefundenes Element ist schon das erste Element }
      gefunden := true
    else
    begin
      ZuletztGeprueftesElement := ioAnfang;
      while (ZuletztGeprueftesElement^.next <> nil) and not gefunden do
        if ZuletztGeprueftesElement^.next^.wert = inSuchwert then
        begin { Suchwert ist gefunden }
          gefunden := true;

          { **Umhaengen** }
          UmhaengeHilfe := ZuletztGeprueftesElement^.next;
          UmhaengeHilfe^.next := ZuletztGeprueftesElement^.next;
          ZuletztGeprueftesElement^.next := ioAnfang;
          ioAnfang := ZuletztGeprueftesElement;
        end
        else
          ZuletztGeprueftesElement := ZuletztGeprueftesElement^.next
    end; { else }
  outGefunden := gefunden
end; { moveToFront }

  procedure Anhaengen(inZahl : tNatZahl; var ioListe : tRefListe);
  { Haengt inZahl an ioListe an }

    var
    Zeiger : tRefListe;

  begin
    Zeiger := ioListe;
    if Zeiger = nil then
    begin
      new(ioListe);
      ioListe^.wert := inZahl;
      ioListe^.next := nil;
    end
    else
    begin
      while Zeiger^.next <> nil do
        Zeiger := Zeiger^.next;
      new(Zeiger^.next);
      Zeiger := Zeiger^.next;
      Zeiger^.wert := inZahl;
      Zeiger^.next := nil;
    end;
  end;

  procedure ListeEinlesen(var outListe:tRefListe; var outSuchwert:tNatZahl);
  { liest eine Folge von Zahlen ein }

    var
    Liste : tRefListe;
    Zahl,
    Zahl2: integer;


  begin
    Liste := nil;
    read(Zahl);
    while Zahl<>-1 do
    begin
      Anhaengen(Zahl, Liste);
      read(Zahl)
    end;
    writeln('Bitte SUchzahl angeben');
    read(Zahl2);
    outListe := Liste;
    outSuchwert:= Zahl2
  end;

  procedure GibListeAus(inListe : tRefListe);
  { Gibt die eine nicht-leere Liste aus }

    var
    Zeiger : tRefListe;

  begin
    Zeiger := inListe;
    write(Zeiger^.wert);
    Zeiger := Zeiger^.next;
    while Zeiger <> nil do
    begin
      write(', ');
      write(Zeiger^.wert);
      Zeiger := Zeiger^.next;
    end;
    writeln('')
  end;

begin
  ListeEinlesen(RefListe,inSuchwert);
  moveToFront(inSuchwert,RefListe,gefunden);
  GibListeAus(RefListe)
end.
  end;

{leider war mir der Sinn des boolean istEingefügt schleierhaft, ich habe daher auf Verwendung verzichtet}
