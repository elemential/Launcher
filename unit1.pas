unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LTypes, LSize, LIniFiles, LNet, LPosition;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function getPos: TL2DPosition;
    procedure setPos(value: TL2DPosition);
    property Pos: TL2DPosition read getPos write setPos;
    function getSize: TL2DSize;
    procedure setSize(Value: TL2DSize);
    property Size: TL2DSize read getSize write setSize;
  end;

var
  Form1: TForm1;
  net: TLNet;
  ini: TLIniFile;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(net.get(InputBox('URL', 'Url:', 'http://elemential.net')));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  net:=TLNet.Create;
  ini:=TLIniFile.Create('../../main.ini');
  Size:=ini.ReadL2DSize('Form', 'size', Size);
  Pos:=ini.ReadL2DPosition('Form', 'pos', Pos);
end;

function TForm1.getPos:TL2DPosition;
begin
  Result:=TL2DPosition.Create(Left, Top);
end;

procedure TForm1.setPos(Value: TL2DPosition);
begin
  Left:=Value.X;
  Top:=Value.Y;
end;

function TForm1.getSize: TL2DSize;
begin
  Result:=TL2DSize.Create(Width, Height);
end;

procedure TForm1.setSize(Value: TL2DSize);
begin
  Width:=Value.x;
  Height:=Value.y;
end;

end.

