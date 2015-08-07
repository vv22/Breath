unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type

TBreath = class  
 private
  fIn , fHold,  fEx :Integer;
  fIne, fHolde, fExe:Integer;
 public
  procedure   Init(ATime:Integer);
  procedure   Live;
  procedure   State(out aIn,aHold,aEx:Integer);
  constructor Create; virtual;
  destructor  Destroy; override;
end;


  TForm1 = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
     fTime:Integer; 
     Br:TBreath;
     procedure Progress;
    class destructor Done;
    class constructor Init;
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TBreath }

constructor TBreath.Create;
begin
 inherited;
end;

destructor TBreath.Destroy;
begin
 inherited;
end;

procedure TBreath.State(out aIn, aHold, aEx: Integer);
begin
 aIn:=fIn;
 aHold:=fHold;
 aEx:=fEx;
end;

procedure TBreath.Live;
begin
 if fIn = fIne then begin
  if fHold = fHolde then begin
   if fEx = fExe-1 then begin
    fIn := 0;
    fHold := 0;
    fEx := 0;
   end else Inc(fEx);
  end else Inc(fHold);
 end else Inc(fIn);
end;

procedure TBreath.Init(ATime: Integer);
begin
 if ATime<5 then ATime :=5 else if ATime>15 then ATime:=15;

 fIn := 0;
 fEx := 0;
 fHold := 0;

 fIne := ATime;
 fExe := ATime*2;
 fHolde := ATime*4;  
end;

{ TForm1 }

class destructor TForm1.Done;
begin
//
end;

class constructor TForm1.Init;
begin
//
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var 
 t:Integer;
begin
 t:=ComboBox1.ItemIndex+5;
 Br.Init(t);
 ProgressBar1.Max:=t;
 ProgressBar2.Max:=t*4;
 ProgressBar3.Max:=t*2;  
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Br.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
const 
 t=5;
begin
 Br:=TBreath.Create;
 Br.Init(t);
 ProgressBar1.Max:=t;
 ProgressBar2.Max:=t*4;
 ProgressBar3.Max:=t*2;  
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Br.Live;
 Progress;
end;

procedure TForm1.Progress;
var 
 a,b,c:Integer;
begin
 Br.State(a,b,c);
 ProgressBar1.Position:=a;
 ProgressBar2.Position:=b;
 ProgressBar3.Position:=c;  
 Tag:=Tag+1;
 if (a=0) and (b=0) and (c=0) then begin
  Edit1.Tag:=Edit1.Tag+1;
  Edit1.Text:=IntToStr(Edit1.Tag);
  Tag:=0;
 end;
 Caption:=IntToStr(Tag); 
end;

end.
