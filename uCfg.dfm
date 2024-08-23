object fml_cfg: Tfml_cfg
  Left = 153
  Top = 35
  Caption = 'Configura'#231#245'es'
  ClientHeight = 495
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object p_central_cfg: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 495
    Align = alClient
    TabOrder = 0
    OnClick = p_central_cfgClick
    ExplicitWidth = 694
    ExplicitHeight = 494
    object GroupBox1: TGroupBox
      Left = 32
      Top = 32
      Width = 281
      Height = 153
      Caption = 'Adicionar'
      TabOrder = 0
      object btn_adicionar_finalidade: TButton
        Left = 29
        Top = 40
        Width = 100
        Height = 35
        Caption = 'Finalidade'
        TabOrder = 0
        OnClick = btn_adicionar_finalidadeClick
      end
      object btn_adicionar_origem: TButton
        Left = 29
        Top = 88
        Width = 100
        Height = 35
        Caption = 'Origem'
        TabOrder = 1
        OnClick = btn_adicionar_origemClick
      end
      object btn_adicionar_item: TButton
        Left = 148
        Top = 40
        Width = 100
        Height = 35
        Caption = 'Item'
        TabOrder = 2
        OnClick = btn_adicionar_itemClick
      end
      object btn_adicionar_conta: TButton
        Left = 148
        Top = 88
        Width = 100
        Height = 35
        Caption = 'Conta'
        TabOrder = 3
        OnClick = btn_adicionar_contaClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 32
      Top = 199
      Width = 248
      Height = 122
      Caption = 'Definir M'#233'dia Di'#225'ria'
      TabOrder = 1
      object Label1: TLabel
        Left = 29
        Top = 40
        Width = 64
        Height = 15
        Caption = 'M'#233'dia Atual'
      end
      object l_mediDiaria_planejada_atual: TLabel
        Left = 164
        Top = 40
        Width = 6
        Height = 15
        Caption = '0'
      end
      object btn_adicionar_mediaDiaria: TButton
        Left = 120
        Top = 77
        Width = 105
        Height = 25
        Caption = 'Adicionar M'#233'dia'
        TabOrder = 0
        OnClick = btn_adicionar_mediaDiariaClick
      end
      object edt_mediaDiaria_planejada: TEdit
        Left = 9
        Top = 77
        Width = 84
        Height = 23
        TabOrder = 1
        OnChange = edt_mediaDiaria_planejadaChange
        OnClick = edt_mediaDiaria_planejadaClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 32
      Top = 360
      Width = 153
      Height = 121
      Caption = 'Inicio das atividades'
      TabOrder = 2
      object btn_cfg_ok: TButton
        Left = 38
        Top = 74
        Width = 55
        Height = 25
        Caption = 'Ok'
        TabOrder = 0
        OnClick = btn_cfg_okClick
      end
      object data_cfg_inicio: TDateTimePicker
        Left = 29
        Top = 32
        Width = 98
        Height = 23
        Date = 45447.000000000000000000
        Time = 0.577997349537327000
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 191
      Top = 382
      Width = 282
      Height = 99
      Caption = 'Relat'#243'rio Anual'
      TabOrder = 3
      object Label2: TLabel
        Left = 24
        Top = 24
        Width = 230
        Height = 15
        Caption = 'Amostragem de varia'#231#227'o no relat'#243'rio Anual'
      end
      object r_porcent: TRadioButton
        Left = 24
        Top = 45
        Width = 113
        Height = 17
        Caption = 'Em %'
        TabOrder = 0
        OnClick = r_porcentClick
      end
      object r_valor: TRadioButton
        Left = 24
        Top = 68
        Width = 113
        Height = 17
        Caption = 'Em Valor'
        TabOrder = 1
        OnClick = r_valorClick
      end
      object p_btn_cfg_relatorio_anual: TPanel
        Left = 143
        Top = 45
        Width = 105
        Height = 41
        Caption = 'Confirmar'
        TabOrder = 2
        Visible = False
        OnClick = p_btn_cfg_relatorio_anualClick
      end
    end
  end
end