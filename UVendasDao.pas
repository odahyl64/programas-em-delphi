unit UVendasDao;

interface

uses
  FireDAC.Comp.Client, uConexao, uVendasModel, System.SysUtils;
type
  TVendasDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function Incluir(AVendasModel: TVendasModel): Boolean;
    function Alterar(AVendasModel: TVendasModel): Boolean;
    function Excluir(AVendasModel: TVendasModel): Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    function Obter: TFDQuery;
  end;
implementation
{ TClienteDao }
uses uSistemaControl;
function TVendasDao.Alterar(AVendasModel: TVendasModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('update tblvendas set quantidade_ven, preco_ven = :nome where (codigo_ven = :codigo)', [AVendasModel.Nome, AVendasModel.Codigo]);
    Result := True;
  finally
    VQry.Free;
  end;
end;
constructor TVendasDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;
function TVendasDao.Excluir(AVendasModel: TVendasModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('delete from tblvendas where (codigo_ven = :codigo)', [AVendasModel.Codigo]);
    Result := True;
  finally
    VQry.Free;
  end;
end;
function TVendasDao.GetId(AAutoIncrementar: Integer): Integer;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('select gen_id(gen_venda_id, ' + IntToStr(AAutoIncrementar) + ' ) from rdb$database');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;
function TVendasDao.Incluir(AVendasModel: TVendasModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('insert into tblVenda (codigo_ven, quantidade_ven, preco_ven) values (:codigo, :nome)', [AVendasModel.Codigo, AVendasModel.Nome]);
    Result := True;
  finally
    VQry.Free;
  end;
end;
function TVendasDao.Obter: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('select codigo, quantidade_ven from venda order by 1');
  Result := VQry;
end;


end.
