unit neuralNetwork;

interface

Const
  numOfinputs = 255; // number of inputs
  numOfoutupts = 3; // number of outputs

type
  inputArray = array [0 .. numOfinputs] of integer;
  outputArray = array [0 .. numOfoutupts] of double;
  synapticArray = Array [0 .. numOfoutupts, 0 .. numOfinputs] of double;

  neauralNetwork = Class
private
  class function sigmoid(x: double): double;
  class function derivative(x: double): double;
  class function CalcCorectWeights(input: double; fail: double; thinkout: double): double;

public
  class var synapticWeights: synapticArray;
  constructor Create;
  class procedure RandomSynapticWeights;
  class procedure learn(input: inputArray; target: outputArray);
  class function think(input: inputArray): outputArray;
  class function targetToOutput(target: integer): outputArray;
  class function outputToTarget(output: outputArray): integer;
end;

implementation

uses SysUtils, Windows, Math;

constructor neauralNetwork.Create;
begin
  RandomSynapticWeights;
end;

class function neauralNetwork.targetToOutput(target: integer): outputArray;
var i: integer;
    o: outputArray;
begin
     for i:= 0 to 3 do if i = target then o[i] := 1
                       else o[i] := 0;

     targetToOutput := o;
end;

class function neauralNetwork.outputToTarget(output: outputArray): integer;
var i, max: integer;
begin
     max := 0;

     for i:= 1 to 3 do if output[max] < output[i] then max := i;

     outputToTarget := max;
end;

class procedure neauralNetwork.RandomSynapticWeights;
var
  i, j: integer;
begin
    for i := 0 to numOfoutupts do
      for j := 0 to numOfinputs do
        synapticWeights[i][j] := Random(100) / 100;
end;

// Sigmoid, popisuje køivku tvaru S
// Normalizuje mezi 0 a 1
class function neauralNetwork.sigmoid(x: double): double;
begin
  // exp() provádí e na x-tou
  sigmoid := 1 / (1 + exp(-x));
end;

// Derivace pro Sigmoidní køivku
class function neauralNetwork.derivative(x: double): double;
begin
  derivative := x * (1 - x);
end;

class function neauralNetwork.CalcCorectWeights(input: double; fail: double; thinkout: double): double;
begin
  CalcCorectWeights := input * fail * derivative(thinkout);
end;

class procedure neauralNetwork.learn(input: inputArray; target: outputArray);
var thinkOutput: outputArray;
    fail: double;
    i, j: integer;
begin
  thinkOutput := think(input);
  
  for i := 0 to numOfoutupts do begin
    fail := target[i] - thinkOutput[i];
	  for j := 0 to numOfinputs do
		  synapticWeights[i][j] := synapticWeights[i][j] + CalcCorectWeights(input[j], fail, thinkoutput[i]);
  end;

 end;

class function neauralNetwork.think(input: inputArray): outputArray;
var
  i, j: integer;
  a: outputArray;
begin
  for i := 0 to numOfoutupts do a[i] := 0;
    

  for i := 0 to numOfoutupts do begin
    for j := 0 to numOfinputs do a[i] := a[i] + synapticWeights[i][j] * (input[j] / 5000) ;
    a[i] := sigmoid(a[i]);
  end;

  i := outputToTarget(a);
  OutputDebugString(PChar('Idetifikována situace ' + IntToStr(i) + ' s pravděpodobností ' + FloatToStr(a[i])));

  think := a;
end;

end.
