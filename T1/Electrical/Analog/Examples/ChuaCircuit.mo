within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit "An algorithmically differentiated version of the MSL standard Chua Circuit example with no active parameter"

  extends ADMSL.MSL.Electrical.Analog.Examples.ChuaCircuit(
    redeclare replaceable package Component =
      ADMSL.T1.Electrical.Analog,
    redeclare replaceable package Util =
      ADMSL.T1.Electrical.Analog.Examples.Utilities);

  inner parameter Integer NG = 0 "number of active parameters";

end ChuaCircuit;
