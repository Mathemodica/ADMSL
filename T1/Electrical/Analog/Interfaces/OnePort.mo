within ADMSL.T1.Electrical.Analog.Interfaces;
partial model OnePort
  "AD version of Modelica.Electrical.Analog.Interfaces.OnePort"
 extends Intermediate.Electrical.Analog.Interfaces.OnePort(
                       redeclare PositivePin p,
                       redeclare NegativePin n);
end OnePort;
