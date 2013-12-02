within ADMSL.Electrical.Analog.Basic;
model Capacitor
  extends ADMSL.Interfaces.GradientInfo;
  extends Bases.Capacitor(redeclare replaceable class OnePort =
        ADMSL.Electrical.Analog.Interfaces.OnePort);

  parameter Real g_C[NG] = zeros(NG);

equation
  g_i[1:NG] = g_C[1:NG] * der(v) + C * der(g_v[1:NG]);

end Capacitor;
