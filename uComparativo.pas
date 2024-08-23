﻿unit uComparativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, uDados, uDataModule;

type
  Tfml_comparativo = class(TForm)
    p_central_comparativo: TPanel;
    p_top_comparativo: TPanel;
    p_mid_comparativo: TPanel;
    cb_mes1_comparativo: TComboBox;
    cb_mes2_comparativo: TComboBox;
    btn_comparar_comparativo: TButton;
    btn_limpar_comparativo: TButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    l_mes1_comparativo: TLabel;
    l_mes2_comparativo: TLabel;
    l_valor_mes1_comparativo: TLabel;
    l_valor_mes2_comparativo: TLabel;
    Comparativos: TPageControl;
    TabSheet1: TTabSheet;
    ListView_origem_comparativo: TListView;
    ListView_conta_comparativo: TListView;
    ListView_fixo_comparativo: TListView;
    ListView_investimento_comparativo: TListView;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ListView_finalidade_comparativo: TListView;
    ListView_item_comparativo: TListView;
    l_despesas_mes1_comparativo: TLabel;
    l_despesas_mes2_comparativo: TLabel;
    Label5: TLabel;
    l_porcent_receita_comparativo: TLabel;
    l_porcent_despesas_comparativo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView_origem_comparativoAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_fixo_comparativoAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_fixo_comparativoAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_item_comparativoAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_finalidade_comparativoAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure btn_comparar_comparativoClick(Sender: TObject);
    procedure btn_limpar_comparativoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView_investimento_comparativoAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_investimento_comparativoAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_item_comparativoAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_finalidade_comparativoAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_origem_comparativoAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_conta_comparativoAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure p_central_comparativoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure lista_mes;
    procedure finalidade_comparativo;
    procedure item_comparativo;
    procedure origem_comparativo;
    procedure conta_comparativo;
    procedure fixo_comparativo;
    procedure entrada_saida_comparativo;
    procedure outros_comparativos;
    procedure investimentos_comparativos;

    function receita_mes1: double;
    function receita_mes2: double;
    function despesas_mes1: double;
    function despesas_mes2: double;
  end;

var
  fml_comparativo: Tfml_comparativo;
  query : TDataModule1;
  dados : dadosGlobais;

implementation

{$R *.dfm}

procedure Tfml_comparativo.btn_comparar_comparativoClick(Sender: TObject);
begin
  receita_mes1;
  receita_mes2;

  finalidade_comparativo;
  item_comparativo;
  origem_comparativo;
  conta_comparativo;
  fixo_comparativo;
  outros_comparativos;
  investimentos_comparativos;

end;

procedure Tfml_comparativo.btn_limpar_comparativoClick(Sender: TObject);
begin
  ListView_origem_comparativo.Clear;
  ListView_conta_comparativo.Clear;
  ListView_fixo_comparativo.Clear;
  ListView_finalidade_comparativo.Clear;
  ListView_item_comparativo.Clear;

  l_valor_mes1_comparativo.Caption := '';
  l_valor_mes2_comparativo.Caption := '';
  l_despesas_mes1_comparativo.Caption := '';
  l_despesas_mes2_comparativo.Caption := '';

  cb_mes1_comparativo.Text := '';
  cb_mes2_comparativo.Text := '';
  l_mes1_comparativo.Caption := '';
  l_mes2_comparativo.Caption := '';
  l_porcent_receita_comparativo.Caption	 := '';
  l_porcent_despesas_comparativo.Caption := '';
end;

procedure Tfml_comparativo.Button1Click(Sender: TObject);
begin
  lista_mes;


end;

