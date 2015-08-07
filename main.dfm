object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 91
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    373
    91)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 220
    Top = 8
    Width = 145
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 0
    Text = '0'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = '5 - 20 -10'
    OnChange = ComboBox1Change
    Items.Strings = (
      '5 - 20 -10'
      '6 - 24 - 12'
      '7 - 28 - 14'
      '8 - 32 - 16'
      '9 - 36 - 18'
      '10 - 40 - 20'
      '11 - 44 - 22'
      '12 - 48 - 24'
      '13 - 52 - 26'
      '14 - 56 - 28'
      '15 - 60 - 30'
      '')
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 35
    Width = 357
    Height = 12
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object ProgressBar2: TProgressBar
    Left = 8
    Top = 53
    Width = 357
    Height = 12
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object ProgressBar3: TProgressBar
    Left = 8
    Top = 71
    Width = 357
    Height = 12
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 332
    Top = 60
  end
end
