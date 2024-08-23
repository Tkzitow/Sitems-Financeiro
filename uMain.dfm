object fml_main: Tfml_main
  Left = 289
  Top = 69
  BorderStyle = bsSingle
  Caption = 'Tela Principal'
  ClientHeight = 659
  ClientWidth = 1197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object p_Main_central: TPanel
    Left = 0
    Top = 0
    Width = 1197
    Height = 659
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1193
    ExplicitHeight = 658
    object p_left: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 638
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 637
      DesignSize = (
        136
        638)
      object p_cadastros_saidas: TPanel
        Left = 1
        Top = 61
        Width = 134
        Height = 60
        Align = alTop
        Caption = 'Sa'#237'das'
        TabOrder = 0
        OnClick = p_cadastros_saidasClick
        OnMouseLeave = p_cadastros_saidasMouseLeave
        OnMouseMove = p_cadastros_saidasMouseMove
      end
      object p_relatorios: TPanel
        Left = 1
        Top = 181
        Width = 134
        Height = 60
        Align = alTop
        Caption = 'Relat'#243'rios'
        TabOrder = 1
        OnClick = p_relatoriosClick
        OnMouseLeave = p_relatoriosMouseLeave
        OnMouseMove = p_relatoriosMouseMove
      end
      object p_comparativos: TPanel
        Left = 1
        Top = 121
        Width = 134
        Height = 60
        Align = alTop
        Caption = 'Comparativos'
        TabOrder = 2
        OnClick = p_comparativosClick
        OnMouseLeave = p_comparativosMouseLeave
        OnMouseMove = p_comparativosMouseMove
      end
      object p_configuracao: TPanel
        Left = 1
        Top = 544
        Width = 134
        Height = 60
        Align = alCustom
        Caption = 'Configura'#231#227'o'
        TabOrder = 3
        OnClick = p_configuracaoClick
        OnMouseLeave = p_configuracaoMouseLeave
        OnMouseMove = p_configuracaoMouseMove
      end
      object p_cadastro_entradas: TPanel
        Left = 1
        Top = 1
        Width = 134
        Height = 60
        Align = alTop
        Caption = 'Entradas'
        TabOrder = 4
        OnClick = p_cadastro_entradasClick
        OnMouseLeave = p_cadastro_entradasMouseLeave
        OnMouseMove = p_cadastro_entradasMouseMove
      end
      object p_sair: TPanel
        Left = -32
        Top = 610
        Width = 185
        Height = 23
        Anchors = [akLeft, akBottom]
        Caption = 'Sair'
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
        OnClick = p_sairClick
        OnMouseLeave = p_sairMouseLeave
        OnMouseMove = p_sairMouseMove
        ExplicitTop = 609
      end
      object p_investimentos: TPanel
        Left = 1
        Top = 322
        Width = 134
        Height = 60
        Align = alTop
        Caption = 'Investimentos'
        TabOrder = 6
        OnMouseLeave = p_investimentosMouseLeave
        OnMouseMove = p_investimentosMouseMove
      end
      object pRelatorioAnual: TPanel
        Left = 1
        Top = 295
        Width = 134
        Height = 27
        Align = alTop
        Caption = 'Anual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
        OnClick = pRelatorioAnualClick
        OnMouseLeave = pRelatorioAnualMouseLeave
        OnMouseMove = pRelatorioAnualMouseMove
      end
      object pRelatorioBusca: TPanel
        Left = 1
        Top = 268
        Width = 134
        Height = 27
        Align = alTop
        Caption = 'Busca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Visible = False
        OnClick = pRelatorioBuscaClick
        OnMouseLeave = pRelatorioBuscaMouseLeave
        OnMouseMove = pRelatorioBuscaMouseMove
      end
      object pRelatorioEntradaSaida: TPanel
        Left = 1
        Top = 241
        Width = 134
        Height = 27
        Align = alTop
        Caption = 'Entrada e Saida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Visible = False
        OnClick = pRelatorioEntradaSaidaClick
        OnMouseLeave = pRelatorioEntradaSaidaMouseLeave
        OnMouseMove = pRelatorioEntradaSaidaMouseMove
      end
    end
    object p_central: TPanel
      Left = 137
      Top = 1
      Width = 1059
      Height = 638
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 1055
      ExplicitHeight = 637
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 639
      Width = 1195
      Height = 19
      Color = clWhite
      Panels = <
        item
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Text = 'usu'#225'rio'
          Width = 200
        end
        item
          Alignment = taCenter
          Text = 'data'
          Width = 400
        end
        item
          Alignment = taCenter
          Text = 'dias corridos'
          Width = 200
        end
        item
          Alignment = taCenter
          Text = 'dias restantes'
          Width = 50
        end>
      ExplicitTop = 638
      ExplicitWidth = 1191
    end
  end
end