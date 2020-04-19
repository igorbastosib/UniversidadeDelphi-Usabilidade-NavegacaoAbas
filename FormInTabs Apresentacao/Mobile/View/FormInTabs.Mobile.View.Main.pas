unit FormInTabs.Mobile.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  FMX.MultiView, System.Actions, FMX.ActnList;

type
  TFormMain = class(TForm)
    vtsMain: TVertScrollBox;
    lytMaingBackground: TLayout;
    tbcMain: TTabControl;
    tbiLogin: TTabItem;
    tbiMain: TTabItem;
    lytMain: TLayout;
    mtvMenu: TMultiView;
    Rectangle1: TRectangle;
    lblMenuUsuario: TLabel;
    lblMenuAppVersao: TLabel;
    vtsMenu: TVertScrollBox;
    lytMenuButton1: TLayout;
    lytMenuButton3: TLayout;
    lytMenuButton2: TLayout;
    spdMenuButton1: TSpeedButton;
    spdMenuButton2: TSpeedButton;
    spdMenuButton3: TSpeedButton;
    actList: TActionList;
    actChangeTab: TChangeTabAction;
    StyleBook1: TStyleBook;
    procedure spdMenuButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FFormLogin: TForm;
    procedure DoAfterLogin(Sender: TObject);
    procedure OpenForm(const AFrmClass: TComponentClass);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  FormInTabs.Lib.Utils,
  FormInTabs.Mobile.View.Venda.Lista,
  FormInTabs.Mobile.View.Venda.Cabecalho,
  FormInTabs.Mobile.View.Login;

{$R *.fmx}

procedure TFormMain.DoAfterLogin(Sender: TObject);
begin
  spdMenuButton1Click(spdMenuButton1);
  TUtils.ChangeTab(tbcMain, tbiMain);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  tbcMain.TabPosition := TTabPosition.None;
  tbcMain.ActiveTab := tbiLogin;
  TUtils.ActChangeTab := actChangeTab;
  TUtils.FFormActive := nil;

  TUtils.OpenForm( //
    TFormLogin, //
    tbiLogin, //
    FFormLogin, //
    nil, //
    EmptyStr, //
    Self //
  );
  TFormLogin(FFormLogin).DoAfterLogin := DoAfterLogin;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  if (Assigned(TUtils.FFormActive)) then
    TUtils.FFormActive.DisposeOf;
  if (Assigned(FFormLogin)) then
    FFormLogin.DisposeOf;
  TUtils.FFormActive := nil;
end;

procedure TFormMain.OpenForm(const AFrmClass: TComponentClass);
begin
  TUtils.OpenForm( //
    AFrmClass, //
    lytMain, //
    TUtils.FFormActive, //
    mtvMenu, //
    'btnHeaderLeft', //
    nil //
  );
end;

procedure TFormMain.spdMenuButton1Click(Sender: TObject);
begin
  if (Sender = spdMenuButton1) then
  begin
    OpenForm(TFormVendaLista);
  end
  else if (Sender = spdMenuButton2) then
  begin
    OpenForm(TFormVendaCabecalho);
  end
  else if (Sender = spdMenuButton3) then
  begin
    StrToInt('1');
  end;
  mtvMenu.HideMaster;
end;

end.
