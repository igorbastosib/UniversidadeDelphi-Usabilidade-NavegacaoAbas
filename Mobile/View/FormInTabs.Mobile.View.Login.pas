unit FormInTabs.Mobile.View.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FormInTabs.Mobile.View.Model, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation, FMX.TabControl;

type
  TFormLogin = class(TFormModel)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnHeaderRightClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FDoAfterLogin: TNotifyEvent;
    procedure SetDoAfterLogin(const Value: TNotifyEvent);
    { Private declarations }
  public
    property DoAfterLogin: TNotifyEvent read FDoAfterLogin write SetDoAfterLogin;
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

procedure TFormLogin.btnHeaderRightClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Em desenvolvimento');
end;

procedure TFormLogin.Button1Click(Sender: TObject);
begin
  inherited;
  if (Assigned(DoAfterLogin)) then
    DoAfterLogin(Sender);
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  inherited;
  btnHeaderLeft.Visible := False;
  FDoAfterLogin := nil;
end;

procedure TFormLogin.SetDoAfterLogin(const Value: TNotifyEvent);
begin
  FDoAfterLogin := Value;
end;

end.
