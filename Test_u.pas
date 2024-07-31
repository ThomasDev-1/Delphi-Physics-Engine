unit Test_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, TPU, Vcl.WinXCtrls,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    pgcPages: TPageControl;
    ts1: TTabSheet;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnlObject: TPanel;
    tmrUpdate: TTimer;
    ts2: TTabSheet;
    shpHandle: TShape;
    shpThing1: TShape;
    actlstActions: TActionList;
    actW: TAction;
    actS: TAction;
    actA: TAction;
    actD: TAction;
    shpThing2: TShape;
    shpThing3: TShape;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure JumpUp(Sender: TObject);
    procedure shpHandleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure shpHandleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actWExecute(Sender: TObject);
    procedure actSExecute(Sender: TObject);
    procedure actAExecute(Sender: TObject);
    procedure actDExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  Engine : tTPU;
  bIsDragging : Boolean;

  pMousePos : TPoint;


implementation

{$R *.dfm}

procedure TForm1.actAExecute(Sender: TObject);
begin
  shpHandle.Left := shpHandle.Left - 5;
end;

procedure TForm1.actDExecute(Sender: TObject);
begin
  shpHandle.Left := shpHandle.Left + 5;
end;

procedure TForm1.actSExecute(Sender: TObject);
begin
  shpHandle.Top := shpHandle.Top + 5;
end;

procedure TForm1.actWExecute(Sender: TObject);
begin
  shpHandle.Top := shpHandle.Top - 5;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Engine := tTPU.Create;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Engine.Destroy;
end;


procedure TForm1.JumpUp(Sender: TObject);
begin
  TPanel(Sender).Top := 0;
end;

procedure TForm1.shpHandleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  bIsDragging := true;


  pMousePos.X := X;
  pMousePos.Y := Y;
end;

procedure TForm1.shpHandleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  bIsDragging := false;
end;

procedure TForm1.tmrUpdateTimer(Sender: TObject);
var
  Point : TPoint;
begin
  Engine.ApplyGravity(pnlObject);

  Engine.ApplyPush(shpHandle);

  if bIsDragging then
  begin
    Point := Mouse.CursorPos;
    Point := ScreenToClient(Point);
    shpHandle.Left := Point.X;
    shpHandle.Top := Point.Y;
  end;
end;

end.
