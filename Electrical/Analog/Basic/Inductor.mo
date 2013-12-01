within ADMSL.Electrical.Analog.Basic;
model Inductor
  extends ADMSL.Interfaces.GradientInfo;
  extends Bases.Inductor(redeclare replaceable class OnePort =
        ADMSL.Electrical.Analog.Interfaces.OnePort);

  parameter Real g_L[NG] = zeros(NG);

equation
  g_L[1:NG] * der(i) + L * der(g_i[1:NG]) = g_v[1:NG];

end Inductor;