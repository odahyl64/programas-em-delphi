unit UVendasControl;

interface

uses
  uVendasModel, System.SysUtils, FireDAC.Comp.Client;
type
  TVendasControl = class
  private
    FVendasModel: TVendasModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: Boolean;
    function Obter: TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;
    property VendasModel: TVendasModel read FVendasModel write FVendasModel;
  end;
implementation
{ TClienteControl }
constructor TVendasControl.Create;
begin
  FVendasModel := TVendasModel.Create;
end;
destructor TVendasControl.Destroy;
begin
  FVendasModel.Free;
  inherited;
end;
function TVendasControl.GetId(AAutoIncrementar: Integer): Integer;
begin
  Result := FVendasModel.GetId(AAutoIncrementar);
end;
function TVendasControl.Obter: TFDQuery;
begin
  Result := FVendasModel.Obter;
end;
function TVendasControl.Salvar: Boolean;
begin
  Result := FVendasModel.Salvar;
end;

end.
