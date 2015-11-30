program password;

uses crt;

var key:char;
phrase:string;
current:integer;
len:integer;
x:integer;
numeric:integer;
hassymbols:boolean;

begin

clrscr;
TextColor(White);
writeln('Welcome to a password strength checker.');
writeln('Please enter a password below...');
writeln;
key := #0;
phrase := '';

repeat 
    if KeyPressed then 
    begin
        key := ReadKey; 
        if key = #0 then ReadKey                         
        else if (key = #8) and (Length(phrase) > 0) then   
        begin 
            phrase := Copy(phrase, 1, Length(phrase)-1); 
            GotoXY(WhereX-1,WhereY); 
            ClrEol;
        end
        else if (key = #9) and (Length(phrase) > 0) then   
        begin 
            {phrase := Copy(phrase, 1, Length(phrase)-1); 
            GotoXY(WhereX-1,WhereY);} 
            ClrEol;
        end
        else if (key = #32) and (Length(phrase) > 0) then   
        begin 
            {phrase := Copy(phrase, 1, Length(phrase)-1); 
            GotoXY(WhereX-1,WhereY);} //FIX 
            ClrEol;
        end
        else if key <> #13 then
        begin 
            phrase := phrase + key; 
            write('*');
        end;
    end; 
until (key = #13) and (phrase <> ''); 

writeln;
len := Length(phrase); 

for current := 1 to len do
begin
    val(phrase[current], x, numeric);
    if numeric = 0 then break;
end;

if (numeric = 1) and (len < 5) then
begin
    write('Your password is ');
    TextColor(Red);
    write('WEAK');
end
else if (numeric = 1) then
begin
    write('Your password is ');
    TextColor(Red);
    write('WEAK');
end
else
begin
    if (numeric = 0) and (len < 8) then
    begin
        write('Your password is ');
        TextColor(Yellow);
        write('MEDIUM');
    end
    else
    begin
        for current := 1 to len do
        begin
            x := ord(phrase[current]);
            if x in [33..47] then hassymbols := true
            else if x in [58..64] then hassymbols := true
            else if x in [91..96] then hassymbols := true
            else if x in [123..126] then hassymbols := true
            else hassymbols := false;
        end;
        
        if(hassymbols = true) and (len >= 8) then
        begin
            write('Your password is ');
            TextColor(Green);
            write('STRONG');
        end
        else
        begin
            write('Your password is ');
            TextColor(Yellow);
            write('MEDIUM');
        end;
    end;
end;

readln;
   
end.