within ADMSL.Intermediate.Electrical.Analog.Examples.Utilities;
class NonlinearResistor
  extends MSL.Electrical.Analog.Examples.Utilities.NonlinearResistor(
                                  redeclare replaceable class OnePort =
        Interfaces.OnePort);
  extends ADMSL.Utilities.GradientInfo;

  parameter Real g_Ga[NG] = zeros(NG)
    "gradient of Conductance in inner voltage range";
  parameter Real g_Gb[NG] = zeros(NG)
    "gradient of Conductance in outer voltage range";
  parameter Real g_Ve[NG] = zeros(NG) "gradient of Inner voltage range limit";
equation

  // i = if (v < -Ve) then Gb*(v + Ve) - Ga*Ve else if (v > Ve) then Gb*(v - Ve) + Ga*Ve else Ga*v;

  g_i[1:NG] = if
                (v < -Ve) then g_Gb[1:NG] * (v + Ve) + Gb * (g_v[1:NG] + g_Ve[1:NG]) - (g_Ga[1:NG] * Ve + Ga * g_Ve[1:NG])
 else
     if (v > Ve) then  g_Gb[1:NG] * (v - Ve) + Gb * (g_v[1:NG] - g_Ve[1:NG]) + (g_Ga[1:NG] * Ve + Ga * g_Ve[1:NG])
 else
     (g_Ga[1:NG] * Ve + Ga * g_Ve[1:NG]);

end NonlinearResistor;
