# NeuralNetworkPasLib
The library for the implementation of artificial neural network into delphi.

See the [wiki](wiki) for documentation.

## implementation:
```pascal
uses NeuralNetwork;
```
## Example code  

```pascal
unit Unit1;

interface

uses Forms, sysutils;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  end;

var Form1: TForm1;

Implementation
{$R *.dfm}

uses Dialogs, NeuralNetwork;

procedure TForm1.FormCreate(Sender: TObject);
var i, j: integer;
    LearnArray: array [0..3] of inputArray;
    ThinkArray: inputArray;
    ThinkOutput: outputArray;
    LearnTargetArray: array [0..3] of outputArray;
begin
  // Create Neaural Network and randomize weights
  neauralNetwork.Create;

  //001 as false (Set array)

  LearnArray[0][0] := 0;
  LearnArray[0][1] := 0;
  LearnArray[0][2] := 1;

  LearnTargetArray[0][0] := 1;

  //111 as true (Set array)

  LearnArray[1][0] := 1;
  LearnArray[1][1] := 1;
  LearnArray[1][2] := 1;

  LearnTargetArray[1][0] := 1;

  //101 as true (Set array)

  LearnArray[2][0] := 1;
  LearnArray[2][1] := 0;
  LearnArray[2][2] := 1;

  LearnTargetArray[2][0] := 1;

  //011 as false (Set array)

  LearnArray[3][0] := 0;
  LearnArray[3][1] := 1;
  LearnArray[3][2] := 1;

  LearnTargetArray[3][0] := 0;

  //Try learn 111 as true, 101 as true, 011 as false, 001 as false (Learn from array) -> 5000 times

  for i:=1 to 5000 do
    for j := 0 to 3 do  //learn 4 diferent situation
      neauralNetwork.Learn(LearnArray[j], LearnTargetArray[j]);

  //Try new situation 100 after learn

  ThinkArray[0] := 1;
  ThinkArray[1] := 0;
  ThinkArray[2] := 0;

  ThinkOutput := neauralNetwork.think(ThinkArray); //-> 0,999... WOW it is so close

  ShowMessage(FloatToStr(ThinkOutput[0]));
end;

end.
```
**and change constant**
```pascal
numOfinputs = 2; // number of inputs (+1)
numOfoutupts = 0; // number of outputs (+1)
```
[documentation](wiki)
