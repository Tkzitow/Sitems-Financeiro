﻿unit uRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, uDados,
  uDataModule, Data.DB, Vcl.Grids, Vcl.DBGrids, DateUtils, Vcl.DBCtrls;

type
  Tfml_relatorio = class(TForm)
    p_central_relatorio: TPanel;
    p_top_relatorio: TPanel;
    p_mid_relatorio: TPanel;
    PageControl1: TPageControl;
    Entradas: TTabSheet;
    saidas: TTabSheet;
    ListView_origem_relatorio: TListView;
    ListView_conta_relatorio: TListView;
    ListView_porDia_relatorio: TListView;
    ListView_item_relatorio: TListView;
    cb_mes_relatorio: TComboBox;
    ListView_itemFixo_relatorio: TListView;
    ListView_finalidade_relatorio: TListView;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    l_media_diaria_total_mes: TLabel;
    l_media_diaria_atualizada: TLabel;
    l_media_diaria_planejada: TLabel;
    edt_ValoTotal_itemFixo_relatorio: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    edt_porcent_itemFixo_relatorio: TEdit;
    btn_atualizar_relatorio: TButton;
    l_mes_relatorio: TLabel;
    p_receita_relatorio: TPanel;
    p_despesas_relatorio: TPanel;
    Label16: TLabel;
    l_projecao_gastos: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_atualizar_relatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_buscar_entradasClick(Sender: TObject);
    procedure btn_buscar_saidasClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ListView_origem_relatorioAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_origem_relatorioAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_conta_relatorioAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_conta_relatorioAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_finalidade_relatorioAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_finalidade_relatorioAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_item_relatorioAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_item_relatorioAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_porDia_relatorioAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_porDia_relatorioAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ListView_itemFixo_relatorioAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView_itemFixo_relatorioAdvancedCustomDrawItem(
      Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure p_central_relatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function receita(): double;
    function despesas(): double;
    function investimento_entrada(): double;
    function investimento_saida(): double;

    procedure origem_entrada_relatorio;
    procedure conta_entrada_relatorio;
    procedure inf_diaria_relatorio;
    procedure finalidade_relatorio;
    procedure item_relatorio;
    procedure porDia_relatorio;
    procedure itemFixo_relatorio;
    procedure lista_mes;
    procedure adicionar_cb_entradas_edicao;
    procedure adicionar_cb_saidas_edicao;
    procedure relatorios_edicao_entradas;
    procedure relatorios_edicao_saidas;
    procedure relatorio_anual_origem;
    procedure relatorio_anual_conta;
    procedure relatorio_anual_finalidade;
    procedure relatorio_anual_item;
    procedure relatorio_anual_item_fixo;

  end;

var
  fml_relatorio: Tfml_relatorio;
  query : TDataModule1;
  dados : dadosGlobais;

implementation

{$R *.dfm}

procedure Tfml_relatorio.adicionar_cb_entradas_edicao;
var
  I: Integer;
begin

end;

procedure Tfml_relatorio.adicionar_cb_saidas_edicao;
var
  I: Integer;
begin

end;

procedure Tfml_relatorio.btn_atualizar_relatorioClick(Sender: TObject);
begin
  origem_entrada_relatorio;
  conta_entrada_relatorio;

  finalidade_relatorio;
  item_relatorio;
  porDia_relatorio;
  itemFixo_relatorio;
  inf_diaria_relatorio;


  investimento_entrada;
  investimento_saida;


  l_mes_relatorio.Caption := cb_mes_relatorio.Text;

  p_receita_relatorio.Caption := formatFloat('#,##0.00', receita);
  p_despesas_relatorio.Caption := formatFloat('#,##0.00', despesas);

end;

procedure Tfml_relatorio.lista_mes;
begin
  cb_mes_relatorio.Clear;
  cb_mes_relatorio.Text := FormatDateTime('mmmm', now);
  cb_mes_relatorio.Items.Add('janeiro');
  cb_mes_relatorio.Items.Add('fevereiro');
  cb_mes_relatorio.Items.Add('março');
  cb_mes_relatorio.Items.Add('abril');
  cb_mes_relatorio.Items.Add('maio');
  cb_mes_relatorio.Items.Add('junho');
  cb_mes_relatorio.Items.Add('julho');
  cb_mes_relatorio.Items.Add('agosto');
  cb_mes_relatorio.Items.Add('setembro');
  cb_mes_relatorio.Items.Add('outubro');
  cb_mes_relatorio.Items.Add('novembro');
  cb_mes_relatorio.Items.Add('dezembro');


end;

procedure Tfml_relatorio.ListView_conta_relatorioAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_conta_relatorioAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_finalidade_relatorioAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_finalidade_relatorioAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_itemFixo_relatorioAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_itemFixo_relatorioAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_item_relatorioAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_item_relatorioAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_origem_relatorioAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_origem_relatorioAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_porDia_relatorioAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.ListView_porDia_relatorioAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (item.Index mod 2) = 0 then
    sender.Canvas.Brush.Color := clbtnface;
end;

procedure Tfml_relatorio.Button1Click(Sender: TObject);
begin
  adicionar_cb_entradas_edicao;
  adicionar_cb_saidas_edicao;
end;

procedure Tfml_relatorio.btn_buscar_entradasClick(Sender: TObject);
begin
  relatorios_edicao_entradas;
end;

procedure Tfml_relatorio.btn_buscar_saidasClick(Sender: TObject);
begin
  relatorios_edicao_saidas;
end;

procedure Tfml_relatorio.conta_entrada_relatorio;
var
  conta : string;
  valorTotal, valorGasto, valorTotalAnual, mediaMesAnual, ultimaEntrada, porcentTotal : double;
  I, qtd_meses : integer;
begin
  ListView_conta_relatorio.Clear;

  try
    if cb_mes_relatorio.text <> '' then
      begin
        for I := 0 to High(arrConta) do
          begin
            conta := arrConta[i];

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS where ID_CONTA = :pConta and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser');
            query.Query1.ParamByName('pConta').AsInteger := dados.localizar_id(arrConta[i], 4);
            query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorGasto from SAIDAS where ID_CONTA = :pConta and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
            query.Query1.ParamByName('pConta').AsInteger := dados.localizar_id(arrConta[i], 4);
            query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            valorGasto := query.Query1.FieldByName('valorGasto').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotalAnual from ENTRADAS where ID_CONTA = :pConta and year(DATA_ENTRADA) = 2024 and ID_USUARIO = :pUser');
            query.Query1.ParamByName('pConta').AsInteger := dados.localizar_id(arrConta[i], 4);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            valorTotalAnual := query.Query1.FieldByName('valorTotalAnual').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select distinct month(DATA_SAIDA) as meses from SAIDAS group by DATA_SAIDA');
            query.Query1.Open();

            qtd_meses := query.Query1.RecordCount;


            if qtd_meses > 0 then
                mediaMesAnual := valorTotalAnual / qtd_meses
              else
                mediaMesAnual := 0;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select VALOR_ENTRADA as ultimaEntrada from entradas where ID_ENTRADA = (select max(ID_ENTRADA) from ENTRADAS where ID_CONTA = :pConta and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser)');
            query.Query1.ParamByName('pConta').AsInteger := dados.localizar_id(arrConta[i], 4);
            query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            ultimaEntrada := query.Query1.FieldByName('ultimaEntrada').AsFloat;

            if valorTotal = 0 then
              porcentTotal := 0
            else
              porcentTotal := (valorTotal / valorTotalAnual) * 100;

            with ListView_conta_relatorio.Items.Add do
              begin
                Caption := conta;
                if valortotal > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', valorTotal))
                else
                  SubItems.Add('');

                if valorGasto > 0then
                  SubItems.Add(FormatFloat('#,##0.00', valorGasto))
                else
                  SubItems.Add('');

                if ultimaEntrada > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', ultimaEntrada))
                else
                  SubItems.Add('');

                if porcentTotal > 0 then
                  SubItems.Add(FormatFloat('0.00%', porcentTotal))
                else
                  SubItems.Add('');

                if mediaMesAnual > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', mediaMesAnual))
                else
                  SubItems.Add('');

                if valorTotalAnual > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', valorTotalAnual))
                else
                  SubItems.Add('');
              end;
          end;

      end;



  finally

  end;


end;

procedure Tfml_relatorio.finalidade_relatorio;
var
  finalidade : string;
  valorTotal, valorMedio, porcen : double;
  I: integer;
begin
  try
    ListView_finalidade_relatorio.Clear;
    for I := 0 to high(arrFinalidade) do
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal, avg(VALOR_SAIDA) as valorMedio from SAIDAS where ID_FINALIDADE = :pFinalidade and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pFinalidade').AsInteger := dados.localizar_id(arrFinalidade[i], 1);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        finalidade := arrFinalidade[i];
        valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;
        valorMedio := query.Query1.FieldByName('valorMedio').AsFloat;

        if valorTotal > 0 then
          begin
            if receita > 0 then
              begin
                porcen := (valorTotal / receita) * 100;
              end
              else
              begin
                porcen := 0;
              end;
          end
          else
            porcen := 0;




        with ListView_finalidade_relatorio.Items.Add  do
          begin
            Caption := finalidade;
            if valorTotal > 0 then
              SubItems.Add(FormatFloat('#,##0.00', valorTotal))
            else
              subItems.Add('');

            if valorMedio > 0 then
              SubItems.Add(FormatFloat('#,##0.00', valorMedio))
            else
              SubItems.Add('');

            if porcen > 0  then
              SubItems.Add(FormatFloat('0.00%', porcen))
            else
              SubItems.Add('');
          end;

      end;
  finally

  end;

end;

procedure Tfml_relatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  query.Destroy;
  open_SaidaEntrada := false;
end;

procedure Tfml_relatorio.FormCreate(Sender: TObject);
begin
  Query := TDataModule1.Create(nil);

  lista_mes;
  adicionar_cb_entradas_edicao;
  adicionar_cb_saidas_edicao;

end;

procedure Tfml_relatorio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btn_atualizar_relatorio.Click;

end;

procedure Tfml_relatorio.FormShow(Sender: TObject);
begin
  btn_atualizar_relatorio.Click;
  btn_atualizar_relatorio.SetFocus;

  PageControl1.ActivePage := saidas;
end;

procedure Tfml_relatorio.inf_diaria_relatorio;
var
  md_totalMes, md_atualizada, projecao, itemFixo, valorGasto : double;
  dias_corridos_comparativo, ano, mes : integer;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where FIXO = ''s'' and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMEs').AsInteger := dados.localizar_mes(cb_mes_relatorio.text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    itemFixo := query.Query1.FieldByName('valorTotal').AsFloat;



    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where FIXO = ''n'' and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorGasto := query.Query1.FieldByName('valorTotal').AsFloat;


    //Quantidad de dias para cálcular média diária
    ano := YearOf(now);
    mes := dados.localizar_mes(cb_mes_relatorio.Text);

    if MonthOf(now) = dados.localizar_mes(cb_mes_relatorio.Text) then
      dias_corridos_comparativo := DayOf(now)
    else
      dias_corridos_comparativo := DaysInAMonth(ano, mes);

    if valorGasto > 0 then
      md_atualizada := valorGasto / dias_corridos_comparativo
    else
      md_atualizada := 0;

    if receita > 0 then
      md_totalMes := (receita - itemFixo) / DaysInAMonth(ano, mes)
    else
      md_totalMes := 0;


    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select MEDIA_DIARIA_PLANEJADA as media_diaria from CONFIGURACAO where ID_USUARIO = :pUser');
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    mediaDiaria_planejada := query.Query1.FieldByName('media_diaria').AsFloat;


    projecao := (md_atualizada * dias_restantes) + despesas;


    l_media_diaria_total_mes.Caption := formatFloat('#,##0.00', md_totalMes);
    l_media_diaria_atualizada.Caption := formatFloat('#,##0.00', md_atualizada);
    l_media_diaria_planejada.Caption := formatFloat('#,##0.0', mediaDiaria_planejada);

    if dados.localizar_mes(cb_mes_relatorio.text) = monthof(now) then
      begin
        l_projecao_gastos.Caption := formatfloat('#,##0.00', projecao);

        if projecao > receita then
          l_projecao_gastos.Font.Color := clRed
        else
          l_projecao_gastos.Font.Color := clGreen;

      end
    else
      l_projecao_gastos.Caption := '';

  except

    ShowMessage('Erro no relatório - média diaria!!');

  end;
end;

function Tfml_relatorio.investimento_entrada: double;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM where ORIGEM.ORIGEM like ''investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    result := query.Query1.FieldByName('valorTotal').AsFloat;

  except
    ShowMessage('Erro relatorio - Investimento ENTRADA');
  end;
end;

function Tfml_relatorio.investimento_saida: double;
begin
  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS inner join FINALIDADE on SAIDAS.ID_FINALIDADE = FINALIDADE.ID_FINALIDADE where FINALIDADE.FINALIDADE like ''investimentos'' and month(DATA_SAIDA) = :pMes and SAIDAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    result := query.Query1.FieldByName('valorTotal').AsFloat;

  except
    ShowMessage('Erro no relatorio - investimento saidas');
  end;
end;

procedure Tfml_relatorio.itemFixo_relatorio;
var
  item : string;
  valorTotal, valorItem, porcentTotal, porcentItem : double;
begin
  ListView_itemFixo_relatorio.Clear;

  valortotal := 0;

  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where FIXO = ''s'' and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;		
    
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select SAIDAS.VALOR_SAIDA as valorTotal, ITEM.ITEM as item from SAIDAS inner join ITEM on SAIDAS.ID_ITEM = ITEM.ID_ITEM where FIXO = ''s'' and month(DATA_SAIDA) = :pMes and SAIDAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMEs').AsInteger := dados.localizar_mes(cb_mes_relatorio.text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    while not query.Query1.Eof do
      begin
        item := query.Query1.FieldByName('item').AsString;
        valorItem := query.Query1.FieldByName('valorTotal').AsFloat;

        if valorTotal > 0 then
            porcentItem := (valorItem / valorTotal) * 100
          else
            porcentItem := 0;

        with ListView_itemFixo_relatorio.Items.Add do
          begin
            Caption := item;
            SubItems.Add(FormatFloat('#,##0.00', valorItem));
            SubItems.Add(FormatFloat('0.00%', porcentItem));	
          end;

        query.Query1.Next;
      end;

      if valorTotal > 0 then
        begin
          if receita > 0 then
            begin
              porcentTotal := (valorTotal / receita) * 100
            end
            else
            begin
              porcentTotal := 0;
            end;
        end
        else
          porcentTotal := 0;

    edt_ValoTotal_itemFixo_relatorio.Text := FormatFloat('#,##0.00', valorTotal);
    edt_porcent_itemFixo_relatorio.Text := FormatFloat('0.00%', porcentTotal);

  except
    ShowMessage('Erro no relatório de - ITEM FIXO');
  end;

end;

procedure Tfml_relatorio.item_relatorio;
var
  i : integer;
  valorTotal, valorMedio, porcen : double;
  item : string;
begin
  try
    ListView_item_relatorio.Clear;

    for I := 0 to High(arrItem) do
      begin
        query.Query1.SQL.Clear;
        query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal, avg(VALOR_SAIDA) as valorMedio from SAIDAS where ID_ITEM = :pItem and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
        query.Query1.ParamByName('pItem').AsInteger := dados.localizar_id(arrItem[i], 2);
        query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
        query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
        query.Query1.Open();

        item := arrItem[i];
        valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;
        valorMedio := query.Query1.FieldByName('valorMedio').AsFloat;

        if valorTotal > 0 then
          begin
            if receita > 0 then
              begin
                porcen := (valorTotal / receita) * 100
              end
              else
              begin
                porcen := 0
              end;
          end
          else
            porcen := 0;


        with ListView_item_relatorio.Items.Add do
          begin
            Caption := item;
            if valorTotal > 0 then
              SubItems.Add(FormatFloat('#,##0.00', valorTotal))
            else
              subItems.Add('');

            if valorMedio > 0 then
              SubItems.Add(FormatFloat('#,##0.00', valorMedio))
            else
              SubItems.Add('');

            if porcen > 0  then
              SubItems.Add(FormatFloat('0.00%', porcen))
            else
              SubItems.Add('');
          end;
      end;

  finally

  end;


end;

procedure Tfml_relatorio.origem_entrada_relatorio;
var
  origem : string;
  valorTotal, valorMedio, ultimaEntrada, totalAnual, maiorValor, mediaMesAnual, porcentTotal : double;
  I, qtd_meses : Integer;
begin
  ListView_origem_relatorio.Clear;
  try
    if cb_mes_relatorio.Text <> '' then
      begin
        for I := 0 to High(arrOrigem) do
          begin
            query.Query1.SQL.clear;
            query.Query1.SQL.Add('select sum(round(VALOR_ENTRADA, 2)) as valorTotal, avg(round(VALOR_ENTRADA, 2)) as mediaTotal from ENTRADAS where MONTH(DATA_ENTRADA) = :pMes and ID_ORIGEM = :pOrigem and ID_USUARIO = :pUser');
            query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
            query.Query1.ParamByName('pOrigem').AsInteger := dados.localizar_id(arrOrigem[i], 3);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            origem := arrOrigem[i];
            valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;
            valorMedio := query.Query1.FieldByName('mediaTotal').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select max(VALOR_ENTRADA) as maiorValor from ENTRADAS where ID_ORIGEM = :pOrigem and ID_USUARIO = :pUser');
//           query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
            query.Query1.ParamByName('pOrigem').AsInteger := dados.localizar_id(arrOrigem[i], 3);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.open;

            maiorValor := query.Query1.FieldByName('maiorValor').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select VALOR_ENTRADA as ultimaEntrada from entradas where ID_ENTRADA = (select max(ID_ENTRADA) from ENTRADAS where ID_ORIGEM = :pOrigem and month(DATA_ENTRADA) = :pMes and ID_USUARIO = :pUser)');
            query.Query1.ParamByName('pOrigem').AsInteger := dados.localizar_id(arrOrigem[i], 3);
            query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            ultimaEntrada := query.Query1.FieldByName('ultimaEntrada').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as totalAnual from ENTRADAS where ID_ORIGEM = :pOrigem and year(DATA_ENTRADA) = 2024 and ID_USUARIO = :pUser');
            query.Query1.ParamByName('pOrigem').AsInteger := dados.localizar_id(arrOrigem[i], 3);
            query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
            query.Query1.Open();

            totalAnual := query.Query1.FieldByName('totalAnual').AsFloat;

            query.Query1.SQL.Clear;
            query.Query1.SQL.Add('select distinct month(DATA_SAIDA) as meses from SAIDAS group by DATA_SAIDA');
            query.Query1.Open();

            qtd_meses := query.Query1.RecordCount;


            if qtd_meses > 0 then
              mediaMesAnual := totalAnual / qtd_meses
            else
              mediaMesAnual := 0;

            if valorTotal = 0 then
              porcentTotal := 0
            else
              porcentTotal := (valorTotal / totalAnual) * 100;


            with ListView_origem_relatorio.Items.add do
              begin
                Caption := origem;

                if valorTotal > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', valorTotal))
                else
                  SubItems.Add('');

                if valorMedio > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', valorMedio))
                else
                  SubItems.Add('');

                if ultimaEntrada > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', ultimaEntrada))
                else
                  SubItems.Add('');

                if maiorvalor > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', maiorValor))
                else
                  SubItems.Add('');

                if porcentTotal > 0 then
                  SubItems.Add(FormatFloat('0.00%', porcentTotal))
                else
                  SubItems.Add('');

                if mediaMesAnual > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', mediaMesAnual))
                else
                  SubItems.Add('');

                if totalAnual > 0 then
                  SubItems.Add(FormatFloat('#,##0.00', totalAnual))
                else
                  SubItems.Add('');
              end;
          end;
      end;
  finally
    //ShowMessage('Erro  no relatorio - Origem');
  end;

end;

procedure Tfml_relatorio.porDia_relatorio;
VAR
  i : integer;
  dia, valorTotal, porcent : double;
begin
  ListView_porDia_relatorio.Clear;

  try
    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select day(DATA_SAIDA) as data, sum(VALOR_SAIDA) as valorTotal from SAIDAS where FIXO = ''n'' and month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser group by DATA_SAIDA order by DATA_SAIDA desc');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    while not query.Query1.Eof do
      begin
        dia := query.Query1.FieldByName('data').AsFloat;
        valortotal := query.Query1.FieldByName('valorTotal').AsFloat;

        if mediaDiaria_planejada > 0 then
          porcent := (valorTotal / mediaDiaria_planejada) * 100
          else
          porcent := mediaDiaria_planejada;

        with ListView_porDia_relatorio.Items.Add do
          begin
            Caption := '  ' + dia.ToString;
            SubItems.Add(FormatFloat('#,##0.00', valortotal));
            SubItems.Add(FormatFloat('0.00%', porcent));
          end;

        query.Query1.Next;
      end;

  finally

  end;


end;

procedure Tfml_relatorio.p_central_relatorioClick(Sender: TObject);
begin
  self.BringToFront;
end;

function Tfml_relatorio.receita: double;
var
  lucro, valorTotal : double;
begin
  try
    lucro := 0;

    query.Query1.SQL.Clear;
    query.Query1.SQL.Add('select sum(VALOR_ENTRADA) as valorTotal from ENTRADAS inner join ORIGEM on ENTRADAS.ID_ORIGEM = ORIGEM.ID_ORIGEM  where ORIGEM.ORIGEM <> ''investimento'' and month(DATA_ENTRADA) = :pMes and ENTRADAS.ID_USUARIO = :pUser');
    query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
    query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
    query.Query1.Open();

    valorTotal := query.Query1.FieldByName('valorTotal').AsFloat;
    lucro := investimento_entrada - investimento_saida;

    if lucro > 0 then
      result := valorTotal + lucro
    else
      result := valorTotal;


  finally

  end;
end;

procedure Tfml_relatorio.relatorios_edicao_entradas;

begin

end;

procedure Tfml_relatorio.relatorios_edicao_saidas;
begin

end;

procedure Tfml_relatorio.relatorio_anual_conta;
begin

end;

procedure Tfml_relatorio.relatorio_anual_finalidade;
begin

end;

procedure Tfml_relatorio.relatorio_anual_item;
begin

end;

procedure Tfml_relatorio.relatorio_anual_item_fixo;
begin

end;

procedure Tfml_relatorio.relatorio_anual_origem;
begin
end;

function Tfml_relatorio.despesas: double;
begin
  query.Query1.SQL.Clear;
  query.Query1.SQL.Add('select sum(VALOR_SAIDA) as valorTotal from SAIDAS where month(DATA_SAIDA) = :pMes and ID_USUARIO = :pUser');
  query.Query1.ParamByName('pMes').AsInteger := dados.localizar_mes(cb_mes_relatorio.Text);
  query.Query1.ParamByName('pUser').AsInteger := id_usuarioLogado;
  query.Query1.Open();

  result := query.Query1.FieldByName('valorTotal').AsFloat;
end;

end.
