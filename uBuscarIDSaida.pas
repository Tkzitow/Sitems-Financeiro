unit uBuscarIDSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRegistros, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFmlRegistros2 = class(TFmlRegistros)
    btn_selecionar_registro_saida: TButton;
    btn_cancelar_registro_saida: TButton;
    procedure btn_selecionar_registro_saidaClick(Sender: TObject);
    procedure btn_cancelar_registro_saidaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure doubleClickDbGrid; override;
  end;

var
  FmlRegistros2: TFmlRegistros2;

implementation

{$R *.dfm}

uses uSaidas;

procedure TFmlRegistros2.btn_cancelar_registro_saidaClick(Sender: TObject);
begin
  inherited;
  if id_saida < 1 then
    begin
      self.Close;
    end
  else
    begin
     ativar_desativar_componentes := true;
     self.Close;
    end;
end;

procedure TFmlRegistros2.btn_selecionar_registro_saidaClick(Sender: TObject);
begin
  inherited;

  if (dbGridSaidaRegistro.DataSource <> nil) and (dbGridSaidaRegistro.DataSource.DataSet <> nil) and (dbGridSaidaRegistro.DataSource.DataSet.RecordCount > 0) then
    begin
      id_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('id').AsInteger;
      finalidade_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('finalidade').AsString;
      item_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('item').AsString;
      conta_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('conta').AsString;
      item_fixo_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('fixo').AsString;
      valor_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('valor').AsFloat;
      quantidade_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('quantidade').AsInteger;
      data_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('data').AsDateTime;
      obs_saida := dbGridSaidaRegistro.DataSource.DataSet.FieldByName('observação').AsString;
      validar_edicao_saida_id := true;
      ativar_desativar_componentes := true;
      btn_cancelar_registro_saida.Click;


    end;

end;

procedure TFmlRegistros2.doubleClickDbGrid;
begin
  inherited;
  btn_selecionar_registro_saida.Click;
end;

end.
