unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, BindFormJson,
  Vcl.ComCtrls;

type
  TForm2 = class(TForm)

    [FieldJsonBind('Nome'), FbIgnoreDelete]
    Edit1: TEdit;

    [FieldJsonBind('Telefone'), FbIgnoreDelete]
    Edit2: TEdit;

    [FieldJsonBind('Sexo'), FbIgnoreDelete]
    ComboBox1: TComboBox;

    [FieldJsonBind('Status'), FbIgnoreDelete]
    CheckBox1: TCheckBox;

    [FieldJsonBind('Tipo'), FbIgnoreDelete]
    RadioGroup1: TRadioGroup;

    [FieldJsonBind('Data'), FbIgnoreDelete]
    DateTimePicker1: TDateTimePicker;

    [FieldJsonBind('Id'), FbIgnorePost]
    edtId: TEdit;

    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Button1: TButton;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  System.JSON;

{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(
    TBindFormJson.New.FormToJson(Self, fbGet).ToString
  );
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(
    TBindFormJson.New.FormToJson(Self, fbPost).ToString
  );
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(
    TBindFormJson.New.FormToJson(Self, fbPut).ToString
  );
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(
    TBindFormJson.New.FormToJson(Self, fbDelete).ToString
  );
end;

end.
