
unit uRelatorioAnual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  uDataModule, uDados;

type
  TfmlRelatorioAnual = class(TForm)
    pCenter: TPanel;
    pTop: TPanel;
    pMid: TPanel;
    cbRelatorioAnual: TComboBox;
    rgRelatorioAnual: TRadioGroup;
    pBuscar: TPanel;
    pLimar: TPanel;
    lvRelatorioAnual: TListView;
    procedure FormCreate(Sender: TObject);
    procedure pBuscarClick(Sender: TObject);
    procedure lvRelatorioAnualAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure lvRelatorioAnualAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure pLimarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pCenterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure relatorioAnual(Item_Str : string ; ano : Integer);
    procedure posicionamentoComponentes;

    function quantidadeMesesparaMedia:double;
  end;

var
  fmlRelatorioAnual: TfmlRelatorioAnual;
  query : TDataModule1;

implementation

{$R *.dfm}

{ TfmlRelatorioAnual }

procedure TfmlRelatorioAnual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  open_anual := false;
end;

procedure TfmlRelatorioAnual.FormCreate(Sender: TObject);
begin
  query := TDataModule1.Create(nil);
  posicionamentoComponentes;
end;

procedure TfmlRelatorioAnual.lvRelatorioAnualAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    if (Item.Index mod 2) = 0 then
      begin
        Sender.Canvas.Brush.Color := clbtnface; // Cor para linhas pares
      end
      else
      begin
        Sender.Canvas.Brush.Color := clWhite; // Cor para linhas �mpares
        sender.Canvas.Font.Size := 7;
      end;

    if (item.Index >= lvRelatorioAnual.Items.Count - 2) then
      begin
        sender.Canvas.Brush.Color := clsilver;
        sender.Canvas.Font.Style := [TFontStyle.fsBold];
      end;

    if (item.Index >= lvRelatorioAnual.Items.Count - 1) then
      begin
        sender.Canvas.Brush.Color := clmedgray;
        sender.Canvas.Font.Style := [TFontStyle.fsBold];
      end;

end;

procedure TfmlRelatorioAnual.lvRelatorioAnualAdvancedCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  valor : double;
  i : Integer;
begin
    if (Item.Index mod 2) = 0 then
      begin
        Sender.Canvas.Brush.Color := clbtnface; // Cor para linhas pares
      end
      else
      begin
        Sender.Canvas.Brush.Color := clWhite; // Cor para linhas �mpares
        sender.Canvas.Font.Size := 7;
      end;

    if (item.Index >= lvRelatorioAnual.Items.Count - 2) then
      begin
        sender.Canvas.Brush.Color := clsilver;
        sender.Canvas.Font.Style := [TFontStyle.fsBold];
      end;

    if (item.Index >= lvRelatorioAnual.Items.Count - 1) then
      begin
        sender.Canvas.Brush.Color := clmedgray;
        sender.Canvas.Font.Style := [TFontStyle.fsBold];
      end;

  if subitem  =  13 then
    sender.Canvas.Font.Style := [fsbold];

//
//  if (subitem > 0) and (subitem >= item.SubItems.Count) then
//    begin
//      if TryStrToFloat(item.SubItems[subitem - 1], valor) then
//        begin
//          if valor > 0 then
//            sender.Canvas.Font.Color := clblue
//          else
//            sender.Canvas.Font.Color := clred;
//        end;
//    end;


end;

procedure TfmlRelatorioAnual.pBuscarClick(Sender: TObject);
begin
  case rgRelatorioAnual.ItemIndex of
    0: relatorioanual('Origem', strtoint(cbRelatorioAnual.Text));
    1: relatorioanual('Conta', strtoint(cbRelatorioAnual.Text));
    2: relatorioanual('Finalidade', strtoint(cbRelatorioAnual.Text));
    3: relatorioanual('Item', strtoint(cbRelatorioAnual.Text));
    4: relatorioanual('Item', strtoint(cbRelatorioAnual.Text));
  end;
end;

procedure TfmlRelatorioAnual.pCenterClick(Sender: TObject);
begin
  self.BringToFront;
end;

procedure TfmlRelatorioAnual.pLimarClick(Sender: TObject);
begin
  lvRelatorioAnual.Clear;
  cbRelatorioAnual.Text := formatdatetime('yyyy', now);
end;

