within ADMSL.Electrical.Analog.Interfaces;
partial model TwoPin
  extends Bases.TwoPin(redeclare ADMSL.Electrical.Analog.Interfaces.PositivePin
                                                                                p,
                       redeclare ADMSL.Electrical.Analog.Interfaces.NegativePin
                                                                                n);
  extends ADMSL.Interfaces.GradientInfo;

  Real g_v[NG];

equation
  g_v[1:NG] = p.g_v[1:p.NG] - n.g_v[1:n.NG];

end TwoPin;
