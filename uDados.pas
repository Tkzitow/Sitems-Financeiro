﻿unit uDados;

interface

uses uDataModule, Messages, Vcl.Dialogs, SysUtils, Vcl.StdCtrls;

type
  dadosGlobais = class

    published
      function localizar_id(strTexto : string; intTabela : integer): integer;
      function localizar_mes(strTexto : string): integer;
      procedure listas;

  end;

var
  id_usuarioLogado : integer;
  nome_usuarioLogado : string;

  data_inicio : TDateTime;

  variacao_relatorio_anual : integer;

  arrOrigem, arrConta, arrFinalidade, arrItem : array of string;
  arr_id_origem, arr_id_conta, arr_id_finalidade, arr_id_item : array of integer;
  open_entradas, open_saidas, open_comparativo, open_relatorio, open_configuracao, open_anual, open_SaidaEntrada, open_busca : boolean;

  dias_corridos, dias_restantes, dias_qtd_mes : integer;

  nome_maquina : string;
  login_automatico : boolean;

  mediaDiaria_planejada : double;


  testeeeeee : string;

procedure TratarEditValor(Sender: TObject);


implementation

{ dadosGlobais }

procedure dadosGlobais.listas;
var
  i : integer;
  query : TDataModule1;

begin
  Query := TDataModule1.Create(nil);
  i := 0;

  setlength(arrOrigem, 0);
  setlength(arrConta, 0);
  setlength(arrItem, 0);
  setlength(arrFinalidade, 0);
  setlength(arr_id_origem, 0);
  setlength(arr_id_conta, 0);
  setlength(arr_id_item, 0);
  setlength(arr_id_finalidade, 0);


  With Query.Query1 do
    begin
      sql.Clear;
      sql.Add('select ORIGEM, ID_ORIGEM from ORIGEM where ID_USUARIO = :pUser order by ORIGEM asc');
      ParamByName('pUser').AsInteger :=  id_usuarioLogado;
      open;

      while not Eof do
        begin
          SetLength(arrOrigem,  length(arrOrigem) + 1);
          SetLength(arr_id_origem, length(arr_id_origem) + 1);

          arrOrigem[i] := FieldByName('ORIGEM').AsString;
          arr_id_origem[i] := FieldByName('ID_ORIGEM').AsInteger;

          i := i + 1;
          next;
        end;
    end;

  i := 0;
  With Query.Query1 do
    begin
      sql.Clear;
      sql.Add('select CONTA, ID_CONTA from CONTA where ID_USUARIO = :pUser order by CONTA asc');
      ParamByName('pUser').AsInteger :=  id_usuarioLogado;
      open;

      while not Eof do
        begin
          SetLength(arrConta,  length(arrConta) + 1);
          SetLength(arr_id_conta, length(arr_id_conta) + 1);

          arrConta[i] := FieldByName('CONTA').AsString;
          arr_id_conta[i] := FieldByName('ID_CONTA').AsInteger;

          i := i + 1;
          next;
        end;
    end;

  i := 0;
  With Query.Query1 do
    begin
      sql.Clear;
      sql.Add('select FINALIDADE, ID_FINALIDADE from FINALIDADE where ID_USUARIO = :pUser order by FINALIDADE asc');
      ParamByName('pUser').AsInteger :=  id_usuarioLogado;
      open;

      while not Eof do
        begin
          SetLength(arrFinalidade,  length(arrFinalidade) + 1);
          SetLength(arr_id_finalidade, length(arr_id_finalidade) + 1);

          arrFinalidade[i] := FieldByName('FINALIDADE').AsString;
          arr_id_finalidade[i] := FieldByName('ID_FINALIDADE').AsInteger;

          i := i + 1;
          next;
        end;
    end;

  i := 0;
  With Query.Query1 do
    begin
      sql.Clear;
      sql.Add('select ITEM, ID_ITEM from ITEM where ID_USUARIO = :pUser order by ITEM asc');
      ParamByName('pUser').AsInteger :=  id_usuarioLogado;
      open;

      while not Eof do
        begin
          SetLength(arrItem,  length(arrItem) + 1);
          SetLength(arr_id_item, length(arr_id_item) + 1);

          arrItem[i] := FieldByName('ITEM').AsString;
          arr_id_item[i] := FieldByName('ID_ITEM').AsInteger;

          i := i + 1;
          next;
        end;
    end;


end;

function dadosGlobais.localizar_id(strTexto : string; intTabela : integer): integer;
var
  I: Integer;
begin
  //tabela finalidade = 1
  //tabela item       = 2
  //tabela origem     = 3
  //tabela conta      = 4

  try

    case intTabela of
      1 : begin
            for I := 0 to high(arrFinalidade) do
              begin
                if Uppercase(strTexto) = Uppercase(arrFinalidade[i]) then
                  begin
                    result := arr_id_finalidade[i];
                    break
                  end;
              end;

          end;

      2 : begin
            for I := 0 to high(arrItem) do
              begin
                if UpperCase(strTexto) = Uppercase(arrItem[i]) then
                  begin
                    result := arr_id_item[i];
                    break
                  end;
              end;

          end;

      3 : begin
            for I := 0 to high(arrOrigem) do
              begin
                if Uppercase(strTexto) = Uppercase(arrOrigem[i]) then
                  begin
                    result := arr_id_origem[i];
                  end;
              end;

          end;

      4 : begin
            for I := 0 to high(arrConta) do
              begin
                if Uppercase(strTexto) = Uppercase(arrConta[i]) then
                  begin
                    result := arr_id_conta[i];
                  end;
              end;

          end;
    end;

  except

    ShowMessage('Erro ao carregar informações do usuário!!!');

  end;


end;

function dadosGlobais.localizar_mes(strTexto: string): integer;
begin
  if strTexto = 'janeiro' then
    result := 01;

  if strTexto = 'fevereiro' then
    result := 02;

  if strTexto = 'março' then
    result := 03;

  if strTexto = 'abril' then
    result := 04;

  if strTexto = 'maio' then
    result := 05;

  if strTexto = 'junho' then
    result := 06;

  if strTexto = 'julho' then
    result := 07;

  if strTexto = 'agosto' then
    result := 08;

  if strTexto = 'setembro' then
    result := 09;

  if strTexto = 'outubro' then
    result := 10;

  if strTexto = 'novembro' then
    result := 11;

  if strTexto = 'dezembro' then
    result := 12;

end;

procedure TratarEditValor(Sender: TObject);
var
  i : integer;
  n, v : string;
  o : boolean;
begin
  //Mascara para edt_valor_entrada aceitar somente números e ,
  n := '0123456789,';
  v := TEdit(Sender).Text;

  if TEdit(Sender).Text <> '' then
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

     TEdit(Sender).Text := v;
     TEdit(Sender).SelStart := length(v);
    end;
end;

end.