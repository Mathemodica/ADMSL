within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit0
  "An algorithmically differentiated version of the MSL standard Chua Circuit example with no active parameter 
  / heat port is not enabled "

  extends
    ADMSL.MSL.Electrical.Analog.Examples.ChuaCircuit0(
    redeclare replaceable package Component =
      ADMSL.T1.Electrical.Analog,
    redeclare replaceable package Util =
      ADMSL.T1.Electrical.Analog.Examples.Utilities);

  inner parameter Integer NG = 0 "number of active parameters";

end ChuaCircuit0;
