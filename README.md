# NeuralNetworkPasLib
The library for the implementation of artificial neural network into delphi.

## implementation:
```
uses NeuralNetwork;
```
## Example code  

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
    LearnArray, ThinkArray: inputArray;
    LearnTargetArray: outputArray;
begin
  neauralNetwork.Create;
  
  //Try learn 101 as true (Set array)
  
  LearnArray[0] := 1;
  LearnArray[1] := 0;
  LearnArray[2] := 1;
  
  LearnTargetArray[0] := 1;
  
  //Try learn 101 as true (Learn from array)
  
  for i:=1 to 100
    neauralNetwork.Learn(LearnArray, LearnTargetArray);
  
  //Try new situation 111 after learn
  
  ThinkArray[0] := 1;
  ThinkArray[1] := 1;
  ThinkArray[2] := 1;
  
  ShowMessage(IntToStr(
    neauralNetwork.outputToTarget(neauralNetwork.think(ThinkArray))
  ));
end;

end.
```
and change constant
```
numOfinputs = 2; // number of inputs (+1)
numOfoutupts = 0; // number of outputs (+1)
```
