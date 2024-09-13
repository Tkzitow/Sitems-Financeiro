﻿unit uCfg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uDataModule, uDados, DateUtils,
  Vcl.ComCtrls, ShellAPI;

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
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    lDataProxBackup: TLabel;
    lDataUltBackup: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
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
    procedure Panel1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validar_texto(texto : string): boolean;
    procedure carregarInfTela;

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

procedure Tfml_cfg.carregarInfTela;
begin

    query.Query1.sql.Clear;
    Query.Query1.sql.Add('select DATA_ULT_BACKUP, DATA_PROX_BACKUP, PERIODO_SALVAR_BACKUP from CONFIGURACAO where ID_USUARIO = :pUser');
    Query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    Query.Query1.Open();

    periodo_salvar_backup := Query.Query1.FieldByName('PERIODO_SALVAR_BACKUP').AsInteger;
    data_prox_backup := Query.Query1.FieldByName('DATA_PROX_BACKUP').AsDateTime;
    data_ult_backup := Query.Query1.FieldByName('DATA_ULT_BACKUP').AsDateTime;

    lDataUltBackup.Caption := formatdatetime('dd/mm/yyyy', data_ult_backup);
    lDataProxBackup.Caption := formatdatetime('dd/mm/yyyy', data_prox_backup);

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

  carregarInfTela;

  case variacao_relatorio_anual of
    1 : r_porcent.Checked := true;
    2 : r_valor.Checked := true;
  end;

  p_btn_cfg_relatorio_anual.Visible := false;
end;

procedure Tfml_cfg.Panel1Click(Sender: TObject);
var
  teste : TDateTime;
begin

  carregarInfTela;




end;

procedure Tfml_cfg.Panel2Click(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
    begin
      Options := [fdoPickFolders];
      if execute then
        local_arquivo_backup := filename;



      if Application.MessageBox('Salvar caminho do Backup?','', MB_YESNO) = mrYes then
        begin
          Query.Query1.sql.Clear;
          Query.Query1.sql.Add('update CONFIGURACAO set CAMINHO_BACKUP = :pLocal where ID_USUARIO = :pUser');
          Query.Query1.ParamByName('pLocal').AsString := local_arquivo_backup;
          Query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
          Query.Query1.ExecSQL;

        end;


    end;
end;

procedure Tfml_cfg.Panel3Click(Sender: TObject);
var
  dia_para_backup : integer;
  data : TDateTime;
begin
  periodo_salvar_backup := strtoint(inputBox('Digite o número', 'Digite o número:' + #13 + '1 - Inicio do Mes' + #13 + '2 - Meio do Mês' + #13 + '3 - Final do Mês', ''));

  if periodo_salvar_backup > 0 then
    if Application.MessageBox('Salvar Informação', '', MB_YESNO) = mrYes  then
      begin
        Query.Query1.SQL.Clear;
        query.Query1.SQL.Add('update CONFIGURACAO set PERIODO_SALVAR_BACKUP = :pPeriodo, DATA_PROX_BACKUP = :pData where ID_USUARIO = :pUser');
        query.Query1.ParamByName('pPeriodo').AsInteger := periodo_salvar_backup;

            case periodo_salvar_backup of
              0: dia_para_backup := DaysInMonth(Date);
              1: dia_para_backup := 1;
              2: dia_para_backup := (DaysInMonth(Date) div 2);
              3: dia_para_backup := DaysInMonth(Date);
            end;


        if dia_para_backup < dayof(date) then
          query.Query1.ParamByName('pData').AsDate := IncMonth(EncodeDate(yearOf(date), monthOf(date), dia_para_backup))
        else
          query.Query1.ParamByName('pData').AsDate := EncodeDate(yearOf(date), monthOf(date), dia_para_backup);

        Query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.ExecSQL;



        carregarInfTela;
      end
      else
      begin

      end;
end;

procedure Tfml_cfg.Panel4Click(Sender: TObject);
begin
  if Application.MessageBox('Fazer o BACKUP AGORA', '', MB_YESNO) = mrYes then
    begin
      exec_backup := true;
      dados.backupBanco;
    end
    else
    begin

    end;

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
