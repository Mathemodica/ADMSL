within ADMSL.Utilities;
function unitVector "returns a unit vector"

  input Integer ith "ith component is one";
  input Integer n "size of the vector";
  output Real[n] ei "e_i unit vector";

algorithm
 for i in 1:n loop
   ei[i] := 0;
 end for;

 ei[ith] := 1.0;

end unitVector;