function Tfml_comparativo.receita_mes1: double;
var
  valorTotal, lucro, valor_entrada, valor_saida : double;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM <> ''investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;


    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM like ''investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valor_entrada := query.Query1.FieldByName('valorTotal').AsFloat;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS inner join FINALIDADE on SAIDAS.ID_FINALIDADE = FINALIDADE.ID_FINALIDADE where FINALIDADE.FINALIDADE like ''investimentos'' and month(DATA_SAIDA) = :pMes and SAIDAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valor_saida := query.Query1.FieldByName('valortotal').AsFloat;

    lucro := valor_entrada - valor_saida;

    if lucro > 0 then
      result := valorTotal + lucro
    else
      result := query.Query1.FieldByName('valorTotal').AsFloat;



    l_mes1_comparativo.Caption := cb_mes1_comparativo.Text;
    l_valor_mes1_comparativo.Caption := FormatFloat('#,##0.00', result);
  finally

  end;
end;


function Tfml_comparativo.receita_mes2: double;
var
  valorTotal, lucro, valor_entrada, valor_saida : double;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM <> ''investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;


    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM like ''investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valor_entrada := query.Query1.FieldByName('valorTotal').AsFloat;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS inner join FINALIDADE on SAIDAS.ID_FINALIDADE = FINALIDADE.ID_FINALIDADE where FINALIDADE.FINALIDADE like ''investimentos'' and month(DATA_SAIDA) = :pMes and SAIDAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valor_saida := query.Query1.FieldByName('valortotal').AsFloat;

    lucro := valor_entrada - valor_saida;

    if lucro >= 0 then
      result := valorTotal + lucro
    else
      result := valorTotal;

    l_mes2_comparativo.Caption := cb_mes2_comparativo.Text;
    l_valor_mes2_comparativo.Caption := FormatFloat('#,##0.00', result);

  finally

  end;

end;


function Tfml_comparativo.despesas_mes1: double;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    result := query.Query1.FieldByName('valorTotal').AsFloat;

    l_despesas_mes1_comparativo.Caption := formatFloat('#,##0.00', result);

  finally

  end;
end;

function Tfml_comparativo.despesas_mes2: double;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    result := query.Query1.FieldByName('valorTotal').AsFloat;

    l_despesas_mes2_comparativo.Caption := formatFloat('#,##0.00', result);



  finally

  end;
end;

procedure Tfml_comparativo.conta_comparativo;
var
  conta : string;
  i : integer;
  valor_mes_1, valor_mes_2, valor_diferenca, porcent_total_1, porcent_total_2 : double;
begin
  ListView_conta_comparativo.Clear;

  try
    for I := 0 to High(arrConta) do
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS where ID_CONTA = :pConta and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pConta').AsInteger := dados.localizar_id(arrConta[i], 4);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_1 := query.Query1.FieldByName('valorTotal').AsFloat;

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS where ID_CONTA = :pConta and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pConta').AsInteger := dados.localizar_id(arrConta[i], 4);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_2 := query.Query1.FieldByName('valorTotal').AsFloat;

        conta := arrConta[i];

        if receita_mes1 > 0 then
          begin
            porcent_total_1 := (valor_mes_1 / receita_mes1) * 100;
          end
          else
          begin
            porcent_total_1 := 0;
          end;

        if receita_mes2 > 0 then
          begin
            porcent_total_2 := (valor_mes_2 / receita_mes2) * 100;
          end
          else
          begin
            porcent_total_2 := 0;
          end;

        valor_diferenca := valor_mes_2 - valor_mes_1;

        with ListView_conta_comparativo.Items.Add do
          begin
            Caption := conta;

            if valor_mes_1 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_1))
            else
              SubItems.Add('');

            if valor_mes_2 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_2))
            else
              subItems.Add('');

            if valor_diferenca <> 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_diferenca))
            else
              SubItems.Add('');

            if porcent_total_1 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_1))
            else
              subItems.Add('');

            if porcent_total_2 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_2))
            else
              subItems.Add('');
          end;
      end;

  finally

  end;

end;

procedure Tfml_comparativo.finalidade_comparativo;
var
  finalidade : string;
  i : integer;
  valor_mes_1, valor_mes_2, valor_diferenca, porcent_receita_1, porcent_receita_2, gasto_medio_1, gasto_medio_2, porcent_total_1, porcent_total_2 : double;
