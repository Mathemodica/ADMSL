within ADMSL.T1.Electrical.Analog.Interfaces;
partial model OnePort
  "AD version of Modelica.Electrical.Analog.Interfaces.OnePort"
  extends ADMSL.Utilities.GradientInfo;

  extends ADMSL.MSL.Electrical.Analog.Interfaces.OnePort(
                         redeclare ADMSL.T1.Electrical.Analog.Interfaces.NegativePin n,
                         redeclare ADMSL.T1.Electrical.Analog.Interfaces.PositivePin p);

  Real g_v[NG];
  Real g_i[NG];

equation

  for ad_i in 1:NG loop
    g_v[ad_i] = p.g_v[ad_i] - n.g_v[ad_i];
    0 = p.g_i[ad_i] + n.g_i[ad_i];
    g_i[ad_i] = p.g_i[ad_i];
  end for;

end OnePort;
