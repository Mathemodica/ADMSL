within ADMSL.T1.Electrical.Analog.Interfaces;
partial model OnePort
  "AD version of Modelica.Electrical.Analog.Interfaces.OnePort"
  extends MSL.Electrical.Analog.Interfaces.OnePort(
                         redeclare PositivePin p,
                         redeclare NegativePin n);
  extends Utilities.GradientInfo;

  Real g_v[NG];
  Real g_i[NG];

equation

  for ad_i in 1:NG loop
    g_v[i] = p.g_v[i] - n.g_v[i];
    0 = p.g_i[i] + n.g_i[i];
    g_i[i] = p.g_i[i];
  end for; 
  
end OnePort;
