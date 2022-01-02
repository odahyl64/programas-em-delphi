unit UVendasModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client;
type
  TVendasModel = class
  private
    FAcao: TAcao;
    FCodigo: Integer;
    FNome: string;
    procedure SetAcao(const Value: TAcao);
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    function Obter: TFDQuery;
    function Salvar: Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Acao: TAcao read FAcao write SetAcao;
  end;
implementation
{ TVendas }
uses uVendasDao;
function TVendasModel.GetId(AAutoIncrementar: Integer): Integer;
var
  VVendasDao: TVendasDao;
begin
  VVendasDao := TVendasDao.Create;
  try
    Result := VVendasDao.GetId(AAutoIncrementar);
  finally
    VVendasDao.Free;
  end;
end;
function TVendasModel.Obter: TFDQuery;
var
  VVendasDao: TVendasDao;
begin
  VVendasDao := TVendasDao.Create;
  try
    Result := VVendasDao.Obter;
  finally
    VVendasDao.Free;
  end;
end;
function TVendasModel.Salvar: Boolean;
var
  VVendasDao: TVendasDao;
begin
  Result := False;
  VVendasDao := TVendasDao.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := VVendasDao.Incluir(Self);
      uEnumerado.tacAlterar: Result := VVendasDao.Alterar(Self);
      uEnumerado.tacExcluir: Result := VVendasDao.Excluir(Self);
    end;
  finally
    VVendasDao.Free;
  end;
end;
procedure TVendasModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;
procedure TVendasModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;
procedure TVendasModel.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
