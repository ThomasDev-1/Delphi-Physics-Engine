object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 512
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPages: TPageControl
    Left = 0
    Top = 0
    Width = 972
    Height = 512
    ActivePage = ts2
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object pnl2: TPanel
        Left = 248
        Top = 0
        Width = 41
        Height = 41
        Hint = 'GRAV'
        Color = clOlive
        ParentBackground = False
        TabOrder = 0
        OnClick = JumpUp
      end
      object pnl3: TPanel
        Left = 32
        Top = 60
        Width = 41
        Height = 41
        Hint = 'GRAV'
        Color = clOlive
        ParentBackground = False
        TabOrder = 1
        OnClick = JumpUp
      end
      object pnl4: TPanel
        Left = 824
        Top = 276
        Width = 41
        Height = 41
        Hint = 'GRAV'
        Color = clOlive
        ParentBackground = False
        TabOrder = 2
        OnClick = JumpUp
      end
      object pnl5: TPanel
        Left = 728
        Top = 60
        Width = 41
        Height = 41
        Hint = 'GRAV'
        Color = clOlive
        ParentBackground = False
        TabOrder = 3
        OnClick = JumpUp
      end
      object pnl6: TPanel
        Left = 0
        Top = 435
        Width = 964
        Height = 49
        Hint = 'GROUND'
        Align = alBottom
        Color = clNavy
        ParentBackground = False
        TabOrder = 4
      end
      object pnlObject: TPanel
        Left = 368
        Top = 196
        Width = 41
        Height = 41
        Hint = 'GRAV'
        Color = clFuchsia
        DoubleBuffered = True
        ParentBackground = False
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = JumpUp
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object shpHandle: TShape
        Left = 208
        Top = 160
        Width = 65
        Height = 65
        Pen.Color = clRed
        Pen.Width = 50
        OnMouseDown = shpHandleMouseDown
        OnMouseUp = shpHandleMouseUp
      end
      object shpThing1: TShape
        Left = 736
        Top = 184
        Width = 65
        Height = 65
        Hint = 'PUSH'
        Pen.Color = clBlue
        Pen.Width = 50
        Shape = stSquare
      end
      object shpThing2: TShape
        Left = 480
        Top = 320
        Width = 65
        Height = 65
        Hint = 'PUSH'
        Pen.Color = clBlue
        Pen.Width = 50
        Shape = stSquare
      end
      object shpThing3: TShape
        Left = 456
        Top = 32
        Width = 65
        Height = 65
        Hint = 'PUSH'
        Pen.Color = clBlue
        Pen.Width = 50
        Shape = stSquare
      end
    end
  end
  object tmrUpdate: TTimer
    Interval = 16
    OnTimer = tmrUpdateTimer
    Left = 936
  end
  object actlstActions: TActionList
    Left = 896
    object actW: TAction
      Caption = 'actW'
      ShortCut = 87
      OnExecute = actWExecute
    end
    object actS: TAction
      Caption = 'actS'
      ShortCut = 83
      OnExecute = actSExecute
    end
    object actA: TAction
      Caption = 'actA'
      ShortCut = 65
      OnExecute = actAExecute
    end
    object actD: TAction
      Caption = 'actD'
      ShortCut = 68
      OnExecute = actDExecute
    end
  end
end
