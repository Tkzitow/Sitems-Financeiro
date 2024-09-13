﻿
unit uEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, uDataModule,
  uLogin, uDados, Data.FMTBcd, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg;

type
  Tfml_entradas = class(TForm)
    Panel1: TPanel;
    cb_origem_entrada: TComboBox;
    cb_conta_entrada: TComboBox;
    grid_data_entrada: TDateTimePicker;
    edt_valor_entrada: TEdit;
    edt_obs_entrada: TEdit;
    btn_ok_entrada: TButton;
    btn_cancel_entrada: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btn_limpar_entrada: TButton;
    Panel2: TPanel;
    edt_entrada_id: TEdit;
    Label6: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    procedure btn_ok_entradaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_limpar_entradaClick(Sender: TObject);
    procedure edt_valor_entradaClick(Sender: TObject);
    procedure edt_obs_entradaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancel_entradaClick(Sender: TObject);
    procedure edt_valor_entradaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_entrada_idKeyPress(Sender: TObject; var Key: Char);
    procedure edt_entrada_idClick(Sender: TObject);
    procedure btn_buscar_id_entradaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure entrada_cadastro;
    procedure adicionar_cb_entrada;
    procedure AtivarDesativarComponentesEntrada;
    procedure EditarRegistroEntrada;
  end;

var
  fml_entradas: Tfml_entradas;
  Query : TDataModule1;
  dados : dadosGlobais;
  id_entrada : integer;
  origem_entrada : string;
  conta_entrada : string;
  data_entrada : TDate;
  valor_entrada : double;
  obs_entrada : string;
  validar_edicao_entrada_id : boolean;
  ativar_desativar_componentes : boolean;
  texto_insert_or_update : string;


implementation

{$R *.dfm}

uses uBuscarIDEntrada;

{ Tfml_entradas }

procedure Tfml_entradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  open_entradas := false;
  Query.Destroy;
end;

procedure Tfml_entradas.FormCreate(Sender: TObject);
begin
  adicionar_cb_entrada;

  Query := TDataModule1.Create(nil);
  id_entrada := 0;
  validar_edicao_entrada_id := false;

  ativar_desativar_componentes := false;

  AtivarDesativarComponentesEntrada;
end;

procedure Tfml_entradas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btn_ok_entrada.Click;
end;

procedure Tfml_entradas.FormShow(Sender: TObject);
begin
  edt_entrada_id.SetFocus;
end;

procedure Tfml_entradas.Image1Click(Sender: TObject);
var
  open_busca_id : TFmlRegistros1;
begin
  open_busca_id := TFmlRegistros1.Create(nil);


  open_busca_id.ShowModal;
  open_busca_id.Destroy;


  if validar_edicao_entrada_id then
    begin
      edt_entrada_id.Text := id_entrada.ToString;
      EditarRegistroEntrada;
    end;


end;

procedure Tfml_entradas.Panel1Click(Sender: TObject);
begin
  self.BringToFront;
end;

procedure Tfml_entradas.adicionar_cb_entrada;
var
  I: Integer;
begin
  for I := 0 to High(arrOrigem) do
    begin
      cb_origem_entrada.Items.Add(arrOrigem[i]);
    end;

  for I := 0 to High(arrConta) do
    begin
      cb_conta_entrada.Items.Add(arrConta[i]);
    end;

  grid_data_entrada.Date := now;
end;

procedure Tfml_entradas.AtivarDesativarComponentesEntrada;
begin
  if ativar_desativar_componentes then begin

    cb_origem_entrada.Enabled := true;
    cb_conta_entrada.Enabled := true;
    edt_valor_entrada.Enabled := true;
    grid_data_entrada.Enabled := true;
    edt_obs_entrada.Enabled := true;
    btn_ok_entrada.Enabled := true;
    btn_limpar_entrada.Enabled := true;

    ativar_desativar_componentes := false
  end
  else
  begin
    cb_origem_entrada.Enabled := false;
    cb_conta_entrada.Enabled := false;
    edt_valor_entrada.Enabled := false;
    grid_data_entrada.Enabled := false;
    edt_obs_entrada.Enabled := false;
    btn_ok_entrada.Enabled := false;
    btn_limpar_entrada.Enabled := false;


    ativar_desativar_componentes := true;
  end;
