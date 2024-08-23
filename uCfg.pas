﻿unit uCfg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uDataModule, uDados,
  Vcl.ComCtrls;

type
  Tfml_cfg = class(TForm)
    p_central_cfg: TPanel;
    btn_adicionar_finalidade: TButton;
    btn_adicionar_origem: TButton;
    btn_adicionar_item: TButton;
    btn_adicionar_conta: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    l_mediDiaria_planejada_atual: TLabel;
    btn_adicionar_mediaDiaria: TButton;
    edt_mediaDiaria_planejada: TEdit;
    GroupBox3: TGroupBox;
    btn_cfg_ok: TButton;
    data_cfg_inicio: TDateTimePicker;
    GroupBox4: TGroupBox;
    r_porcent: TRadioButton;
    r_valor: TRadioButton;
    Label2: TLabel;
    p_btn_cfg_relatorio_anual: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btn_adicionar_finalidadeClick(Sender: TObject);
    procedure btn_adicionar_itemClick(Sender: TObject);
    procedure btn_adicionar_origemClick(Sender: TObject);
    procedure btn_adicionar_contaClick(Sender: TObject);
    procedure edt_mediaDiaria_planejadaChange(Sender: TObject);
    procedure edt_mediaDiaria_planejadaClick(Sender: TObject);
    procedure btn_adicionar_mediaDiariaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cfg_okClick(Sender: TObject);
    procedure p_btn_cfg_relatorio_anualClick(Sender: TObject);
    procedure r_porcentClick(Sender: TObject);
    procedure r_valorClick(Sender: TObject);
    procedure p_central_cfgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validar_texto(texto : string): boolean;

  end;


var
  fml_cfg: Tfml_cfg;
  Query : TDataModule1;
  dados : dadosGlobais;

implementation

{$R *.dfm}

procedure Tfml_cfg.btn_adicionar_contaClick(Sender: TObject);
var
  texto : string;
begin
  try
    texto := inputbox('Digite a Conta', '', '');

    if validar_texto(texto) then
      begin
        With Query.Query1 do
          begin
            sql.Clear;
            sql.Add('INSERT INTO CONTA(CONTA, ID_USUARIO) VALUES (:pConta, :pUser)');
            ParamByName('pConta').AsString := texto;
            ParamByName('puser').AsInteger := id_usuarioLogado;
            ExecSQL();
          end;      
      end
      else
      begin
        ShowMessage('Quantidade de letras precisa ser maior ou igual a 3 ou o texto contém caracteres especiais!');
      end;

  except
    ShowMessage('Erro ao cadastrar CONTA!');
  end;

  dados.listas;
end;

procedure Tfml_cfg.btn_adicionar_finalidadeClick(Sender: TObject);
var
  texto : string;
begin
  try
    texto := inputbox('Digite a Finalidade','','');

    if validar_texto(texto) then
      begin
        With Query.Query1 do
          begin
            sql.Clear;
            sql.Add('INSERT INTO FINALIDADE (FINALIDADE, ID_USUARIO) VALUES (:pFinalidade, :pUser)');
            ParamByName('pFinalidade').AsString := texto;
            ParamByName('puser').AsInteger := id_usuarioLogado;
            ExecSQL();
          end;
      end
      else
      begin
        ShowMessage('Quantidade de letras precisa ser maior ou igual a 3 ou o texto contém caracteres especiais!');
      end;

  except
    showMessage('Erro ao adicionar FINALIDADE');

  end;


  dados.listas;
end;

procedure Tfml_cfg.btn_adicionar_itemClick(Sender: TObject);
var
  texto : string;
begin
  try
  texto := inputbox('Digite o Item', '', '');

    if validar_texto(texto) then
      begin
        With Query.Query1 do
          begin
            sql.Clear;
            sql.Add('INSERT INTO ITEM (ITEM, ID_USUARIO) VALUES (:pItem, :pUser)');
            ParamByName('pItem').AsString := texto;
            ParamByName('pUser').AsInteger := id_usuarioLogado;
            ExecSQL();
          end;
      end
      else
      begin
        ShowMessage('Quantidade de letras precisa ser maior ou igual a 3 ou o texto contém caracteres especiais!');
      end;

  except
    ShowMessage('Erro ao cadastrar ITEM!');
  end;

  dados.listas;
end;

