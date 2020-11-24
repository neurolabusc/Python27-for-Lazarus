unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, PairSplitter, PythonGUIInputOutput, PythonEngine,
  Messages, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PythonModule1: TPythonModule;
    PythonEngine1: TPythonEngine;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PythonModule1Initialization(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure DoPy_InitEngine;
  public
    { Déclarations publiques }
  end;

  function  spam_foo( self, args : PPyObject ) : PPyObject; cdecl;

var
  Form1: TForm1;

implementation

uses
  LclType, proc_py;

{$R *.lfm}

const
  cPyLibraryWindows = 'python37.dll';
  cPyLibraryLinux = 'libpython3.7m.so.1.0';
  cPyZipWindows = 'python37.zip';

{$ifdef darwin}
function PyLibraryMac(): string;
var
  N: integer;
  S: String;
begin
  for N:= 9 to 5 do begin
      S:= Format('/Library/Frameworks/Python.framework/Versions/3.%d/lib/libpython3.%d.dylib', [N, N]);
      if FileExists(S) then exit(S);
  end;
  S := '/System/Library/Frameworks/Python.framework/Versions/Current/lib/libpython2.7.dylib';
  if FileExists(S) then exit(S);
  exit('');
end;
{$endif}

procedure TForm1.Button1Click(Sender: TObject);
begin
  PythonEngine1.ExecStrings( Memo1.Lines );
end;

// Here's an example of functions defined for the module spam

function spam_foo( self, args : PPyObject ) : PPyObject; cdecl;
begin
  with GetPythonEngine do
    begin
      ShowMessage( 'args of foo: '+PyObjectAsString(args) );
      Result := ReturnNone;
    end;
end;

procedure TForm1.PythonModule1Initialization(Sender: TObject);
begin
  // In a module initialization, we just need to add our
  // new methods
  with Sender as TPythonModule do
    begin
        AddMethod('foo', @spam_foo, 'foo');
    end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  with OpenDialog1 do
    begin
      if Execute then
        Memo1.Lines.LoadFromFile( FileName );
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with SaveDialog1 do
    begin
      if Execute then
        Memo1.Lines.SaveToFile( FileName );
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DoPy_InitEngine;
end;

procedure TForm1.DoPy_InitEngine;
var
  S: string;
begin
  S:=
    {$ifdef windows} cPyLibraryWindows {$endif}
    {$ifdef linux} cPyLibraryLinux {$endif}
    {$ifdef darwin} PyLibraryMac() {$endif} ;
  PythonEngine1.DllPath:= ExtractFileDir(S);
  PythonEngine1.DllName:= ExtractFileName(S);
  PythonEngine1.LoadDll;
end;

end.
