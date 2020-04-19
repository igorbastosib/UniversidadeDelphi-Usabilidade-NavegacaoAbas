unit FormInTabs.Mobile.View.FormModel;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Generics.Collections;

type
  TFormModel = class(TForm)
    lytBackground: TLayout;
    tbcMain: TTabControl;
    tbiMain: TTabItem;
    tbiAux: TTabItem;
    rctBackground: TRectangle;
    lytMain: TLayout;
    lytHeader: TLayout;
    rctHeader: TRectangle;
    lblHeader: TLabel;
    btnHeaderLeft: TButton;
    pthHeaderLeft: TPath;
    btnHeaderRight: TButton;
    pthHeaderRight: TPath;
    vtsList: TVertScrollBox;
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
    procedure BackClick(Sender: TObject); virtual;
    procedure FormAuxDestroy();
    procedure OpenForm(const AFrmClass: TComponentClass);
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

  FormAuxDestroy;
end;

procedure TFormModel.FormAuxDestroy;
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
  FormAuxDestroy;
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
  TFormModel(FFormAux).btnHeaderLeft.OnClick := BackClick;
  TFormModel(FFormAux).pthHeaderLeft.Data.Data := CSvgChevronLeft;
  TUtils.ChangeTab(tbcMain, tbiAux);
end;

end.
