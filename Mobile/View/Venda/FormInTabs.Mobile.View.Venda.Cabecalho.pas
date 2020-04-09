unit FormInTabs.Mobile.View.Venda.Cabecalho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FormInTabs.Mobile.View.Model, FMX.Objects, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Layouts;

type
  TFormVendaCabecalho = class(TFormModel)
    procedure btnHeaderRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendaCabecalho: TFormVendaCabecalho;

implementation

uses
  FormInTabs.Mobile.View.Venda.Lista;

{$R *.fmx}

procedure TFormVendaCabecalho.btnHeaderRightClick(Sender: TObject);
begin
  inherited;
  OpenForm(TFormVendaLista);
end;

end.
