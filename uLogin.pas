﻿unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDados, uDataModule, DateUtils,
  Vcl.Imaging.jpeg;
type
  Tfml_login = class(TForm)
    edt_user: TEdit;
    edt_senha: TEdit;
    p_central: TPanel;
    btn_ok: TButton;
    btn_cancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    l_msg_login: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  function validarLogin(strUser : string; StrSenha : string): boolean;
  function login_automatico2(): boolean;
  procedure gravar_login_automatico;

  end;

var
  fml_login: Tfml_login;
  Query : TDataModule1;

implementation

{$R *.dfm}


{ Tfml_login }

procedure Tfml_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query.Destroy;
end;

procedure Tfml_login.FormCreate(Sender: TObject);
begin
  Query := TdataModule1.Create(nil);

  login_automatico2;

  if edt_user.Text <> '' then
    begin
      btn_ok.TabOrder := 0;
      btn_cancel.TabOrder := 1;
      edt_user.TabOrder := 2;
      edt_senha.TabOrder := 3;
    end;

end;

procedure Tfml_login.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btn_ok.Click;
end;

procedure Tfml_login.gravar_login_automatico;
begin
  try
    if CheckBox1.Checked = true then
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('update CONFIGURACAO set NOME_ESTACAO = :pEstacao, LOGIN_AUTOMATICO = ''s'', USUARIO_GRAVADO = :pUsuario, SENHA_GRAVADA = :pSenha where ID_USUARIO = :pUser');
        query.Query1.ParamByName('pEstacao').AsString := nome_maquina;
        query.Query1.ParamByName('pUsuario').AsString := edt_user.Text;
        query.Query1.ParamByName('pSenha').AsString := edt_senha.Text;
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.ExecSQL;


      end
      else
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('update CONFIGURACAO set NOME_ESTACAO = :pEstacao, LOGIN_AUTOMATICO = ''n'', USUARIO_GRAVADO = :pUsuario, SENHA_GRAVADA = :pSenha where ID_USUARIO = :pUser');
        query.Query1.ParamByName('pEstacao').AsString := nome_maquina;
        query.Query1.ParamByName('pUsuario').AsString := edt_user.Text;
        query.Query1.ParamByName('pSenha').AsString := edt_senha.Text;
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.ExecSQL;
      end;

  finally

  end;


end;


function Tfml_login.login_automatico2: boolean;
var
  login_automatico : string;
  usuario, senha : string;
  validar_quantidade_usuario : integer;
begin
  try
    nome_maquina := GetEnvironmentVariable('COMPUTERNAME');

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select USUARIO_GRAVADO as usuario, SENHA_GRAVADA as senha from CONFIGURACAO where NOME_ESTACAO = :pEstacao and LOGIN_AUTOMATICO = ''s''');
    query.Query1.ParamByName('pEstacao').AsString := nome_maquina;
    query.Query1.Open();

    validar_quantidade_usuario := query.Query1.RecordCount;


    if validar_quantidade_usuario = 1 then
      begin
        usuario := query.Query1.FieldByName('usuario').AsString;
        senha := query.Query1.FieldByName('senha').AsString;

        edt_user.Text := usuario;
        edt_senha.Text := senha;

        CheckBox1.Checked := true;
        result := true;
      end
      else
      if validar_quantidade_usuario > 1 then
         begin
          ShowMessage('existe varios usuarios para login automatico nessa estação');

          query.Query1.SQL.Clear;
          query.Query1.sql.Add('update configuracao set login_automatico = ''n''');
          query.Query1.ExecSQL;

         end;

  finally

  end;
end;

procedure Tfml_login.Timer1Timer(Sender: TObject);
var
  i : integer;
  t : TTime;
begin

end;

procedure Tfml_login.btn_cancelClick(Sender: TObject);
begin
  halt;
end;

procedure Tfml_login.btn_okClick(Sender: TObject);
var
  edtUser, edtSenha : string;
begin
  edtUser := edt_user.Text;
  edtSenha := edt_senha.Text;

  if validarLogin(edtUser, edtSenha) then
    begin
      gravar_login_automatico;
      self.Close;
    end
    else
    begin
      l_msg_login.Caption := 'Senha ou usuário incorreto';
      edt_senha.Clear;
      CheckBox1.Checked := false;
      edt_user.SetFocus;
    end;

end;

function Tfml_login.validarLogin(strUser, StrSenha: string): boolean;
var
  usuario, senha : string;
  i : integer;
begin
  result := false;
  with Query.Query1 do
    begin
      sql.clear;
      sql.Add('SELECT ID_USUARIO, NOME, SENHA FROM USUARIOS');
      open;

      while not Query.Query1.Eof do
        begin
          usuario := FieldByName('NOME').AsString;
          senha   := FieldByName('SENHA').AsString;
          id_usuarioLogado := FieldByName('ID_USUARIO').AsInteger;
          nome_usuarioLogado := FieldByName('NOME').AsString;

          if usuario = strUser then
            begin
              if senha = strSenha then
                begin
                  result := true;
                end;
              Break
            end;
          Next;
        end;
    end;


end;

end.