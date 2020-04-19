program FormInTabs;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormInTabs.Mobile.View.FormMain in 'View\FormInTabs.Mobile.View.FormMain.pas' {FormMain},
  FormInTabs.Mobile.View.FormModel in 'View\FormInTabs.Mobile.View.FormModel.pas' {FormModel},
  FormInTabs.Lib.SvgPath in '..\Lib\FormInTabs.Lib.SvgPath.pas',
  FormInTabs.Lib.Utils in '..\Lib\FormInTabs.Lib.Utils.pas',
  FormInTabs.Mobile.View.Config.FormLogin in 'View\Config\FormInTabs.Mobile.View.Config.FormLogin.pas' {FormLogin},
  FormInTabs.Mobile.View.Vendas.Lista in 'View\Vendas\FormInTabs.Mobile.View.Vendas.Lista.pas' {FormVendaLista},
  FormInTabs.Mobile.View.Vendas.Crud in 'View\Vendas\FormInTabs.Mobile.View.Vendas.Crud.pas' {FormVendaCrud};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