procedure TfmlRelatorioAnual.posicionamentoComponentes;
var
  ano : string;
  sequencia_ano : array of integer;
  ano_inicio:  string;
  i : integer;
begin
  ano := formatdatetime('yyyy', now);
  ano_inicio := formatdatetime('yyyy', data_inicio);

  if (ano.ToInteger <> ano_inicio.ToInteger) and (ano_inicio.ToInteger > 2015) then
    begin
      for I := 0 to (ano.ToInteger - ano_inicio.ToInteger) do begin
        SetLength(sequencia_ano, length(sequencia_ano) + 1);

        sequencia_ano[high(sequencia_ano)] := ano_inicio.ToInteger;

        ano_inicio := inttostr(ano_inicio.ToInteger + 1);
      end;

      for I := 0 to High(sequencia_ano) do begin
        cbRelatorioAnual.Items.Add(inttostr(sequencia_ano[i]))
      end;
    end
    else
    begin
      for I := 0 to (ano.ToInteger - 2023) do begin
        cbRelatorioAnual.Items.Add(ano);

        ano := inttostr(ano.ToInteger + 1);
      end;
    end;



  cbRelatorioAnual.Text := formatdatetime('yyyy', now);
end;


function TfmlRelatorioAnual.quantidadeMesesparaMedia: double;
var
  ano_atual : string;
  ano_busca : string;
  ano_inicio : string;
begin
  ano_atual := formatdatetime('yyyy', now);
  ano_busca := cbRelatorioAnual.Text;
  ano_inicio := FormatDateTime('yyyy', data_inicio);

  if ano_busca = ano_inicio then
    result := (formatdatetime('mm', now).ToInteger - formatdatetime('mm', data_inicio).ToInteger)
  else if (ano_busca = ano_inicio) and (ano_busca <> ano_atual) then
    result := (12 - formatdatetime('mm', data_inicio).ToInteger)
  else if (ano_busca = ano_atual) and (ano_busca <> ano_inicio) then
    result := formatdatetime('mm', now).ToInteger
  else if (ano_busca <> ano_inicio) and (ano_busca <> ano_atual) then
    result := 12;


end;

procedure TfmlRelatorioAnual.relatorioAnual(Item_Str : string ; ano : Integer);
var
  i, j : Integer;

  sql_item : string;
  sql_join : string;
  sql_janeiro : string;
  sql_fevereiro : string;
  sql_marco : string;
  sql_abril : string;
  sql_maio : string;
  sql_junho : string;
  sql_julho : string;
  sql_agosto : string;
  sql_setembro : string;
  sql_outubro : string;
  sql_novembro : string;
  sql_dezembro : string;
  sql_usuario : string;
  sql_total : string;
  sql_ano : string;
  sql_item_fixo : string;

  mes_valor : array [1..12] of double;
  mes_variacao : array [1..12] of double;
  mes_valor_total : array [1..12] of double;
  mes_porcent_total : array [1..12] of double;
  mes_variacao_total : array [1..12] of double;

  valor_total_item_ano : double;
  valor_total_ano : double;
  valor_medio_item_ano : double;
  valor_medio_total : double;

  qtd_mes_para_media : double;

  entrada_or_saida : boolean;

