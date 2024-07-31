program DelphiClassDev_p;

uses
  Vcl.Forms,
  Test_u in 'Test_u.pas' {Form1},
  TPU in 'TPU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
