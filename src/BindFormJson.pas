unit BindFormJson;

interface

uses
  System.JSON,
  Vcl.Forms,
  System.Classes,
  System.Rtti,
  System.SysUtils,
  System.Variants,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type

  TRttiFieldHelper = class helper for TRttiField
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;


  FieldJsonBind = class(TCustomAttribute)
  private
    FJsonName: string;
    procedure SetJsonName(const Value: string);
  public
    constructor Create(aJsonName: string);
    property JsonName : string read FJsonName write SetJsonName;
  end;

  iBindFormJson = interface
    ['{2846B843-7533-4987-B7B4-72F7B5654D1A}']
    function FormToJson(aForm : TForm) : TJsonObject;
  end;

  TBindFormJson = class(TInterfacedObject, iBindFormJson)
    private
      function __GetComponentToValue(aComponent: TComponent): TValue;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBindFormJson;
      function FormToJson(aForm : TForm) : TJsonObject;
  end;

implementation

uses
  Vcl.ComCtrls;


{ FieldBind }

constructor FieldJsonBind.Create(aJsonName: string);
begin
  FJsonName := aJsonName;
end;

procedure FieldJsonBind.SetJsonName(const Value: string);
begin
  FJsonName := Value;
end;

{ TBindFormJson }

constructor TBindFormJson.Create;
begin

end;

destructor TBindFormJson.Destroy;
begin

  inherited;
end;

function TBindFormJson.FormToJson(aForm: TForm): TJsonObject;
var
  ctxRtti : TRttiContext;
  typRtti : TRttiType;
  prpRtti : TRttiField;
begin
  ctxRtti := TRttiContext.Create;
  Result := TJsonObject.Create;
  try
    typRtti := ctxRtti.GetType(aForm.ClassInfo);
    for prpRtti in typRtti.GetFields do
    begin
      if prpRtti.Tem<FieldJsonBind> then
      begin
        Result
          .AddPair(
            prpRtti.GetAttribute<FieldJsonBind>.FJsonName,
            __GetComponentToValue(aForm.FindComponent(prpRtti.Name)).ToString
          );
      end;
    end;
  finally
    ctxRtti.Free;
  end;
end;

function TBindFormJson.__GetComponentToValue(aComponent: TComponent): TValue;
var
  a: string;
begin
  if aComponent is TEdit then
    Result := TValue.FromVariant((aComponent as TEdit).Text);
  if aComponent is TComboBox then
    Result := TValue.FromVariant((aComponent as TComboBox).Items[(aComponent as TComboBox).ItemIndex]);
  if aComponent is TRadioGroup then
    Result := TValue.FromVariant((aComponent as TRadioGroup).Items[(aComponent as TRadioGroup).ItemIndex]);
  if aComponent is TCheckBox then
    Result := TValue.FromVariant((aComponent as TCheckBox).Checked);
  if aComponent is TTrackBar then
    Result := TValue.FromVariant((aComponent as TTrackBar).Position);
  if aComponent is TDateTimePicker then
    Result := TValue.FromVariant((aComponent as TDateTimePicker).DateTime);
  if aComponent is TShape then
    Result := TValue.FromVariant((aComponent as TShape).Brush.Color);
  a := Result.TOString;
end;

class function TBindFormJson.New: iBindFormJson;
begin
  Result := Self.Create;
end;



{ TRttiFieldHelper }

function TRttiFieldHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiFieldHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

end.
