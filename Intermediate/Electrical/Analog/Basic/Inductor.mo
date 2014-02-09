within ADMSL.Intermediate.Electrical.Analog.Basic;
class Inductor "AD version of Modelica.Electrical.Analog.Basic.Inductor"
  extends ADMSL.Utilities.GradientInfo;
  extends MSL.Electrical.Analog.Basic.Inductor(
                         redeclare replaceable class OnePort =
        Interfaces.OnePort);

  parameter Real g_L[NG] = zeros(NG) "The gradient of inductance";

equation
  g_L[1:NG] * der(i) + L * der(g_i[1:NG]) = g_v[1:NG];

end Inductor;
