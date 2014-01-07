within ADMSL.Electrical.Analog.Basic;
model Capacitor
  extends ADMSL.Interfaces.GradientInfo;
  extends Bases.Capacitor(redeclare replaceable class OnePort =
        ADMSL.Electrical.Analog.Interfaces.OnePort);

  parameter Real g_C[NG] = zeros(NG);

equation
  g_i[:] = g_C[:] * der(v) + C * der(g_v[:]);

end Capacitor;
