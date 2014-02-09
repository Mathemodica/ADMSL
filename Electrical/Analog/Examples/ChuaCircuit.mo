within ADMSL.Electrical.Analog.Examples;
model ChuaCircuit
  extends MSL.Electrical.Analog.Examples.ChuaCircuit(
    redeclare replaceable package Basic = ADMSL.Electrical.Analog.Basic,
    redeclare replaceable package Utilities =
        ADMSL.Electrical.Analog.Examples.Utilities);
  import ADMSL.Utilities.*;

  inner parameter Integer NG = 0;
end ChuaCircuit;