begin
  ListView_finalidade_comparativo.Clear;
  try
    for I := 0 to High(arrFinalidade) do
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where ID_FINALIDADE = :pFinalidade and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pFinalidade').AsInteger := dados.localizar_id(arrFinalidade[i], 1);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_1 := query.Query1.FieldByName('valorTotal').AsFloat;

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where ID_FINALIDADE = :pFinalidade and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pFinalidade').AsInteger := dados.localizar_id(arrFinalidade[i], 1);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_2 := query.Query1.FieldByName('valorTotal').AsFloat;

        finalidade := arrFinalidade[i];


        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) / sum(QUANTIDADE) as media from SAIDAS where ID_FINALIDADE = :pFinalidade and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pFinalidade').AsInteger := dados.localizar_id(arrFinalidade[i], 1);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        gasto_medio_1 := query.Query1.FieldByName('media').AsFloat;

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) / sum(QUANTIDADE) as media from SAIDAS where ID_FINALIDADE = :pFinalidade and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pFinalidade').AsInteger := dados.localizar_id(arrFinalidade[i], 1);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        gasto_medio_2 := query.Query1.FieldByName('media').AsFloat;


        if valor_mes_1 > 0 then
          begin
             if receita_mes1 > 0 then
              begin
                porcent_receita_1 := (valor_mes_1 / receita_mes1) * 100;
              end
              else
              begin
                porcent_receita_1 := 0;
              end;

             porcent_total_1 := (valor_mes_1 / despesas_mes1) * 100;
          end
          else
          begin
            porcent_receita_1 := 0;
            porcent_total_1 := 0;
          end;


        if valor_mes_2 > 0 then
          begin
            if receita_mes2 > 0 then
              begin
                porcent_receita_2 := (valor_mes_2 / receita_mes2) * 100;
              end
              else
              begin
                porcent_receita_2 := 0;
              end;

            porcent_total_2 := (valor_mes_2 / despesas_mes2) * 100;
          end
          else
          begin
            porcent_receita_2 := 0;
            porcent_total_2 := 0;
          end;

        valor_diferenca := valor_mes_1 - valor_mes_2;


        with ListView_finalidade_comparativo.Items.Add do
          begin
            Caption := finalidade;

            if valor_mes_1 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_1))
            else
              SubItems.Add('');

            if valor_mes_2 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_2))
            else
              SubItems.Add('');

            if valor_diferenca <> 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_diferenca))
            else
              SubItems.Add('');

            if porcent_receita_1 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_receita_1))
            else
              SubItems.Add('');

            if porcent_receita_2 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_receita_2))
            else
              SubItems.Add('');

            if gasto_medio_1 > 0 then
              SubItems.Add(formatFloat('#,##0.00', gasto_medio_1))
            else
              SubItems.Add('');

            if gasto_medio_2 > 0 then
              SubItems.Add(formatFloat('#,##0.00', gasto_medio_2))
            else
              SubItems.Add('');

            if porcent_total_1 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_1))
            else
              SubItems.Add('');

            if porcent_total_2 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_2))
            else
              SubItems.Add('');
          end;

      end;

  finally

  end;



end;

procedure Tfml_comparativo.fixo_comparativo;
var
  valor_mes_1, valor_mes_2, valor_diferenca, porcent_total_1, porcent_total_2 : double;
