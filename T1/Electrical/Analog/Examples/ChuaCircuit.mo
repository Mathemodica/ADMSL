within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit
  import ADMSL;
  extends ADMSL.Intermediate.Electrical.Analog.Examples.ChuaCircuit(
    redeclare replaceable package Basic = ADMSL.T1.Electrical.Analog.Basic,
    redeclare replaceable package Utilities =
        ADMSL.T1.Electrical.Analog.Examples.Utilities);
end ChuaCircuit;
