within ADMSL.T1.Electrical.Analog.Interfaces;
connector PositivePin
  "AD version of Modelica.Electrical.Analog.Interfaces.PositivePin"
  extends MSL.Electrical.Analog.Interfaces.PositivePin;
  extends ADMSL.Utilities.GradientInfo;
  Real g_v[NG] "gradient of the voltage";
  flow Real g_i[NG] "gradient of the current";
end PositivePin;
