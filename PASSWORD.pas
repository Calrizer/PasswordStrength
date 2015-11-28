program password;

uses crt;

var key : array of char;
current:integer;

begin

    clrscr;
    TextColor(White);
    writeln('Welcome to a password strength checker.');
    writeln('Please enter a password below...');
    writeln;
    repeat
        key[0]