within ADMSL.Intermediate.Electrical.Analog.Basic;
class Capacitor "AD version of Modelica.Electrical.Analog.Basic.Capacitor"
  extends ADMSL.Utilities.GradientInfo;
  extends MSL.Electrical.Analog.Basic.Capacitor(
                          redeclare replaceable class OnePort =
        Interfaces.OnePort);

  parameter Real g_C[NG] = zeros(NG) "The gradient of capacitance";

equation
  g_i[:] = g_C[:] * der(v) + C * der(g_v[:]);

end Capacitor;
