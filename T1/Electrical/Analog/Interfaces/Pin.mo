within ADMSL.T1.Electrical.Analog.Interfaces;
connector Pin "AD version of Modelica.Electrical.Analog.Interfaces.Pin"
  extends ADMSL.MSL.Electrical.Analog.Interfaces.Pin;
  extends ADMSL.Utilities.GradientInfo;
  Real g_v[NG] "gradient of the voltage";
  flow Real g_i[NG] "gradient of the current";
end Pin;