end;

procedure Tfml_entradas.btn_cancel_entradaClick(Sender: TObject);
begin
  self.Close;
end;

procedure Tfml_entradas.btn_limpar_entradaClick(Sender: TObject);
begin
  edt_entrada_id.Enabled := true;;
  cb_origem_entrada.Text := '';
  cb_conta_entrada.Text := '';
  edt_valor_entrada.Clear;
  edt_obs_entrada.Clear;
  grid_data_entrada.Date := now;
  validar_edicao_entrada_id := false;
  edt_entrada_id.Clear;

  AtivarDesativarComponentesEntrada;

  edt_entrada_id.SetFocus;
end;

procedure Tfml_entradas.btn_ok_entradaClick(Sender: TObject);
begin

  if Application.MessageBox('Gravar Entrada', '', MB_YESNO) = mrYes then
    begin
      entrada_cadastro;
      btn_limpar_entrada.Click;
      ShowMessage(texto_insert_or_update);
      edt_entrada_id.SetFocus;
    end
    else
    begin
      ShowMessage('Gravação Cancelada!!!');
    end;
end;

procedure Tfml_entradas.btn_buscar_id_entradaClick(Sender: TObject);
var
  open_busca_id : TFmlRegistros1;
begin
  open_busca_id := TFmlRegistros1.Create(nil);


  open_busca_id.ShowModal;
  open_busca_id.Destroy;


  if validar_edicao_entrada_id then
    begin
      edt_entrada_id.Text := id_entrada.ToString;
      EditarRegistroEntrada;
    end;


end;

procedure Tfml_entradas.Button2Click(Sender: TObject);
begin
  ShowMessage(id_entrada.ToString);
end;

procedure Tfml_entradas.EditarRegistroEntrada;
begin
  if edt_entrada_id.Text <> '' then
  begin
    id_entrada := strtoint(edt_entrada_id.Text);

    if id_entrada > 0 then
    begin
      Query.Query1.SQL.Clear;
      Query.Query1.SQL.Add('select origem.origem as origem,');
      Query.Query1.SQL.Add('  conta.conta as conta,');
      Query.Query1.SQL.Add('  data_entrada as data,');
      Query.Query1.SQL.Add('  valor_entrada as valor,');
      Query.Query1.SQL.Add('  obs_entrada as obs');
      Query.Query1.SQL.Add('from entradas');
      Query.Query1.SQL.Add('inner join origem');
      Query.Query1.SQL.Add('on entradas.id_origem = origem.id_origem');
      Query.Query1.SQL.Add('inner join conta');
      Query.Query1.SQL.Add('on entradas.id_conta = conta.id_conta');
      Query.Query1.SQL.Add('where id_entrada = :pId');
      Query.Query1.SQL.Add('and entradas.id_usuario = :pUser');
      Query.Query1.ParamByName('pId').AsInteger := id_entrada;
      Query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
      Query.Query1.Open();

      if not Query.Query1.Eof then
      begin
        AtivarDesativarComponentesEntrada;

        origem_entrada := Query.Query1.FieldByName('origem').AsString;
        conta_entrada := Query.Query1.FieldByName('conta').AsString;
        data_entrada := Query.Query1.FieldByName('data').AsDateTime;
        valor_entrada := Query.Query1.FieldByName('valor').AsFloat;
        obs_entrada := Query.Query1.FieldByName('obs').AsString;

        cb_origem_entrada.Text := origem_entrada;
        cb_conta_entrada.Text := conta_entrada;
        edt_valor_entrada.Text := formatfloat('#,##0.00', valor_entrada);
        grid_data_entrada.Date := data_entrada;
        edt_obs_entrada.Text := obs_entrada;
        validar_edicao_entrada_id := true;

        cb_origem_entrada.SetFocus;
        edt_entrada_id.Enabled := false;
      end
      else
      begin
        ShowMessage('O ID -  ' + id_entrada.ToString +
          ' não existe nos registros!');
        edt_entrada_id.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Campo ID vazio');
    end;

  end
  else
  begin
    AtivarDesativarComponentesEntrada;

    edt_entrada_id.Enabled := false;
    cb_origem_entrada.SetFocus;
  end;