begin
  try
    lvRelatorioAnual.Clear;

    case rgRelatorioAnual.ItemIndex of
      0: entrada_or_saida := true;
      1: entrada_or_saida := true;
      2: entrada_or_saida := false;
      3: entrada_or_saida := false;
      4: entrada_or_saida := false;
    end;

    for I := 1 to 12 do begin
      mes_valor_total[i] := 0;
      mes_porcent_total[i] := 0;
      mes_variacao_total[i] := 0;
    end;

    qtd_mes_para_media := quantidadeMesesparaMedia;


    with query.Query1 do
      begin

        if entrada_or_saida then
          begin
            sql_join := 'inner join ' + item_str + ' on entradas.id_' + item_str + ' = ' + item_str + '.id_' + item_str;

            sql_usuario := ' where entradas.id_usuario = ' + id_usuarioLogado.ToString;

            sql_item := item_str + ' as nome_item,';
            sql_janeiro := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 01) as janeiro,';
            sql_fevereiro := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 02) as fevereiro,';
            sql_marco := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 03) as marco,';
            sql_abril := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 04) as abril,';
            sql_maio := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 05) as maio,';
            sql_junho := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 06) as junho,';
            sql_julho := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 07) as julho,';
            sql_agosto := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 08) as agosto,';
            sql_setembro := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 09) as setembro,';
            sql_outubro := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 10) as outubro,';
            sql_novembro := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 11) as novembro,';
            sql_dezembro := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item and month(data_entrada) = 12) as dezembro,';
            sql_total := '(select sum(valor_entrada) from entradas ' + sql_join + sql_usuario + ' and ' + item_str + ' = nome_item) as total';



            sql_ano := 'and year(data_entrada) = ' + cbRelatorioAnual.Text;

            sql.Clear;
            sql.Add('select distinct');
            sql.Add(sql_item);
            sql.Add(sql_janeiro);
            sql.Add(sql_fevereiro);
            sql.Add(sql_marco);
            sql.Add(sql_abril);
            sql.Add(sql_maio);
            sql.Add(sql_junho);
            sql.Add(sql_julho);
            sql.Add(sql_agosto);
            sql.Add(sql_setembro);
            sql.Add(sql_outubro);
            sql.Add(sql_novembro);
            sql.Add(sql_dezembro);
            sql.Add(sql_total);
            sql.Add('from entradas');
            sql.Add(sql_join);
            sql.Add(sql_usuario);
            sql.Add(sql_ano);
            sql.Add('order by nome_item');
            open;

          end
        else
          begin
            if rgRelatorioAnual.ItemIndex = 4 then
              sql_item_fixo := 'and fixo = ''s'''
            else
              sql_item_fixo := '';

            sql_join := 'inner join ' + item_str + ' on saidas.id_' + item_str + ' = ' + item_str + '.id_' + item_str;

            sql_usuario := ' where saidas.id_usuario = ' + id_usuarioLogado.ToString;

            sql_item := item_str + ' as nome_item,';
            sql_janeiro := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 01) as janeiro,';
            sql_fevereiro := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 02) as fevereiro,';
            sql_marco := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 03) as marco,';
            sql_abril := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 04) as abril,';
            sql_maio := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 05) as maio,';
            sql_junho := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 06) as junho,';
            sql_julho := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 07) as julho,';
            sql_agosto := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 08) as agosto,';
            sql_setembro := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 09) as setembro,';
            sql_outubro := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 10) as outubro,';
            sql_novembro := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 11) as novembro,';
            sql_dezembro := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item ' + sql_item_fixo +' and month(data_saida) = 12) as dezembro,';
            sql_total := '(select sum(valor_saida) from saidas ' + sql_join + sql_usuario +  ' and ' + item_str + ' = nome_item '+ sql_item_fixo +') as total';



            sql_ano := 'and year(data_saida) = ' + cbRelatorioAnual.Text;

            sql.Clear;
            sql.Add('select distinct');
            sql.Add(sql_item);
            sql.Add(sql_janeiro);
            sql.Add(sql_fevereiro);
            sql.Add(sql_marco);
            sql.Add(sql_abril);
            sql.Add(sql_maio);
            sql.Add(sql_junho);
            sql.Add(sql_julho);
            sql.Add(sql_agosto);
            sql.Add(sql_setembro);
            sql.Add(sql_outubro);
            sql.Add(sql_novembro);
            sql.Add(sql_dezembro);
            sql.Add(sql_total);
            sql.Add('from saidas');
            sql.Add(sql_join);
            sql.Add(sql_usuario);
            sql.Add(sql_ano);
            sql.Add(sql_item_fixo);
            sql.Add('order by nome_item');
            open;

          end;

        while not eof do  begin

          for I := 1 to 12 do begin
            mes_valor[i] := 0;
            mes_variacao[i] := 0;
          end;

          mes_valor[1] := FieldByName('janeiro').AsFloat;
          mes_valor[2] := FieldByName('fevereiro').AsFloat;
          mes_valor[3] := FieldByName('marco').AsFloat;
          mes_valor[4] := FieldByName('abril').AsFloat;
          mes_valor[5] := FieldByName('maio').AsFloat;
          mes_valor[6] := FieldByName('junho').AsFloat;
          mes_valor[7] := FieldByName('julho').AsFloat;
          mes_valor[8] := FieldByName('agosto').AsFloat;
          mes_valor[9] := FieldByName('setembro').AsFloat;
          mes_valor[10] := FieldByName('outubro').AsFloat;
          mes_valor[11] := FieldByName('novembro').AsFloat;
          mes_valor[12] := FieldByName('dezembro').AsFloat;
          valor_total_item_ano := FieldByName('total').AsFloat;



          for I := 2 to 12 do begin
            if (mes_valor[i-1] <= 0) or (mes_valor[i] <= 0) then
              mes_variacao[i] := 0
            else
              begin
                case variacao_relatorio_anual of
                  1: mes_variacao[i] := (mes_valor[i] - mes_valor[i-1]) / mes_valor[i-1] * 100;
                  2: mes_variacao[i] := mes_valor[i] - mes_valor[i-1];
                end;

              end;

          end;

          lvRelatorioAnual.Columns[0].Caption := item_str;

          with lvRelatorioAnual.Items.Add do begin
            Caption := FieldByName('nome_item').AsString;

            for I := 1 to 12 do begin

              if mes_valor[i] <> 0 then
                SubItems.Add(formatfloat('#,##0.00', mes_valor[i]))
              else
                SubItems.Add('');

              mes_valor_total[i] := mes_valor_total[i] + mes_valor[i];
            end;

            SubItems.Add(formatfloat('#,##0.00', valor_total_item_ano));
            valor_total_ano := valor_total_ano + valor_total_item_ano;

            if valor_total_item_ano > 0 then
              begin
                if (formatdatetime('yyyy', now).ToInteger = strtoint(cbRelatorioAnual.Text)) then
                  valor_medio_item_ano := (valor_total_item_ano - mes_valor[formatdatetime('mm', now).ToInteger]) / qtd_mes_para_media
                else
                  valor_medio_item_ano := valor_total_item_ano / qtd_mes_para_media;
              end
            else
              valor_medio_item_ano := 0;

            SubItems.Add(formatfloat('#,##0.00', valor_medio_item_ano));

          end;

          with lvRelatorioAnual.Items.Add do begin
            Caption := '';

            for I := 1 to 12 do begin
              if mes_variacao[i] <> 0 then
                begin
                  case variacao_relatorio_anual of
                    1: SubItems.Add(formatfloat('0.00%', mes_variacao[i]));
                    2: SubItems.Add(formatfloat('#,##0.00', mes_variacao[i]));
                  end;

                end
              else
                SubItems.Add('');
            end;

          end;


          next;
        end;
      end;

    for I := 2 to 12 do begin
      if (mes_valor_total[i-1] <= 0) or (mes_valor_total[i] <= 0) then
        mes_variacao_total[i] := 0
      else
        begin
          case variacao_relatorio_anual of
            1: mes_variacao_total[i] := (mes_valor_total[i] - mes_valor_total[i-1]) / mes_valor_total[i-1] * 100;
            2: mes_variacao_total[i] := mes_valor_total[i] - mes_valor_total[i-1];
          end;

        end;
    end;


    if (formatdatetime('yyyy', now).ToInteger = strtoint(cbRelatorioAnual.Text)) then
      valor_medio_total := (valor_total_ano - mes_valor_total[formatdatetime('mm', now).ToInteger]) / qtd_mes_para_media
    else
      valor_medio_total := valor_total_ano / qtd_mes_para_media;


    with lvRelatorioAnual.Items.Add	do begin
      Caption := 'Total';
      for I := 1 to 12 do begin
        if mes_valor_total[i] <> 0 then
          SubItems.Add(formatfloat('#,##0.00', mes_valor_total[i]))
        else
          SubItems.Add('');
      end;

      SubItems.Add(formatfloat('#,##0.00', valor_total_ano));
      SubItems.Add(formatfloat('#,##0.00', valor_medio_total));
    end;

    with lvRelatorioAnual.Items.Add	do begin
      Caption := '';
      for I := 1 to 12 do begin
        if mes_variacao_total[i] <> 0 then
          begin
            case variacao_relatorio_anual of
              1: SubItems.Add(formatfloat('0.00%', mes_variacao_total[i]));
              2: SubItems.Add(formatfloat('#,##0.00', mes_variacao_total[i]));
            end;
          end
        else
          SubItems.Add('');
      end;

    end;

  finally

  end;

end;

end.