begin
  try
    ListView_fixo_comparativo.Clear;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where FIXO = ''s'' and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valor_mes_1 := query.Query1.FieldByName('valorTotal').AsFloat;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where FIXO = ''s'' and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valor_mes_2 := query.Query1.FieldByName('valorTotal').AsFloat;

    if valor_mes_1 > 0 then
      begin
        if receita_mes1 > 0 then
          begin
            porcent_total_1 := (valor_mes_1 / receita_mes1) * 100;
          end
          else
          begin
            porcent_total_1 := 0;
          end;
      end
      else
      begin
        porcent_total_1 := 0;
      end;

    if valor_mes_2 > 0 then
      begin
        if receita_mes2 > 0 then
          begin
            porcent_total_2 := (valor_mes_2 / receita_mes2) * 100;
          end
          else
          begin
            porcent_total_2 := 0;
          end;
      end
      else
      begin
        porcent_total_2 := 0;
      end;

    valor_diferenca := valor_mes_1 - valor_mes_2;

    with ListView_fixo_comparativo.Items.Add do
      begin
        if valor_mes_1 > 0 then
          Caption := formatFloat('#,##0.00', valor_mes_1)
        else
          Caption := '';

        if valor_mes_2 > 0 then
          SubItems.Add(formatFloat('#,##0.00', valor_mes_2))
        else
          subItems.Add('');

        if valor_diferenca <> 0 then
          SubItems.Add(formatFloat('#,##0.00', valor_diferenca))
        else
          SubItems.Add('');

        if porcent_total_1 > 0 then
          SubItems.Add(formatFloat('0.00%', porcent_total_1))
        else
          SubItems.Add('');

        if porcent_total_2 > 0 then
          SubItems.Add(formatFloat('0.00%', porcent_total_2))
        else
          SubItems.Add('');
      end;

  finally

  end;
end;

procedure Tfml_comparativo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  open_comparativo := false;

end;

procedure Tfml_comparativo.entrada_saida_comparativo;
begin

end;


procedure Tfml_comparativo.FormCreate(Sender: TObject);
begin
  lista_mes;
  query := TDataModule1.Create(nil);
end;

procedure Tfml_comparativo.FormShow(Sender: TObject);
begin
  cb_mes1_comparativo.SetFocus;
end;

procedure Tfml_comparativo.investimentos_comparativos;
var
  valorTotal_saida_1, valorTotal_saida_2, valorTotal_entrada_1, valorTotal_entrada_2, valor_media_entrada1, valor_media_entrada2, lucro1, lucro2 : double;
  porcent_invest_receita1, porcent_invest_receita2, qtd_entrada1, qtd_entrada2, porcent_retorno_receita1, porcent_retorno_receita2 : double;
  valorTotal_resultado, valor_media_resultado, lucro_resultado, porcent_invest_receita_resultado, porcent_retorno_resultado, qtd_resultado, porcent_invest_1, porcent_invest_2, porcent_invest_resultado : double;

