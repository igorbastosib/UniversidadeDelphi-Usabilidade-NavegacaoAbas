unit FormInTabs.Mobile.View.FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList,
  FMX.TabControl, FMX.MultiView, FMX.Layouts, FMX.Objects;

type
  TFormMain = class(TForm)
    StyleBook1: TStyleBook;
    ActionList1: TActionList;
    actChangeTab: TChangeTabAction;
    mtvMenu: TMultiView;
    vtsScrollAble: TVertScrollBox;
    lytScrollAble: TLayout;
    tbcMain: TTabControl;
    tbiLogin: TTabItem;
    tbiMain: TTabItem;
    lytMain: TLayout;
    lytLogin: TLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    lblHeader: TLabel;
    lblBottom: TLabel;
    vtsMenu: TVertScrollBox;
    lytMenuVendaLista: TLayout;
    btnMenuVendaLista: TButton;
    lytMenuVendaCrud: TLayout;
    btnMenuVendaCrud: TButton;
    lytMenuLogin: TLayout;
    btnMenuLogin: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMenuLoginClick(Sender: TObject);
    procedure btnMenuVendaListaClick(Sender: TObject);
    procedure btnMenuVendaCrudClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  var
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
  FormInTabs.Mobile.View.Config.FormLogin,
  FormInTabs.Mobile.View.Vendas.Lista,
  FormInTabs.Mobile.View.Vendas.Crud;

{$R *.fmx}

procedure TFormMain.btnMenuLoginClick(Sender: TObject);
begin
  TUtils.ChangeTab(tbcMain, tbiLogin);
end;

procedure TFormMain.btnMenuVendaCrudClick(Sender: TObject);
begin
  OpenForm(TFormVendaCrud);
end;

procedure TFormMain.btnMenuVendaListaClick(Sender: TObject);
begin
  OpenForm(TFormVendaLista);
end;

procedure TFormMain.DoAfterLogin(Sender: TObject);
begin
  btnMenuVendaListaClick(Sender);

  TUtils.ChangeTab(tbcMain, tbiMain);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  TUtils.actChangeTab := actChangeTab;
  tbcMain.TabPosition := TTabPosition.None;
  tbcMain.ActiveTab := tbiLogin;

  {
    É recomendado SEMPRE inicializar suas variáveis, esquecemos de fazê-lo
    em vídeo, mas segue o código com a correção
  }
  TUtils.FFormActive := nil;
  FFormLogin := nil;

  TUtils.OpenForm( //
    TFormLogin, //
    lytLogin, //
    FFormLogin, //
    nil, //
    EmptyStr, //
    Self //
    );
  TFormLogin(FFormLogin).OnDoAfterLogin := DoAfterLogin;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  if (Assigned(FFormLogin)) then
    FFormLogin.DisposeOf;
  FFormLogin := nil;

  if (Assigned(TUtils.FFormActive)) then
    TUtils.FFormActive.DisposeOf;
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
    Self //
    );
  mtvMenu.HideMaster;
end;

end.
