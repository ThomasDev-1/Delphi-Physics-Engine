unit TPU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Math;

type tTPU = class

  public function CheckCol(obj : TControl): Boolean;
  public procedure ApplyGravity(refObj : TControl);
  public procedure ApplyPush(refObj: TControl);
  public function PushCol(obj : TControl; var return : TControl): Boolean;


  private function GravCol(obj : TControl ): Boolean;

end;

  var
  arrVelocities : array of integer;

  pPosOldX, pPosOldY, pPosNewX, pPosNewY : integer;
  bSwitch : Boolean = false;

  const
  iChangeSpeed = 1;


implementation

{ tTPU }


procedure tTPU.ApplyGravity(refObj : TControl);
var
i : integer;
bUseGrav : Boolean;
begin
    if Length(arrVelocities) = refObj.Parent.ControlCount then
    begin
      for i := 0 to refObj.Parent.ControlCount - 1 do
      begin
        bUseGrav := refObj.Parent.Controls[i].Hint.Contains('GRAV');

        if (bUseGrav) and (refObj.Parent.Controls[i] is TControl) then
        begin
          if GravCol(refObj.Parent.Controls[i]) = false then
          begin
             arrVelocities[i] := arrVelocities[i] + iChangeSpeed;
             refObj.Parent.Controls[i].Top := refObj.Parent.Controls[i].Top + arrVelocities[i];
          end
          else
            arrVelocities[i] := 0;
        end;
      end;
    end
    else
    begin
      SetLength(arrVelocities, refObj.Parent.ControlCount);
      for i := 0 to refObj.Parent.ControlCount - 1 do
        arrVelocities[i] := 0;
    end;
end;



procedure tTPU.ApplyPush(refObj: TControl);
var
  control : TControl;
  xVel, yVel : integer;
begin
  if bSwitch then
  begin
    pPosOldX := refObj.Left;
    pPosOldY := refObj.Top;
  end else
  begin
    pPosNewX := refObj.Left;
    pPosNewY := refObj.Top;
  end; bSwitch := not bSwitch;

  xVel := Abs(pPosOldX - pPosNewX);
  YVel := Abs(pPosOldY - pPosNewY);

  if xVel > yVel then
    yVel := 0
  else if xVel < yVel then
    xVel := 0;

  if PushCol(refObj, control) then
  begin

    if xVel > 1 then
    begin
      if control.Left > refObj.Left then
        control.Left := refObj.Left + refObj.Width + 1
      else
      if control.Left < refObj.Left then
        control.Left := refObj.Left - refObj.Width - 1;
    end
    else
    if yVel > 1 then
    begin
      if control.Top > refObj.Top then
      control.Top := refObj.Top + refObj.Height + 1
    else
    if control.Top < refObj.Top then
      control.Top := refObj.Top - control.Height - 1;
    end;
  end;
end;

function tTPU.CheckCol(obj : TControl): Boolean;
var
  overlapX, overlapY: Integer;
  R1, R2: TRect;
  i: Integer;
begin
  R1 := obj.BoundsRect;

  for i := 0 to obj.Parent.ControlCount - 1 do
  begin
    if (obj.Parent.Controls[i] <> obj) and (obj.Parent.Controls[i] is TControl) then
    begin
      R2 := obj.Parent.Controls[i].BoundsRect;

      overlapX := Min(R1.Right, R2.Right) - Max(R1.Left, R2.Left);

      overlapY := Min(R1.Bottom, R2.Bottom) - Max(R1.Top, R2.Top);

      if (overlapX > 0) and (overlapY > 0) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

  Result := False;
end;

function tTPU.PushCol(obj : TControl; var return : TControl): Boolean;
var
  overlapX, overlapY: Integer;
  R1, R2: TRect;
  i: Integer;
begin
  R1 := obj.BoundsRect;

  for i := 0 to obj.Parent.ControlCount - 1 do
  begin
    if not obj.Parent.Controls[i].Hint.Contains('PUSH') then Continue;
    if (obj.Parent.Controls[i] <> obj) and (obj.Parent.Controls[i] is TControl) then
    begin
      R2 := obj.Parent.Controls[i].BoundsRect;

      overlapX := Min(R1.Right, R2.Right) - Max(R1.Left, R2.Left);

      overlapY := Min(R1.Bottom, R2.Bottom) - Max(R1.Top, R2.Top);

      if (overlapX > 0) and (overlapY > 0) then
      begin
        Result := True;

        return := obj.Parent.Controls[i];
        Exit;
      end;
    end;
  end;

  Result := False;
end;


function tTPU.GravCol(obj : TControl): Boolean;
var
  overlapX, overlapY: Integer;
  R1, R2: TRect;
  i: Integer;
begin
  R1 := obj.BoundsRect;

  for i := 0 to obj.Parent.ControlCount - 1 do
  begin
    if not obj.Parent.Controls[i].Hint.Contains('GROUND') then Continue;

    if (obj.Parent.Controls[i] <> obj) and (obj.Parent.Controls[i] is TControl) then
    begin
      R2 := obj.Parent.Controls[i].BoundsRect;

      overlapX := Min(R1.Right, R2.Right) - Max(R1.Left, R2.Left);

      overlapY := Min(R1.Bottom, R2.Bottom) - Max(R1.Top, R2.Top);

      if (obj.Top = obj.Parent.Controls[i].Top - obj.Height) and (overlapX > 0) then
      begin
        Result := true;
        Exit;
      end;

      if (overlapX > 0) and (overlapY > 0) then
      begin
        Result := True;
        obj.Top := obj.Parent.Controls[i].Top - obj.Height;
        Exit;
      end;
    end;
  end;

  Result := False;
end;

end.
