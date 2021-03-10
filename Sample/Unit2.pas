unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, BindFormJson,
  Vcl.ComCtrls;

type
  TForm2 = class(TForm)

    [FieldJsonBind('Nome')]
    Edit1: TEdit;

    [FieldJsonBind('Telefone')]
    Edit2: TEdit;

    [FieldJsonBind('Sexo')]
    ComboBox1: TComboBox;

    [FieldJsonBind('Status')]
    CheckBox1: TCheckBox;

    [FieldJsonBind('Tipo')]
    RadioGroup1: TRadioGroup;

    Memo1: TMemo;
    Button1: TButton;

    [FieldJsonBind('Data')]
    DateTimePicker1: TDateTimePicker;

    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add(
    TBindFormJson.New.FormToJson(Self).ToString
  );
end;

end.
