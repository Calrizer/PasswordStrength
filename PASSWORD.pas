program password;

uses crt;

var key:char;
phrase:string
current:integer;
done:boolean;

begin

clrscr;
TextColor(White);
writeln('Welcome to a password strength checker.');
writeln('Please enter a password below...');
writeln;
current := 0;

{repeat
key := ReadKey;
if key in [33..126] then
begin
phrase := phrase + chr(key)


until done = true;}

{Check what ReadKey returns}
