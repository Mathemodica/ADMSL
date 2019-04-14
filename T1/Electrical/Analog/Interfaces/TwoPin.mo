within ADMSL.T1.Electrical.Analog.Interfaces;
partial model TwoPin
  "AD version of Modelica.Electrical.Analog.Interfaces.TwoPin"
  extends MSL.Electrical.Analog.Interfaces.TwoPin(
                       redeclare PositivePin p,
                       redeclare NegativePin n);
  extends Utilities.GradientInfo;

  Real g_v[NG];

equation

  for i in 1:NG loop
    g_v[i] = p.g_v[i] - n.g_v[i];
  end for; 
  
end TwoPin;
