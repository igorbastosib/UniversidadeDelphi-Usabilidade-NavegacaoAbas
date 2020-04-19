unit FormInTabs.Mobile.View.Vendas.Lista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FormInTabs.Mobile.View.FormModel, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation, FMX.TabControl;

type
  TFormVendaLista = class(TFormModel)
    procedure btnHeaderRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendaLista: TFormVendaLista;

implementation

uses
  FormInTabs.Mobile.View.Vendas.Crud;

{$R *.fmx}

procedure TFormVendaLista.btnHeaderRightClick(Sender: TObject);
begin
  inherited;
  OpenForm(TFormVendaCrud);
end;

end.
