within ADMSL.T1.Electrical.Analog.Interfaces;
partial model TwoPin
  "AD version of Modelica.Electrical.Analog.Interfaces.TwoPin"


  extends MSL.Electrical.Analog.Interfaces.TwoPin(
                       redeclare ADMSL.T1.Electrical.Analog.Interfaces.PositivePin p,
                       redeclare ADMSL.T1.Electrical.Analog.Interfaces.NegativePin n);

  extends Utilities.GradientInfo;

  Real g_v[NG];

equation

  for ad_i in 1:NG loop
    g_v[ad_i] = p.g_v[ad_i] - n.g_v[ad_i];
  end for;

end TwoPin;
