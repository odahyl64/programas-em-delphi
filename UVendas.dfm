object FrnPrincipal: TFrnPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidods de Venda'
  ClientHeight = 374
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 10
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 23
    Top = 38
    Width = 51
    Height = 13
    Caption = 'Qtd Venda'
  end
  object EdtPrecoVenda: TLabel
    Left = 23
    Top = 67
    Width = 44
    Height = 13
    Caption = 'Pc Venda'
  end
  object edtCodigo: TEdit
    Left = 80
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdtQuantidade: TEdit
    Left = 80
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button4: TButton
    Left = 69
    Top = 133
    Width = 75
    Height = 26
    Caption = 'Novo'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 150
    Top = 133
    Width = 75
    Height = 26
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 231
    Top = 133
    Width = 75
    Height = 26
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 133
    Width = 75
    Height = 26
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 173
    Width = 436
    Height = 193
    DataSource = DsVendas
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = DBGrid1KeyUp
    OnMouseUp = DBGrid1MouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRE'#199'O DE VENDA'
        Width = 101
        Visible = True
      end>
  end
  object EdtPcVenda: TEdit
    Left = 80
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object DsVendas: TDataSource
    DataSet = TBLVendas
    Left = 248
    Top = 41
  end
  object TBLVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 40
    object TBLVendascodigo_ven: TIntegerField
      FieldName = 'codigo_ven'
    end
    object TBLVendasquantidade_Ven: TCurrencyField
      FieldName = 'quantidade_Ven'
    end
    object TBLVendaspcvenda_ven: TCurrencyField
      FieldName = 'pcvenda_ven'
    end
  end
end
