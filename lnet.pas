unit LNet;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fphttpclient, fphttpserver, LTypes;

type
  TUrl=String;
  TLNet=class
  private
    {types and vars}
    var
      FClient: TFPHTTPClient;
      FServer: TFPHttpServer;
  public
    {propertyes}
    function getClient: TFPHTTPClient;
    property Client: TFPHTTPClient read getClient
                                   write FClient;
    property Server: TFPHttpServer read FServer write FServer;
  public
    {functions and procedures}
    function get(AUrl: TUrl): String;
    procedure download(AUrl: TUrl; AFn: TLFn);
  end;

implementation

function TLNet.getClient: TFPHTTPClient;
begin
  if FClient=Nil then FClient:=TFPHTTPClient.Create(nil);
  Result:=FClient;
end;

function TLNet.get(AUrl: TUrl): String;
begin
  Result:=Client.Get(AUrl);
end;

procedure TLNet.download(AUrl: TUrl; AFn: TLFn);
begin
  Client.Get(AUrl, AFn);
end;

end.