begin
  try
    ListView_investimento_comparativo.Clear;
    valorTotal_saida_1 := 0;
    valorTotal_saida_2 := 0;
    valorTotal_entrada_1 := 0;
    valorTotal_entrada_2 := 0;


    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal, sum(QUANTIDADE) as qtd from SAIDAS inner join FINALIDADE on SAIDAS.ID_FINALIDADE = FINALIDADE.ID_FINALIDADE '+'where FINALIDADE.FINALIDADE like ''Investimentos'' and month(DATA_SAIDA) = :pMes and SAIDAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal_saida_1 := query.Query1.FieldByName('valorTotal').AsFloat;
    qtd_entrada1 := query.Query1.FieldByName('qtd').Asfloat;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal, sum(QUANTIDADE) as qtd from SAIDAS inner join FINALIDADE on SAIDAS.ID_FINALIDADE = FINALIDADE.ID_FINALIDADE '+'where FINALIDADE.FINALIDADE like ''Investimentos'' and month(DATA_SAIDA) = :pMes and SAIDAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal_saida_2 := query.Query1.FieldByName('valorTotal').AsFloat;
    qtd_entrada2 := query.Query1.FieldByName('qtd').Asfloat;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM like ''Investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal_entrada_1 := query.Query1.FieldByName('valorTotal').AsFloat;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM like ''Investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal_entrada_2 := query.Query1.FieldByName('valorTotal').AsFloat;

    lucro1 := valorTotal_entrada_1 - valorTotal_saida_1;
    lucro2 := valorTotal_entrada_2 - valorTotal_saida_2;

    if valorTotal_saida_1 > 0 then
      porcent_invest_1 := (lucro1 / valorTotal_saida_1) * 100
    else
      porcent_invest_1 := 0;

    if valorTotal_saida_2 > 0 then
      porcent_invest_2 := (lucro2 / valorTotal_saida_2) * 100
    else
      porcent_invest_2 := 0;


    if receita_mes1 > 0 then
      begin
        porcent_invest_receita1 := (valorTotal_saida_1 / receita_mes1) * 100;
        porcent_retorno_receita1 := (lucro1 / receita_mes1) * 100
      end
    else
      begin
        porcent_invest_receita1 := 0;
        porcent_retorno_receita1 := 0
      end;


    if receita_mes2 > 0 then
      begin
        porcent_invest_receita2 := (valorTotal_saida_2 / receita_mes2) * 100;
        porcent_retorno_receita2 := (lucro2 / receita_mes2) * 100
      end
    else
      begin
        porcent_invest_receita2 := 0;
        porcent_retorno_receita2 := 0
      end;


    if qtd_entrada1 > 0 then
      begin
        valor_media_entrada1 := valorTotal_saida_1 / qtd_entrada1
      end
    else
      begin
        valor_media_entrada1 := 0;
      end;

    if qtd_entrada2 > 0 then
      begin
        valor_media_entrada2 := valorTotal_saida_2 / qtd_entrada2
      end
    else
      begin
        valor_media_entrada2 := 0;
      end;


    valorTotal_resultado := valorTotal_saida_2 - valorTotal_saida_1;
    valor_media_resultado := valor_media_entrada2 - valor_media_entrada1;
    lucro_resultado := lucro2 - lucro1;
    porcent_invest_receita_resultado := porcent_invest_receita2 - porcent_invest_receita1;
    porcent_retorno_resultado := porcent_retorno_receita2 - porcent_retorno_receita1;
    qtd_resultado := qtd_entrada2 - qtd_entrada1;
    porcent_invest_resultado := porcent_invest_2 - porcent_invest_1;


    with ListView_investimento_comparativo.Items.Insert(0) do
      begin
        caption := 'Valor Total';
        SubItems.Add(formatFloat('#,##0.00', valorTotal_saida_1));
        SubItems.Add(formatFloat('#,##0.00', valorTotal_saida_2));
        SubItems.Add(formatFloat('#,##0.00', valorTotal_resultado));
      end;

    with ListView_investimento_comparativo.Items.Insert(1) do
      begin
        caption := '% invest. Receita';
        SubItems.Add(formatFloat('0.00%', porcent_invest_receita1));
        SubItems.Add(formatFloat('0.00%', porcent_invest_receita2));
        SubItems.Add(formatFloat('0.00%', porcent_invest_receita_resultado));
      end;

    with ListView_investimento_comparativo.Items.Insert(2) do
      begin
        caption := '% retorno Receita';
        SubItems.Add(formatFloat('0.00%', porcent_retorno_receita1));
        SubItems.Add(formatFloat('0.00%', porcent_retorno_receita2));
        SubItems.Add(formatFloat('0.00%', porcent_retorno_resultado));
      end;

    with ListView_investimento_comparativo.Items.Insert(3) do
      begin
       caption := 'Qtd. Entrada';
       SubItems.Add(formatFloat('#,##0.00', qtd_entrada1));
       SubItems.Add(formatFloat('#,##0.00', qtd_entrada2));
       SubItems.Add(formatFloat('#,##0.00', qtd_resultado));
      end;

    with ListView_investimento_comparativo.Items.Insert(4) do
      begin
        caption := 'Valor M. Entrada';
        SubItems.Add(formatFloat('#,##0.00', valor_media_entrada1));
        SubItems.Add(formatFloat('#,##0.00', valor_media_entrada2));
        SubItems.Add(formatFloat('#,##0.00', valor_media_resultado));
      end;

    with ListView_investimento_comparativo.Items.Insert(5) do
      begin
        caption := 'Lucro';
        SubItems.Add(formatFloat('#,##0.00', lucro1));
        SubItems.Add(formatFloat('#,##0.00', lucro2));
        SubItems.Add(formatFloat('#,##0.00', lucro_resultado));
      end;

    with ListView_investimento_comparativo.Items.Insert(6) do
      begin
        caption := '% Roi';
        SubItems.Add(formatFloat('0.00%', porcent_invest_1));
        SubItems.Add(formatFloat('0.00%', porcent_invest_2));
        SubItems.Add(formatFloat('0.00%', porcent_invest_resultado));
      end;

  except
    ShowMessage('Erro no comparativo de INVESTIMENTOS!');
  end;

