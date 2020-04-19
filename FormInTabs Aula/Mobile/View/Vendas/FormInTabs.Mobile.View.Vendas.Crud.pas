unit FormInTabs.Mobile.View.Vendas.Crud;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FormInTabs.Mobile.View.FormModel, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation, FMX.TabControl;

type
  TFormVendaCrud = class(TFormModel)
    procedure btnHeaderRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendaCrud: TFormVendaCrud;

implementation

uses
  FormInTabs.Mobile.View.Vendas.Lista;

{$R *.fmx}

procedure TFormVendaCrud.btnHeaderRightClick(Sender: TObject);
begin
  inherited;
  OpenForm(TFormVendaLista);
end;

end.