end;

procedure Tfml_entradas.edt_entrada_idClick(Sender: TObject);
begin
  edt_entrada_id.SetFocus;
end;

procedure Tfml_entradas.edt_entrada_idKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if key = #13 then begin
      EditarRegistroEntrada;

    end;
  finally

  end;
end;

procedure Tfml_entradas.edt_obs_entradaClick(Sender: TObject);
begin
  edt_obs_entrada.SetFocus;
end;

procedure Tfml_entradas.edt_valor_entradaChange(Sender: TObject);
begin
  TratarEditValor(edt_valor_entrada);
end;

procedure Tfml_entradas.edt_valor_entradaClick(Sender: TObject);
begin
  edt_valor_entrada.SetFocus;
end;

procedure Tfml_entradas.entrada_cadastro;
begin
  try
    texto_insert_or_update := '';
    if validar_edicao_entrada_id then
      begin
        with query.Query1 do begin
          sql.Clear;
          sql.Add('update ENTRADAS set');
          sql.Add(' ID_ORIGEM = :pOrigem,');
          sql.Add(' ID_CONTA = :pConta,');
          sql.Add(' DATA_ENTRADA = :pData,');
          sql.Add(' VALOR_ENTRADA = :pValor,');
          sql.Add(' OBS_ENTRADA = :pObs');
          sql.Add('where ID_ENTRADA = :pId');
          ParamByName('pOrigem').AsInteger := dados.localizar_id(cb_origem_entrada.Text, 3);
          ParamByName('pConta').AsInteger := dados.localizar_id(cb_conta_entrada.Text, 4);
          ParamByName('pData').AsDate := grid_data_entrada.Date;
          ParamByName('pValor').AsFloat := StrToFloat(edt_valor_entrada.Text);
          ParamByName('pObs').AsString := edt_obs_entrada.Text;
          ParamByName('pId').AsInteger := id_entrada;
          ExecSQL;

          texto_insert_or_update := 'A entrada ' + id_entrada.ToString + ' foi editada com sucesso!!';

        end;
      end
      else
      begin
        With Query.Query1 do begin
          sql.Clear;
          sql.Add('insert into ENTRADAS ');
          sql.Add('(ID_ORIGEM, ID_CONTA, DATA_ENTRADA, VALOR_ENTRADA, OBS_ENTRADA, ID_USUARIO) VALUES ');
          sql.Add('(:pOrigem, :pConta, :pData, :pValor, :pObs, :pUser)');
          ParamByName('pOrigem').AsInteger := dados.localizar_id(cb_origem_entrada.Text, 3);
          ParamByName('pConta').AsInteger := dados.localizar_id(cb_conta_entrada.Text, 4);
          ParamByName('pData').AsDate := grid_data_entrada.Date;
          ParamByName('pValor').AsFloat := StrToFloat(edt_valor_entrada.Text);
          ParamByName('pObs').AsString := edt_obs_entrada.Text;
          ParamByName('pUser').AsInteger := id_usuarioLogado;
          ExecSQL;


          sql.Clear;
          sql.Add('select ID_ENTRADA from ENTRADAS where ID_USUARIO = :pUser order by ID_ENTRADA desc limit 0,1');
          ParamByName('pUser').AsInteger := id_usuarioLogado;
          open;

          id_entrada := FieldByName('ID_ENTRADA').AsInteger;

          texto_insert_or_update := 'A entrada ' + id_entrada.ToString + ' foi criada com sucesso!!';
        end;
       end;

  except
    ShowMessage('Erro ao cadastrar registro de ENTRADA');
  end;
end;

end.
