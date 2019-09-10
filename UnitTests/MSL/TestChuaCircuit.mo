within ADMSL.UnitTests.MSL;
model TestChuaCircuit

  ADMSL.MSL.Electrical.Analog.Examples.ChuaCircuit   circuit_admsl;
  Modelica.Electrical.Analog.Examples.ChuaCircuit    circuit_msl;

  Utilities.Validate  checkL;

  Utilities.Validate  checkC1;

equation

  checkL.T1 = circuit_admsl.L.v;
  checkL.T2 = circuit_msl.L.v;

  checkC1.T1 = circuit_admsl.C1.i;
  checkC1.T2 = circuit_msl.C1.i;

end TestChuaCircuit;
