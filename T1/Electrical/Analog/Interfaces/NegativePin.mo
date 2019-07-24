within ADMSL.T1.Electrical.Analog.Interfaces;
connector NegativePin
  "AD version of Modelica.Electrical.Analog.Interfaces.NegativePin"
  extends Modelica.Electrical.Analog.Interfaces.NegativePin;
  extends Utilities.GradientInfo;
  Real g_v[NG] "gradient of the voltage";
  flow Real g_i[NG] "gradient of the current";
end NegativePin;
