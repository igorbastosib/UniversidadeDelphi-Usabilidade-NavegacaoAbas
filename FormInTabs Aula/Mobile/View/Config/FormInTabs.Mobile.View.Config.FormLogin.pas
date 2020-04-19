unit FormInTabs.Mobile.View.Config.FormLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FormInTabs.Mobile.View.FormModel, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation, FMX.TabControl;

type
  TFormLogin = class(TFormModel)
    btnLogin: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    FOnDoAfterLogin: TNotifyEvent;
    procedure SetOnDoAfterLogin(const Value: TNotifyEvent);
    { Private declarations }
  public
    property OnDoAfterLogin: TNotifyEvent read FOnDoAfterLogin write SetOnDoAfterLogin;
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

procedure TFormLogin.btnLoginClick(Sender: TObject);
begin
  inherited;
  // Seu processo de Login
  if (Assigned(FOnDoAfterLogin)) then
    FOnDoAfterLogin(Sender);
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  inherited;
  btnHeaderRight.Visible := False;
  btnHeaderLeft.Visible := False;
  FOnDoAfterLogin := nil;
end;

procedure TFormLogin.SetOnDoAfterLogin(const Value: TNotifyEvent);
begin
  FOnDoAfterLogin := Value;
end;

end.
