unit UVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uVendasControl, uEnumerado,
  Data.DBXMySQL, Data.SqlExpr, Datasnap.DBClient;

type
  TFrnPrincipal = class(TForm)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    EdtQuantidade: TEdit;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    EdtPrecoVenda: TLabel;
    EdtPcVenda: TEdit;
    DsVendas: TDataSource;
    TBLVendas: TClientDataSet;
    TBLVendascodigo_ven: TIntegerField;
    TBLVendasquantidade_Ven: TCurrencyField;
    TBLVendaspcvenda_ven: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarVendas;
    procedure CarregarEdits;

  public
    { Public declarations }
  end;

var
  FrnPrincipal: TFrnPrincipal;

implementation

{$R *.dfm}

procedure TFrnPrincipal.Button1Click(Sender: TObject);
begin
  FVendasControl.VendasModel.Acao   := uEnumerado.tacIncluir;
  FVendasControl.VendasModel.Quantidade   := edtQuantidade.Text;
  FVendasControl.VendasModel.PcVenda      := EdtPcVenda.Text;
  if FVendasControl.Salvar() then
    ShowMessage('Incluido com sucesso.');
  Self.CarregarClientes();

end;

procedure TFrnPrincipal.Button2Click(Sender: TObject);
begin
  FVendasControl.VendasModel.Acao   := uEnumerado.tacAlterar;
  FVendasControl.VendasModel.Codigo := StrToInt(edtCodigo.Text);
  FVendasControl.VendasModel.Quantidade   := edtQuantidade.Text;
  FVendasControl.VendasModel.PrecoVenda   := edtPcVenda.Text;
  if FVendasControl.Salvar() then
    ShowMessage('Alterado com sucesso.');
  Self.CarregarVendas();

end;

procedure TFrnPrincipal.Button3Click(Sender: TObject);
var
  VCodigo: String;
begin
  VCodigo := InputBox('Excluir', 'Digite o código da Venda', EmptyStr);

  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirmação', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
      FVendasControl.VendasModel.Acao   := uEnumerado.tacExcluir;
      FVendasControl.VendasModel.Codigo := StrToInt(edtCodigo.Text);
      FVendasControl.VendasModel.Quantidade := StrToInt(edtQuantidade.Text);
      FVendasControl.VendasModel.PcVenda := StrToInt(edtPcVenda.Text);
      if FVendasControl.Salvar() then
        ShowMessage('Excluido com sucesso.');
      Self.CarregarVendas();
    end;
  end;

end;

procedure TFrnPrincipal.Button4Click(Sender: TObject);
begin
  FVendasControl.VendasModel.Codigo := FControleVendas.VendasModel.GetId(1);
  edtCodigo.Text := FVendasControl.VendasModel.Codigo.ToString();
  edtQuantidade.Clear;
  edtQuantidade.SetFocus();
  edtPcVenda.Clear;
  edtPcVenda.SetFocus;

end;

procedure TFrnPrincipal.FormCreate(Sender: TObject);
begin
  FControleVendas := TVendasControl.Create;

end;

procedure TFrnPrincipal.FormDestroy(Sender: TObject);
begin
  FControleVendas.Free;

end;

procedure TFrnPrincipal.FormShow(Sender: TObject);
begin
  Self.CarregarVendas();

  if mmTableVendas.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;

end;

procedure TfrnPrincipal.CarregarVendas;
var
  VQry: TFDQuery;
begin
  mmTableVendas.Close;
  VQry := FControleVendas.Obter;
  finally
    VQry.Close;
    VQry.Free;
  end;
procedure TFrnPrincipal.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.CarregarEdits();

end;

procedure TFrnPrincipal.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.CarregarEdits();

end;

end;
procedure TfrnPrincipal.CarregarEdits;
begin
  edtCodigo.Text := mmTableVendas.Fields[0].AsString;
  edtQuantidade.Text   := mmTableVendas.Fields[1].AsString;
  edtPcVenda.Text := mmTableVendas.Fields(2).AsString;

end;


procedure TfrnPrincipal.CarregarEdits;
begin
  edtCodigo.Text := mmTableVendas.Fields[0].AsString;
  edtquantidade.Text   := mmTableVendas.Fields[1].AsString;
  edtPcVenda.Text := mmTableVendas.Fields[2].AsString;
end;

end.
