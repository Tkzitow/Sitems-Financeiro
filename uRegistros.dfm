object FmlRegistros: TFmlRegistros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registros'
  ClientHeight = 575
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object p_: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 575
    Align = alClient
    TabOrder = 0
    OnClick = p_Click
    ExplicitWidth = 977
    ExplicitHeight = 574
    object PageControl1: TPageControl
      Left = 3
      Top = 9
      Width = 978
      Height = 566
      ActivePage = TabSheet2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = '       Entradas        '
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 970
          Height = 536
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 11
            Top = 11
            Width = 40
            Height = 15
            Caption = 'Origem'
          end
          object Label2: TLabel
            Left = 211
            Top = 11
            Width = 32
            Height = 15
            Caption = 'Conta'
          end
          object Label4: TLabel
            Left = 496
            Top = 116
            Width = 62
            Height = 15
            Caption = 'Observa'#231#227'o'
          end
          object Label3: TLabel
            Left = 496
            Top = 11
            Width = 26
            Height = 15
            Caption = 'Valor'
          end
          object Label5: TLabel
            Left = 750
            Top = 11
            Width = 24
            Height = 15
            Caption = 'Data'
          end
          object Label6: TLabel
            Left = 583
            Top = 69
            Width = 16
            Height = 15
            Caption = 'at'#233
          end
          object Label7: TLabel
            Left = 837
            Top = 69
            Width = 16
            Height = 15
            Caption = 'at'#233
          end
          object dbgridEntradaRegistro: TDBGrid
            Left = 6
            Top = 224
            Width = 961
            Height = 281
            TabStop = False
            DataSource = DataModule1.DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 12
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgridEntradaRegistroDblClick
          end
          object lvOrigemEntradaRegistro: TListView
            Left = 11
            Top = 61
            Width = 141
            Height = 98
            Columns = <
              item
                AutoSize = True
                Caption = 'teste'
              end>
            ReadOnly = True
            RowSelect = True
            TabOrder = 13
            ViewStyle = vsList
            OnKeyDown = lvOrigemEntradaRegistroKeyDown
          end
          object cbOrigemEntradaRegistro: TComboBox
            Left = 11
            Top = 32
            Width = 100
            Height = 23
            TabOrder = 0
          end
          object btOkOrigemEntradaRegistro: TButton
            Left = 111
            Top = 31
            Width = 41
            Height = 25
            Caption = 'Ok'
            TabOrder = 1
            OnClick = btOkOrigemEntradaRegistroClick
          end
          object edObservassaoEntradaRegistro: TEdit
            Left = 496
            Top = 136
            Width = 281
            Height = 23
            TabOrder = 6
            OnClick = edObservassaoEntradaRegistroClick
          end
          object lvContaEntradaRegistro: TListView
            Left = 211
            Top = 61
            Width = 142
            Height = 98
            Columns = <>
            ReadOnly = True
            RowSelect = True
            TabOrder = 14
            ViewStyle = vsList
            OnKeyDown = lvContaEntradaRegistroKeyDown
          end
          object cbDataEntradaRegistro: TComboBox
            Left = 750
            Top = 32
            Width = 131
            Height = 23
            TabOrder = 5
            OnChange = cbDataEntradaRegistroChange
          end
          object cbValorEntradaRegistro: TComboBox
            Left = 496
            Top = 32
            Width = 129
            Height = 23
            TabOrder = 4
            OnChange = cbValorEntradaRegistroChange
          end
          object edValorEntradaRegistro1: TEdit
            Left = 496
            Top = 61
            Width = 81
            Height = 23
            TabStop = False
            TabOrder = 15
            OnChange = edValorEntradaRegistro1Change
            OnClick = edValorEntradaRegistro1Click
          end
          object edValorEntradaRegistro2: TEdit
            Left = 610
            Top = 61
            Width = 81
            Height = 23
            TabStop = False
            TabOrder = 16
            OnChange = edValorEntradaRegistro2Change
            OnClick = edValorEntradaRegistro2Click
          end
          object dtDataEntradaRegistro1: TDateTimePicker
            Left = 750
            Top = 61
            Width = 81
            Height = 23
            Date = 45470.000000000000000000
            Time = 0.479058148150215900
            TabOrder = 17
            TabStop = False
          end
          object dtDataEntradaRegistro2: TDateTimePicker
            Left = 859
            Top = 61
            Width = 81
            Height = 23
            Date = 45470.000000000000000000
            Time = 0.479633761577133600
            TabOrder = 18
            TabStop = False
          end
          object btBuscarEntradaRegistro: TButton
            Left = 811
            Top = 190
            Width = 75
            Height = 25
            Caption = 'Buscar'
            TabOrder = 8
            OnClick = btBuscarEntradaRegistroClick
          end
          object btLimparEntradaRegistro: TButton
            Left = 892
            Top = 190
            Width = 75
            Height = 25
            Caption = 'Limpar'
            TabOrder = 9
            OnClick = btLimparEntradaRegistroClick
          end
          object Panel2: TPanel
            Left = 728
            Top = 507
            Width = 105
            Height = 26
            Caption = 'Valor Total'
            Color = clGreen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 19
          end
          object pValorTotalEntradaRegistro: TPanel
            Left = 828
            Top = 507
            Width = 139
            Height = 26
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 20
          end
          object btExcluiEntradaRegistro: TButton
            Left = 6
            Top = 508
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 10
            OnClick = btExcluiEntradaRegistroClick
          end
          object btOkContaEntradaRegistro: TButton
            Left = 307
            Top = 31
            Width = 46
            Height = 25
            Caption = 'Ok'
            TabOrder = 3
            OnClick = btOkContaEntradaRegistroClick
          end
          object cbContaEntradaRegistro: TComboBox
            Left = 211
            Top = 32
            Width = 96
            Height = 23
            TabOrder = 2
          end
          object edValorEntradaRegistroUnico: TEdit
            Left = 496
            Top = 61
            Width = 129
            Height = 23
            TabStop = False
            TabOrder = 21
            OnChange = edValorEntradaRegistroUnicoChange
            OnClick = edValorEntradaRegistroUnicoClick
          end
          object cbDataEntradaMesRegistro: TComboBox
            Left = 750
            Top = 61
            Width = 131
            Height = 23
            TabOrder = 11
            TabStop = False
          end
          object rgOrdernarBusca: TRadioGroup
            Left = 496
            Top = 165
            Width = 209
            Height = 50
            BiDiMode = bdLeftToRight
            Caption = 'Ordenar Busca'
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Data'
              'Origem'
              'Valor Asc'
              'Valor Desc')
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 7
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = '       Sa'#237'das         '
        ImageIndex = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 970
          Height = 536
          Align = alClient
          Caption = 'Panel4'
          TabOrder = 0
          object Label8: TLabel
            Left = 8
            Top = 11
            Width = 54
            Height = 15
            Caption = 'Finalidade'
          end
          object Label9: TLabel
            Left = 147
            Top = 11
            Width = 24
            Height = 15
            Caption = 'Item'
          end
          object Label10: TLabel
            Left = 288
            Top = 11
            Width = 32
            Height = 15
            Caption = 'Conta'
          end
          object Label11: TLabel
            Left = 496
            Top = 11
            Width = 26
            Height = 15
            Caption = 'Valor'
          end
          object Label12: TLabel
            Left = 752
            Top = 11
            Width = 24
            Height = 15
            Caption = 'Data'
          end
          object Label13: TLabel
            Left = 496
            Top = 114
            Width = 62
            Height = 15
            Caption = 'Observa'#231#227'o'
          end
          object Label14: TLabel
            Left = 840
            Top = 114
            Width = 49
            Height = 15
            Caption = 'Item Fixo'
          end
          object Label15: TLabel
            Left = 583
            Top = 69
            Width = 16
            Height = 15
            Caption = 'at'#233
          end
          object Label16: TLabel
            Left = 839
            Top = 69
            Width = 16
            Height = 15
            Caption = 'at'#233
          end
          object dbGridSaidaRegistro: TDBGrid
            Left = 8
            Top = 224
            Width = 961
            Height = 281
            ParentCustomHint = False
            TabStop = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DataSource = DataModule1.DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = dbGridSaidaRegistroDblClick
          end
          object lvFinalidadeSaidaRegistro: TListView
            Left = 6
            Top = 56
            Width = 129
            Height = 130
            Columns = <>
            TabOrder = 3
            ViewStyle = vsList
            OnKeyDown = lvFinalidadeSaidaRegistroKeyDown
          end
          object lvItemSaidaRegistro: TListView
            Left = 147
            Top = 56
            Width = 129
            Height = 130
            Columns = <>
            TabOrder = 6
            ViewStyle = vsList
            OnKeyDown = lvItemSaidaRegistroKeyDown
          end
          object lvContaSaidaRegistro: TListView
            Left = 288
            Top = 56
            Width = 129
            Height = 130
            Columns = <>
            TabOrder = 9
            ViewStyle = vsList
            OnKeyDown = lvContaSaidaRegistroKeyDown
          end
          object cbValorSaidaRegistro: TComboBox
            Left = 496
            Top = 32
            Width = 121
            Height = 23
            TabOrder = 10
            OnChange = cbValorSaidaRegistroChange
          end
          object cbDataSaidaRegistro: TComboBox
            Left = 752
            Top = 32
            Width = 121
            Height = 23
            TabOrder = 11
            OnChange = cbDataSaidaRegistroChange
          end
          object edValorSaidaRegistro1: TEdit
            Left = 496
            Top = 61
            Width = 81
            Height = 23
            TabStop = False
            TabOrder = 18
            OnClick = edValorSaidaRegistro1Click
          end
          object edValorSaidaRegistro2: TEdit
            Left = 607
            Top = 61
            Width = 81
            Height = 23
            TabStop = False
            TabOrder = 19
            OnClick = edValorSaidaRegistro2Click
          end
          object edObservassaoSaidaRegistro: TEdit
            Left = 496
            Top = 135
            Width = 281
            Height = 23
            TabOrder = 12
            OnClick = edObservassaoSaidaRegistroClick
          end
          object dtDataSaidaRegistro1: TDateTimePicker
            Left = 752
            Top = 61
            Width = 81
            Height = 23
            Date = 45470.000000000000000000
            Time = 0.503963425922847800
            TabOrder = 20
            TabStop = False
          end
          object dtDataSaidaRegistro2: TDateTimePicker
            Left = 864
            Top = 61
            Width = 81
            Height = 23
            Date = 45470.000000000000000000
            Time = 0.503968263888964400
            TabOrder = 21
            TabStop = False
          end
          object btBuscarSaidaRegistro: TButton
            Left = 811
            Top = 193
            Width = 75
            Height = 25
            Caption = 'Buscar'
            TabOrder = 15
            OnClick = btBuscarSaidaRegistroClick
          end
          object btLimparSaidaRegistro: TButton
            Left = 892
            Top = 193
            Width = 75
            Height = 25
            Caption = 'Limpar'
            TabOrder = 16
            OnClick = btLimparSaidaRegistroClick
          end
          object btExcluirSaidaRegistro: TButton
            Left = 6
            Top = 508
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 17
            OnClick = btExcluirSaidaRegistroClick
          end
          object cbItemFixoSaidaRegistro: TComboBox
            Left = 840
            Top = 135
            Width = 105
            Height = 23
            TabOrder = 13
          end
          object cbFinalidadeSaidaRegistro: TComboBox
            Left = 6
            Top = 32
            Width = 91
            Height = 23
            TabOrder = 1
          end
          object cbItemSaidaRegistro: TComboBox
            Left = 147
            Top = 32
            Width = 91
            Height = 23
            TabOrder = 4
          end
          object cbContaSaidaRegistro: TComboBox
            Left = 288
            Top = 32
            Width = 87
            Height = 23
            TabOrder = 7
          end
          object btOkFinalidadeSaidaRegistro: TButton
            Left = 98
            Top = 31
            Width = 37
            Height = 25
            Caption = 'Ok'
            TabOrder = 2
            OnClick = btOkFinalidadeSaidaRegistroClick
          end
          object pValorTotalSaidaRegistro: TPanel
            Left = 828
            Top = 507
            Width = 139
            Height = 26
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 22
          end
          object Panel6: TPanel
            Left = 728
            Top = 507
            Width = 105
            Height = 26
            Caption = 'Valor Total'
            Color = clMaroon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 23
          end
          object btOkItemSaidaRegistro: TButton
            Left = 239
            Top = 31
            Width = 37
            Height = 25
            Caption = 'Ok'
            TabOrder = 5
            OnClick = btOkItemSaidaRegistroClick
          end
          object btOkContaSaidaRegistro: TButton
            Left = 376
            Top = 31
            Width = 41
            Height = 25
            Caption = 'Ok'
            TabOrder = 8
            OnClick = btOkContaSaidaRegistroClick
          end
          object rgOrdenarSaidaRegistro: TRadioGroup
            Left = 496
            Top = 164
            Width = 297
            Height = 54
            Caption = 'Ordenar Busca'
            Columns = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Data'
              'Valor Asc'
              'Finalidade'
              'Valor Desc'
              'Item')
            ParentFont = False
            TabOrder = 14
          end
          object edValorSaidaRegistroUnico: TEdit
            Left = 496
            Top = 61
            Width = 121
            Height = 23
            TabStop = False
            TabOrder = 24
            OnClick = edValorSaidaRegistroUnicoClick
          end
          object cbDataSaidaMesRegistro: TComboBox
            Left = 752
            Top = 61
            Width = 121
            Height = 23
            TabOrder = 25
            TabStop = False
          end
        end
      end
    end
  end
end