end;

procedure Tfml_comparativo.item_comparativo;
var
  item : string;
  i : integer;
  valor_mes_1, valor_mes_2, valor_diferenca, porcent_receita_1, porcent_receita_2, gasto_medio_1, gasto_medio_2, porcent_total_1, porcent_total_2 : double;
begin
  ListView_item_comparativo.Clear;
  try
    for I := 0 to High(arrItem) do
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where ID_ITEM = :pItem and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pItem').AsInteger := dados.localizar_id(arrItem[i], 2);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_1 := query.Query1.FieldByName('valorTotal').AsFloat;

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where ID_ITEM = :pItem and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pItem').AsInteger := dados.localizar_id(arrItem[i], 2);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_2 := query.Query1.FieldByName('valorTotal').AsFloat;

        item := arrItem[i];

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) / sum(QUANTIDADE) as media from SAIDAS where ID_ITEM = :pItem and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pItem').AsInteger := dados.localizar_id(arrItem[i], 2);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        gasto_medio_1 := query.Query1.FieldByName('media').AsFloat;

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) / sum(QUANTIDADE) as media from SAIDAS where ID_ITEM = :pItem and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pItem').AsInteger := dados.localizar_id(arrItem[i], 2);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        gasto_medio_2 := query.Query1.FieldByName('media').AsFloat;

        if valor_mes_1 > 0 then
          begin
             if receita_mes1 > 0 then
              begin
                porcent_receita_1 := (valor_mes_1 / receita_mes1) * 100;
              end
              else
              begin
                porcent_receita_1 := 0;
              end;

             porcent_total_1 := (valor_mes_1 / despesas_mes1) * 100;
          end
          else
          begin
            porcent_receita_1 := 0;
            porcent_total_1 := 0;
          end;


        if valor_mes_2 > 0 then
          begin
            if receita_mes2 > 0 then
              begin
                porcent_receita_2 := (valor_mes_2 / receita_mes2) * 100;
              end
              else
              begin
                porcent_receita_2 := 0;
              end;

            porcent_total_2 := (valor_mes_2 / despesas_mes2) * 100;
          end
          else
          begin
            porcent_receita_2 := 0;
            porcent_total_2 := 0;
          end;

        valor_diferenca := valor_mes_1 - valor_mes_2;


        with ListView_item_comparativo.Items.Add do
          begin
            Caption := item;

            if valor_mes_1 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_1))
            else
              SubItems.Add('');

            if valor_mes_2 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_2))
            else
              SubItems.Add('');

            if valor_diferenca <> 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_diferenca))
            else
              SubItems.Add('');

            if porcent_receita_1 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_receita_1))
            else
              SubItems.Add('');

            if porcent_receita_2 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_receita_2))
            else
              SubItems.Add('');

            if gasto_medio_1 > 0 then
              SubItems.Add(formatFloat('#,##0.00', gasto_medio_1))
            else
              SubItems.Add('');

            if gasto_medio_2 > 0 then
              SubItems.Add(formatFloat('#,##0.00', gasto_medio_2))
            else
              SubItems.Add('');

            if porcent_total_1 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_1))
            else
              SubItems.Add('');

            if porcent_total_2 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_2))
            else
              SubItems.Add('');
          end;

      end;

  except

    ShowMessage('Erro no comparativo do ITEM');

  end;
end;

