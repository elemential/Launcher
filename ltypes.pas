unit LTypes;

{$mode objfpc}{$H+}{$Define LTYPES}

interface

uses
  Classes, SysUtils, Graphics, variants;

type
  TLFn=String;
  TLFnArray=array of TLFn;
  TLIndex=Integer;

  TStringArray=array of String;

  function StrToArray(Value: String; Delimeter: Char): TStringArray;
  function ArrayToStr(Value: TStringArray; Delimeter: Char): String;

  function StrToPoint(Value: String): TPoint;
  function PointToStr(Value: TPoint): String;

  function Default(AValue, ADefault: String; AEmpty: String=''): String;
  function Default(AValue, ADefault: Integer; AEmpty: Integer=0): Integer;
  function Default(AValue, ADefault: Extended; AEmpty: Extended=0): Extended;
  function Default(AValue, ADefault: Variant; AEmpty: Variant=''): variant;

const
  right_angle=1.57079633333;

implementation

function StrToArray(Value: String; Delimeter: Char): TStringArray;
var Strings: TStringList;
    i: Integer;
begin
  Strings:=TStringList.Create;
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.StrictDelimiter:=true;
  Strings.Delimiter:=';';
  Strings.DelimitedText:=Value;
  SetLength(Result, Strings.Count);
  for i:=0 to Strings.Count-1 do
  begin
    Result[i]:=Strings.Strings[i];
  end;
end;

function ArrayToStr(Value: TStringArray; Delimeter: Char): String;
var i: Integer;
begin
  Result:='';
  if Length(Value)>0 then Result:=Value[0];
  for i:=1 to Length(Value)-1 do
  begin
    Result:=Result+';'+Value[i];
  end;
end;

function PointToStr(Value: TPoint): String;
var arr: TStringArray;
begin
  SetLength(arr, 2);
  arr[0]:=IntToStr(Value.X);
  arr[1]:=IntToStr(Value.Y);
  Result:=ArrayToStr(arr, ';');
end;

function StrToPoint(Value: String): TPoint;
var arr: TStringArray;
begin
  arr:=StrToArray(Value, ';');
  Result.X:=StrToInt(arr[0]);
  Result.Y:=StrToInt(arr[1]);
end;

function Default(AValue, ADefault: String; AEmpty: String=''): String;
begin
  Result:=AValue;
  if Result=AEmpty then Result:=ADefault;
end;

function Default(AValue, ADefault: Integer; AEmpty: Integer=0): Integer;
begin
  Result:=AValue;
  if Result=AEmpty then Result:=ADefault;
end;

function Default(AValue, ADefault: Extended; AEmpty: Extended=0): Extended;
begin
  Result:=AValue;
  if Result=AEmpty then Result:=ADefault;
end;

function Default(AValue, ADefault: Variant; AEmpty: Variant=''): variant;
begin
  Result:=AValue;
  if Result=AEmpty then Result:=ADefault;
end;

end.