procedure Tfml_cfg.btn_adicionar_mediaDiariaClick(Sender: TObject);
begin
  try
    if edt_mediaDiaria_planejada.Text	<> '' then
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('update CONFIGURACAO set MEDIA_DIARIA_PLANEJADA = :pMedia_planejada where ID_USUARIO = :pUser');
        query.Query1.ParamByName('pMedia_planejada').AsFloat := StrToFloat(edt_mediaDiaria_planejada.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.ExecSQL;

        mediaDiaria_planejada := StrToFloat(edt_mediaDiaria_planejada.Text);

        l_mediDiaria_planejada_atual.Caption := formatFloat('#,##0.00', mediaDiaria_planejada);

        edt_mediaDiaria_planejada.Clear;
      end;

  except
    ShowMessage('Erro ao adicionar Média Diária!');
  end;
end;

procedure Tfml_cfg.btn_adicionar_origemClick(Sender: TObject);
var
  texto : string;
begin
  try
    texto := inputbox('Digite a Origem','','');

    if validar_texto(texto) then
      begin
        With Query.Query1 do
          begin
            sql.Clear;
            sql.Add('INSERT INTO ORIGEM(ORIGEM, ID_USUARIO) VALUES (:pOrigem, :pUser)');
            ParamByName('pOrigem').AsString := texto;
            ParamByName('pUser').AsInteger := id_usuarioLogado;
            ExecSQL();
          end;
      end
      else
      begin
        ShowMessage('Quantidade de letras precisa ser maior ou igual a 3 ou o texto contém caracteres especiais!');
      end;
  
  except
    ShowMessage('Erro ao cadastrar ORIGEM!');
  end;
  

  dados.listas;
end;


procedure Tfml_cfg.btn_cfg_okClick(Sender: TObject);
begin
  try
    if Application.MessageBox('Gravar Data de Inicio', '', MB_YESNO) = mrYes then
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('update CONFIGURACAO set DATA_INICIO = :pDate where ID_USUARIO = :pUser');
        query.Query1.ParamByName('pDate').AsDate := data_cfg_inicio.Date;
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.ExecSQL;
      end
      else
      begin
        ShowMessage('Gravação Cancelada!!!');
      end;
    
  except
    ShowMessage('Erro ao adicionar Data de Inicio das Atividades');
  end;

  data_inicio := data_cfg_inicio.Date;
end;

procedure Tfml_cfg.edt_mediaDiaria_planejadaChange(Sender: TObject);
var
  i : integer;
  n, v : string;
  o : boolean;
begin
  //Mascara para edt_valor_entrada aceitar somente números e ,
  n := '0123456789,';
  v := edt_mediaDiaria_planejada.Text;

  if edt_mediaDiaria_planejada.Text <> '' then
    begin
      for I := 1 to High(n) do
        begin
          if n[i] = v[high(v)] then
            begin
              o := true;
            end;
        end;

     if not o then
      begin
        Delete(v, high(v), 1);
      end;

     edt_mediaDiaria_planejada.Text := v;
     edt_mediaDiaria_planejada.SelStart := length(v);
    end;

end;

procedure Tfml_cfg.edt_mediaDiaria_planejadaClick(Sender: TObject);
begin
  edt_mediaDiaria_planejada.SetFocus;
end;

procedure Tfml_cfg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query.Destroy;
  open_configuracao := false;
end;

procedure Tfml_cfg.FormCreate(Sender: TObject);
begin
  Query := TDataModule1.Create(nil);

  data_cfg_inicio.Date := data_inicio;
  l_mediDiaria_planejada_atual.Caption := formatFloat('#,##0.00', mediaDiaria_planejada);

  case variacao_relatorio_anual of
    1 : r_porcent.Checked := true;
    2 : r_valor.Checked := true;
  end;

  p_btn_cfg_relatorio_anual.Visible := false;
end;

procedure Tfml_cfg.p_btn_cfg_relatorio_anualClick(Sender: TObject);
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('update CONFIGURACAO set VARIACAO_RELATORIO_ANUAL = :pVariacao where ID_USUARIO = :pUser');
    query.Query1.ParamByName('pVariacao').AsInteger := variacao_relatorio_anual;
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.ExecSQL;

    p_btn_cfg_relatorio_anual.Visible := false;

  except
    ShowMessage('Erro na variação de relatório anula - TELA DE CONFIGURACAO')
  end;
end;

procedure Tfml_cfg.p_central_cfgClick(Sender: TObject);
begin
  self.BringToFront;
end;

procedure Tfml_cfg.r_porcentClick(Sender: TObject);
begin
  variacao_relatorio_anual := 1; //em porcentagem
  p_btn_cfg_relatorio_anual.Visible := true;
end;

procedure Tfml_cfg.r_valorClick(Sender: TObject);
begin
  variacao_relatorio_anual := 2;  //em valor
  p_btn_cfg_relatorio_anual.Visible := true;
end;

function Tfml_cfg.validar_texto(texto: string): boolean;
var
  i, x, qtd_letra : integer;
  letras : string;
  caracteres_invalido : string;
begin
  try
    letras := 'qwertyuiopasdfghjklçzxcvbnm';
    caracteres_invalido := '123456789!@#$%¨*()_+<>:?^`|*-´]~;.,\/';
    qtd_letra := 0;
  
    for I := 1 to High(texto) do
      begin
        for x := 1 to High(letras) do
          begin
            if UpperCase(texto[i]) = UpperCase(letras[x]) then
                qtd_letra := qtd_letra + 1
          end;

        for x := 1 to High(caracteres_invalido) do
          begin
            if UpperCase(texto[i]) = caracteres_invalido[x] then
              begin
                qtd_letra := 0;
                break
              end;
          end;
      end;

    if qtd_letra > 2 then
      begin
        result := true;
      end
      else
      begin
        result := false;
      end;
  except
    ShowMessage('Erro na função para validar o texto');
  end;
end;

end.
