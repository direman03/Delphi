unit UnitCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCalculadora = class(TForm)
    edResultado: TEdit;
    Label1: TLabel;
    btLimpar: TButton;
    bt7: TButton;
    bt8: TButton;
    bt9: TButton;
    btDividir: TButton;
    bt4: TButton;
    bt5: TButton;
    bt6: TButton;
    btMultiplicar: TButton;
    bt1: TButton;
    bt2: TButton;
    bt3: TButton;
    btSubtrair: TButton;
    bt0: TButton;
    btVirgula: TButton;
    btIgual: TButton;
    btSomar: TButton;
    procedure btSomarClick(Sender: TObject);
    procedure btSubtrairClick(Sender: TObject);
    procedure btMultiplicarClick(Sender: TObject);
    procedure btDividirClick(Sender: TObject);
    procedure NumeroClick(Sender: TObject);
    procedure btVirgulaClick(Sender: TObject);
    procedure btIgualClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    FOperacao : Char;
    FTotal : Double;
    FUltimoNumero : Double;

    procedure Calcular;
    procedure Limpar;

  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.NumeroClick(Sender: TObject);
begin
 if FUltimoNumero = 0.0 then
   edResultado.Text := TButton(Sender).Caption
 else
   edResultado.Text := edResultado.Text + TButton(Sender).Caption;

  FUltimoNumero := StrToFloat(edResultado.Text);
end;

procedure TfrmCalculadora.btDividirClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edResultado.Text);

  Calcular;
  FOperacao := '/';
end;

procedure TfrmCalculadora.btIgualClick(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmCalculadora.btLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmCalculadora.btMultiplicarClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edResultado.Text);

  Calcular;
  FOperacao := '*';
end;

procedure TfrmCalculadora.btVirgulaClick(Sender: TObject);
begin
  edResultado.Text := edResultado.Text + ',';
end;

procedure TfrmCalculadora.btSomarClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edResultado.Text);

  Calcular;
  FOperacao := '+';
end;

procedure TfrmCalculadora.btSubtrairClick(Sender: TObject);
begin
  FUltimoNumero := StrToFloat(edResultado.Text);

  Calcular;
  FOperacao := '-';
end;

procedure TfrmCalculadora.Calcular;
begin
  case FOperacao of
    '+' : begin
    FTotal := FTotal + StrToFloat(edResultado.Text);
    end;
    '-' : begin
    FTotal := FTotal - StrToFloat(edResultado.Text);
    end;
    '*' : begin
    FTotal := FTotal * StrToFloat(edResultado.Text);
    end;
    '/' : begin
    FTotal := FTotal / StrToFloat(edResultado.Text);
    end;
  end;

  edResultado.Text := FloatToStr(FTotal);

  FUltimoNumero := 0;

end;

procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
 Limpar;
end;

procedure TfrmCalculadora.Limpar;
begin
  FUltimoNumero := 0;
  FTotal := 0;
  edResultado.Text := '0';
  FOperacao := '+';
end;

end.
