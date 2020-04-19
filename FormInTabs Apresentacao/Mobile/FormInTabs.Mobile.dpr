program FormInTabs.Mobile;

uses
  System.StartUpCopy,
  System.SysUtils,
  FMX.Forms,
  FormInTabs.Mobile.View.Main in 'View\FormInTabs.Mobile.View.Main.pas' {FormMain},
  FormInTabs.Mobile.View.Model in 'View\FormInTabs.Mobile.View.Model.pas' {FormModel},
  FormInTabs.Lib.Utils in '..\Lib\FormInTabs.Lib.Utils.pas',
  FormInTabs.Lib.SvgPath in '..\Lib\FormInTabs.Lib.SvgPath.pas',
  FormInTabs.Mobile.View.Venda.Lista in 'View\Venda\FormInTabs.Mobile.View.Venda.Lista.pas' {FormVendaLista},
  FormInTabs.Mobile.View.Venda.Cabecalho in 'View\Venda\FormInTabs.Mobile.View.Venda.Cabecalho.pas' {FormVendaCabecalho},
  FormInTabs.Mobile.View.Login in 'View\FormInTabs.Mobile.View.Login.pas' {FormLogin};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.CurrencyString := '0.,00';
  FormatSettings.DateSeparator := '/';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.LongDateFormat := 'dd/mm/yyyy';
  FormatSettings.ShortTimeFormat := 'hh:nn:ss';
  FormatSettings.LongTimeFormat := 'hh:nn:ss.zzz';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
