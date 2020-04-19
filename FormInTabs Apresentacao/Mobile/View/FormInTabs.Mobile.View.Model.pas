unit FormInTabs.Mobile.View.Model;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, System.Generics.Collections, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFormModel = class(TForm)
    lytBackground: TLayout;
    tbcMain: TTabControl;
    tbiMain: TTabItem;
    tbiAux: TTabItem;
    lytMain: TLayout;
    rctHeader: TRectangle;
    btnHeaderLeft: TButton;
    btnHeaderRight: TButton;
    lblHeader: TLabel;
    pthHeaderRight: TPath;
    pthHeaderLeft: TPath;
    VertScrollBox1: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
  var
    FFormAux: TForm;
    FObjList: TObjectList<TObject>;

    procedure OpenForm(const AFrmClass: TComponentClass);
    procedure FFormAuxDestroy();
    procedure BackClick(Sender: TObject);
    { Protected declarations }
  end;

var
  FormModel: TFormModel;

implementation

uses
  FormInTabs.Lib.Utils, FormInTabs.Lib.SvgPath;

{$R *.fmx}

procedure TFormModel.BackClick(Sender: TObject);
begin
  TUtils.ChangeTab(tbcMain, tbiMain);
  FFormAuxDestroy();
end;

procedure TFormModel.FFormAuxDestroy;
begin
  if (Assigned(FFormAux)) then
    FFormAux.DisposeOf;
  FFormAux := nil;
end;

procedure TFormModel.FormCreate(Sender: TObject);
begin
  tbcMain.TabPosition := TTabPosition.None;
  tbcMain.ActiveTab := tbiMain;
  FFormAux := nil;
  FObjList := TObjectList<TObject>.Create;
end;

procedure TFormModel.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FObjList);
  FFormAuxDestroy();
end;

procedure TFormModel.OpenForm(const AFrmClass: TComponentClass);
begin
  TUtils.OpenForm( //
    AFrmClass, //
    tbiAux, //
    FFormAux, //
    nil, //
    EmptyStr, //
    Self //
  );
  TFormModel(FFormAux).pthHeaderLeft.Data.Data := CSvgChevronLeft;
  TFormModel(FFormAux).btnHeaderLeft.OnClick := BackClick;
  TUtils.ChangeTab(tbcMain, tbiAux);
end;

end.