procedure Tfml_comparativo.lista_mes;
begin
  cb_mes1_comparativo.Items.Add('janeiro');
  cb_mes1_comparativo.Items.Add('fevereiro');
  cb_mes1_comparativo.Items.Add('março');
  cb_mes1_comparativo.Items.Add('abril');
  cb_mes1_comparativo.Items.Add('maio');
  cb_mes1_comparativo.Items.Add('junho');
  cb_mes1_comparativo.Items.Add('julho');
  cb_mes1_comparativo.Items.Add('agosto');
  cb_mes1_comparativo.Items.Add('setembro');
  cb_mes1_comparativo.Items.Add('outubro');
  cb_mes1_comparativo.Items.Add('novembro');
  cb_mes1_comparativo.Items.Add('dezembro');

  cb_mes2_comparativo.Items.Add('janeiro');
  cb_mes2_comparativo.Items.Add('fevereiro');
  cb_mes2_comparativo.Items.Add('março');
  cb_mes2_comparativo.Items.Add('abril');
  cb_mes2_comparativo.Items.Add('maio');
  cb_mes2_comparativo.Items.Add('junho');
  cb_mes2_comparativo.Items.Add('julho');
  cb_mes2_comparativo.Items.Add('agosto');
  cb_mes2_comparativo.Items.Add('setembro');
  cb_mes2_comparativo.Items.Add('outubro');
  cb_mes2_comparativo.Items.Add('novembro');
  cb_mes2_comparativo.Items.Add('dezembro');

  cb_mes2_comparativo.Text := FormatDatetime('mmmm', now);
end;

procedure Tfml_comparativo.ListView_conta_comparativoAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.ListView_finalidade_comparativoAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
      sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.ListView_finalidade_comparativoAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  case SubItem of
    1 : sender.Canvas.Font.Color := clgreen;
    2 : sender.Canvas.Font.Color := clblue;
    3 : begin
          sender.Canvas.Font.Color := clMaroon;
          if StrToFloatDef(Item.SubItems[subitem - 1], 0) < 0 then
            begin
              sender.Canvas.Font.Style := [fsBold]
            end;
        end;
    4 : sender.Canvas.Font.Color := clgreen;
    5 : sender.Canvas.Font.Color := clblue;
    6 : sender.Canvas.Font.Color := clgreen;
    7 : sender.Canvas.Font.Color := clblue;
    8 : sender.Canvas.Font.Color := clgreen;
    9 : sender.Canvas.Font.Color := clblue;
  end;

  if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.ListView_fixo_comparativoAdvancedCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  sender.Canvas.Font.Color := clgreen;
end;

procedure Tfml_comparativo.ListView_fixo_comparativoAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  case SubItem of
    1 : sender.Canvas.Font.Color := clblue;
    2 : sender.Canvas.Font.Color := clMaroon;
    3 : sender.Canvas.Font.Color := clgreen;
    4 : sender.Canvas.Font.Color := clblue;
  end;
end;

procedure Tfml_comparativo.ListView_investimento_comparativoAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if item.caption = 'Lucro' then
    sender.Canvas.Font.Style := [fsBold];
end;

procedure Tfml_comparativo.ListView_investimento_comparativoAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  case SubItem of
    1 : sender.Canvas.Font.Color := clgreen;
    2 : sender.Canvas.Font.Color := clblue;
    3 : sender.Canvas.Font.Color := clMaroon;
  end;
end;

procedure Tfml_comparativo.ListView_item_comparativoAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.ListView_item_comparativoAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  case SubItem of
    1 : sender.Canvas.Font.Color := clgreen;
    2 : sender.Canvas.Font.Color := clblue;
    3 : begin
          sender.Canvas.Font.Color := clMaroon;
          if StrToFloatDef(Item.SubItems[subitem - 1], 0) < 0 then
            begin
              sender.Canvas.Font.Style := [fsBold]
            end;
        end;
    4 : sender.Canvas.Font.Color := clgreen;
    5 : sender.Canvas.Font.Color := clblue;
    6 : sender.Canvas.Font.Color := clgreen;
    7 : sender.Canvas.Font.Color := clblue;
    8 : sender.Canvas.Font.Color := clgreen;
    9 : sender.Canvas.Font.Color := clblue;
  end;

  if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.ListView_origem_comparativoAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.ListView_origem_comparativoAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  case SubItem of
    1 : sender.Canvas.font.Color := clgreen;
    2 : sender.Canvas.Font.Color := clblue;
     3 : begin
          sender.Canvas.Font.Color := clMaroon;
          if StrToFloatDef(Item.SubItems[subitem - 1], 0) < 0 then
            begin
              sender.Canvas.Font.Style := [fsBold]
            end;
        end;
    4 : sender.Canvas.Font.Color := clgreen;
    5 : sender.Canvas.Font.Color := clblue;
  end;

  if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_comparativo.origem_comparativo;
