object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 311
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 32
    Top = 24
    Width = 186
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 456
    Top = 32
    Width = 345
    Height = 233
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 456
    Top = 271
    Width = 345
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 32
    Top = 51
    Width = 186
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 78
    Width = 186
    Height = 21
    TabOrder = 4
    Text = 'ComboBox1'
    Items.Strings = (
      'Masculino'
      'Feminino')
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 26
    Width = 97
    Height = 17
    Caption = 'Ativo'
    TabOrder = 5
  end
  object RadioGroup1: TRadioGroup
    Left = 240
    Top = 49
    Width = 185
    Height = 77
    Caption = 'RadioGroup1'
    Items.Strings = (
      'Atacado'
      'Varejo')
    TabOrder = 6
  end
  object DateTimePicker1: TDateTimePicker
    Left = 32
    Top = 105
    Width = 186
    Height = 21
    Date = 44265.000000000000000000
    Time = 0.771203449075983400
    TabOrder = 7
  end
end
