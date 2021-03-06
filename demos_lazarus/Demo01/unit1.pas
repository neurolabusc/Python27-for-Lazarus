unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, PairSplitter, PythonEngine, PythonGUIInputOutput;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    PairSplitter1: TPairSplitter;
    PairSplitterSide1: TPairSplitterSide;
    PairSplitterSide2: TPairSplitterSide;
    Panel1: TPanel;
    Panel2: TPanel;
    PythonEngine1: TPythonEngine;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DoPy_InitEngine;
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

uses
  LclType, proc_py;

{$R unit1.lfm}

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

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  PythonEngine1.ExecStrings( Memo2.Lines );
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

