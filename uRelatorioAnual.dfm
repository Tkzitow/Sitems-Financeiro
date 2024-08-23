object fmlRelatorioAnual: TfmlRelatorioAnual
  Left = 0
  Top = 0
  Caption = 'Anual'
  ClientHeight = 576
  ClientWidth = 985
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pCenter: TPanel
    Left = 0
    Top = 0
    Width = 985
    Height = 576
    Align = alClient
    TabOrder = 0
    OnClick = pCenterClick
    ExplicitWidth = 981
    ExplicitHeight = 575
    object pTop: TPanel
      Left = 1
      Top = 1
      Width = 983
      Height = 64
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 979
      object cbRelatorioAnual: TComboBox
        Left = 16
        Top = 27
        Width = 105
        Height = 23
        TabOrder = 0
      end
      object rgRelatorioAnual: TRadioGroup
        Left = 152
        Top = 1
        Width = 617
        Height = 49
        Caption = 'Filtros'
        Columns = 5
        ItemIndex = 0
        Items.Strings = (
          'Origem'
          'Conta(entrada)'
          'Finalidade'
          'Item'
          'Item Fixo')
        TabOrder = 1
      end
      object pBuscar: TPanel
        Left = 791
        Top = 22
        Width = 74
        Height = 28
        Caption = 'Buscar'
        TabOrder = 2
        OnClick = pBuscarClick
      end
      object pLimar: TPanel
        Left = 874
        Top = 22
        Width = 74
        Height = 28
        Caption = 'Limpar'
        TabOrder = 3
        OnClick = pLimarClick
      end
    end
    object pMid: TPanel
      Left = 1
      Top = 65
      Width = 983
      Height = 510
      Align = alClient
      Anchors = []
      TabOrder = 1
      ExplicitWidth = 979
      ExplicitHeight = 509
      object lvRelatorioAnual: TListView
        Left = 1
        Top = 1
        Width = 981
        Height = 508
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Item'
            MaxWidth = 100
            MinWidth = 100
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'janeiro'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'fevereiro'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'mar'#231'o'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'abril'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'maio'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'junho'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'julho'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'agosto'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'setembro'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'outubro'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'novembro'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'dezembro'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'Total'
            Tag = 13
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'M'#233'dia'
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawItem = lvRelatorioAnualAdvancedCustomDrawItem
        OnAdvancedCustomDrawSubItem = lvRelatorioAnualAdvancedCustomDrawSubItem
        ExplicitLeft = 2
        ExplicitTop = 6
      end
    end
  end
end