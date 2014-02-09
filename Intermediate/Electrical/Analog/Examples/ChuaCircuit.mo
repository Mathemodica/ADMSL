within ADMSL.Intermediate.Electrical.Analog.Examples;
model ChuaCircuit
  import ADMSL;
  extends MSL.Electrical.Analog.Examples.ChuaCircuit(
    redeclare replaceable package Basic =
        ADMSL.Intermediate.Electrical.Analog.Basic,
    redeclare replaceable package Utilities =
        ADMSL.Intermediate.Electrical.Analog.Examples.Utilities);
  import ADMSL.Utilities.*;

  inner parameter Integer NG = 0;
end ChuaCircuit;
