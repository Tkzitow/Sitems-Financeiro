object fml_investimentos: Tfml_investimentos
  Left = 0
  Top = 0
  Caption = 'Investimentos'
  ClientHeight = 581
  ClientWidth = 961
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object p_investimentos_main: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 581
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 957
    ExplicitHeight = 580
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 959
      Height = 104
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 955
      object Panel2: TPanel
        Left = 11
        Top = 7
        Width = 110
        Height = 29
        Caption = 'Banca Inicial'
        TabOrder = 0
      end
      object Panel14: TPanel
        Left = 120
        Top = 7
        Width = 111
        Height = 29
        Caption = '00.00'
        TabOrder = 1
      end
      object Panel16: TPanel
        Left = 624
        Top = 7
        Width = 111
        Height = 29
        Caption = '00.00'
        TabOrder = 2
      end
      object Panel17: TPanel
        Left = 515
        Top = 7
        Width = 110
        Height = 29
        Caption = 'Roi'
        TabOrder = 3
      end
      object Panel18: TPanel
        Left = 728
        Top = 7
        Width = 111
        Height = 29
        Caption = '0.00%'
        TabOrder = 4
      end
      object Panel4: TPanel
        Left = 120
        Top = 56
        Width = 111
        Height = 29
        Caption = '00.00'
        TabOrder = 5
      end
      object Panel11: TPanel
        Left = 11
        Top = 56
        Width = 110
        Height = 29
        Caption = 'Unidade'
        TabOrder = 6
      end
      object Panel12: TPanel
        Left = 363
        Top = 56
        Width = 111
        Height = 29
        Caption = '00.00'
        TabOrder = 7
      end
      object Panel13: TPanel
        Left = 254
        Top = 56
        Width = 110
        Height = 29
        Caption = 'Meta M'#234's'
        TabOrder = 8
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 552
      Width = 959
      Height = 28
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 551
      ExplicitWidth = 955
    end
    object Panel6: TPanel
      Left = 1
      Top = 105
      Width = 959
      Height = 447
      Align = alClient
      TabOrder = 2
      ExplicitWidth = 955
      ExplicitHeight = 446
      object PageControl1: TPageControl
        Left = 7
        Top = 6
        Width = 938
        Height = 435
        ActivePage = TabSheet1
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 930
            Height = 405
            Align = alClient
            TabOrder = 0
            object Label4: TLabel
              Left = 180
              Top = 11
              Width = 63
              Height = 15
              Caption = 'Modalidade'
            end
            object Label6: TLabel
              Left = 155
              Top = 228
              Width = 118
              Height = 15
              Caption = '% de Risco por Aposta'
            end
            object Label5: TLabel
              Left = 8
              Top = 228
              Width = 25
              Height = 15
              Caption = 'ODD'
            end
            object Label3: TLabel
              Left = 8
              Top = 61
              Width = 25
              Height = 15
              Caption = 'Jogo'
            end
            object Label2: TLabel
              Left = 8
              Top = 11
              Width = 47
              Height = 15
              Caption = 'Mercado'
            end
            object Label1: TLabel
              Left = 424
              Top = 11
              Width = 94
              Height = 15
              Caption = 'Jogos em Abertos'
            end
            object Label7: TLabel
              Left = 152
              Top = 61
              Width = 25
              Height = 15
              Caption = 'Jogo'
            end
            object ComboBox2: TComboBox
              Left = 8
              Top = 32
              Width = 121
              Height = 23
              TabOrder = 0
              Text = 'ComboBox2'
            end
            object Edit1: TEdit
              Left = 8
              Top = 82
              Width = 121
              Height = 23
              TabOrder = 1
              Text = 'Edit1'
            end
            object Edit2: TEdit
              Left = 152
              Top = 82
              Width = 121
              Height = 23
              TabOrder = 2
              Text = 'Edit2'
            end
            object ComboBox3: TComboBox
              Left = 180
              Top = 32
              Width = 145
              Height = 23
              TabOrder = 3
              Text = 'ComboBox3'
            end
            object Edit3: TEdit
              Left = 8
              Top = 249
              Width = 121
              Height = 23
              TabOrder = 4
              Text = 'Edit3'
            end
            object RadioButton1: TRadioButton
              Left = 19
              Top = 296
              Width = 113
              Height = 17
              Caption = '1/2 Unidade'
              TabOrder = 5
            end
            object RadioButton2: TRadioButton
              Left = 19
              Top = 319
              Width = 113
              Height = 17
              Caption = '1 Unidade'
              TabOrder = 6
            end
            object Button1: TButton
              Left = 40
              Top = 118
              Width = 75
              Height = 25
              Caption = 'Adicionar'
              TabOrder = 7
            end
            object Button2: TButton
              Left = 152
              Top = 118
              Width = 75
              Height = 25
              Caption = 'Limpar'
              TabOrder = 8
            end
            object Panel9: TPanel
              Left = 132
              Top = 296
              Width = 205
              Height = 41
              Caption = 'Poss'#237'vel Retorno'
              TabOrder = 9
            end
            object Button3: TButton
              Left = 40
              Top = 368
              Width = 75
              Height = 25
              Caption = 'Finalizar'
              TabOrder = 10
            end
            object Button4: TButton
              Left = 152
              Top = 368
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 11
            end
            object Panel10: TPanel
              Left = 155
              Top = 249
              Width = 126
              Height = 24
              Caption = 'Panel10'
              TabOrder = 12
            end
            object ListView2: TListView
              Left = 424
              Top = 32
              Width = 497
              Height = 174
              Columns = <>
              TabOrder = 13
            end
            object Button5: TButton
              Left = 424
              Top = 212
              Width = 150
              Height = 25
              Caption = 'Button5'
              TabOrder = 14
            end
          end
          object ListView1: TListView
            Left = 8
            Top = 278
            Width = 329
            Height = 73
            Columns = <
              item
                Caption = 'Mercado'
              end
              item
                Caption = 'Time 1'
              end
              item
                Caption = 'Time 2'
              end>
            TabOrder = 1
            ViewStyle = vsReport
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 930
            Height = 405
            Align = alClient
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 364
    Top = 8
    Width = 111
    Height = 29
    Caption = '00.00'
    TabOrder = 1
  end
  object Panel15: TPanel
    Left = 255
    Top = 8
    Width = 110
    Height = 29
    Caption = 'Banca Atual'
    TabOrder = 2
  end
end