var
  origem : string;
  i : integer;
  valor_mes_1, valor_mes_2, valor_diferenca, porcent_total_1, porcent_total_2 : double;
begin
  ListView_origem_comparativo.Clear;

  try
    for I := 0 to High(arrOrigem) do
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS where ID_ORIGEM = :pOrigem and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pOrigem').AsInteger := dados.localizar_id(arrOrigem[i], 3);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes1_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_1 := query.Query1.FieldByName('valorTotal').AsFloat;

        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS where ID_ORIGEM = :pOrigem and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pOrigem').AsInteger := dados.localizar_id(arrOrigem[i], 3);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes2_comparativo.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        valor_mes_2 := query.Query1.FieldByName('valorTotal').AsFloat;

        origem := arrorigem[i];

        if receita_mes1 > 0 then
          begin
            porcent_total_1 := (valor_mes_1 / receita_mes1) * 100;
          end
          else
          begin
            porcent_total_1 := 0;
          end;

        if receita_mes2 > 0 then
          begin
            porcent_total_2 := (valor_mes_2 / receita_mes2) * 100;
          end
          else
          begin
            porcent_total_2 := 0;
          end;

        valor_diferenca := valor_mes_2 - valor_mes_1;

        with ListView_origem_comparativo.Items.Add do
          begin
            Caption := origem;

            if valor_mes_1 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_1))
            else
              SubItems.Add('');

            if valor_mes_2 > 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_mes_2))
            else
              subItems.Add('');

            if valor_diferenca <> 0 then
              SubItems.Add(formatFloat('#,##0.00', valor_diferenca))
            else
              SubItems.Add('');

            if porcent_total_1 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_1))
            else
              subItems.Add('');

            if porcent_total_2 > 0 then
              SubItems.Add(formatFloat('0.00%', porcent_total_2))
            else
              subItems.Add('');
          end;


      end;


  finally

  end;

end;

procedure Tfml_comparativo.outros_comparativos;
var
  porcent_receita_comparativo, porcent_despesas_comparativo : double;
begin
  try
    if receita_mes1 > 0 then
      porcent_receita_comparativo := (receita_mes2 - receita_mes1) / receita_mes1 * 100
    else
      porcent_receita_comparativo := 0;

    if despesas_mes2 > 0 then
      porcent_despesas_comparativo := (despesas_mes1 - despesas_mes2) / despesas_mes2 * 100
    else
      porcent_despesas_comparativo := 0;


    if porcent_receita_comparativo >= 0 then
      l_porcent_receita_comparativo.Font.Color := clgreen
    else
      l_porcent_receita_comparativo.Font.Color := clred;

    if porcent_despesas_comparativo >= 0 then
      l_porcent_despesas_comparativo.Font.Color := clgreen
    else
      l_porcent_despesas_comparativo.Font.Color := clred;

    l_porcent_receita_comparativo.Caption := formatfloat('0.00%', porcent_receita_comparativo);
    l_porcent_despesas_comparativo.Caption := formatfloat('0.00%', porcent_despesas_comparativo);

  except

    ShowMessage('Erro no cálculo da % do comparativo entre receita e despesas!!');

  end;


end;

procedure Tfml_comparativo.p_central_comparativoClick(Sender: TObject);
begin
  self.BringToFront;
end;

end.
