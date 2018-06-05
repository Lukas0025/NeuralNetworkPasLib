# NeuralNetworkPasLib
The library for the implementation of artificial neural network into delphi.

## implementation:
```
uses NeuralNetwork;
```
## Sample cose

```
unit Unit1;

interface

uses Forms;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  end;

var Form1: TForm1;

Implementation
{$R *.dfm}

uses Dialogs, NeuralNetwork;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin
  neauralNetwork.Create;
  for i:=1 to 100
    neauralNetwork.Learn();
end;

end.
```
