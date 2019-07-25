within ADMSL.T1.Electrical.Analog.Examples.Utilities;
model NonlinearResistor
  /* extends MSL.Electrical.Analog.Examples.Utilities.NonlinearResistor(
           redeclare replaceable class OnePort = Interfaces.OnePort);
  extends ADMSL.Utilities.GradientInfo;*/ 
  
  extends ADMSL.MSL.Electrical.Analog.Examples.Utilities.NonlinearResistor;
  redeclare replaceable partial model Port = ADMSL.T1.Electrical.Analog.Interfaces.OnePort;     
  extends Port; 

  parameter Real g_Ga[NG] = zeros(NG)
    "gradient of Conductance in inner voltage range";
  parameter Real g_Gb[NG] = zeros(NG)
    "gradient of Conductance in outer voltage range";
  parameter Real g_Ve[NG] = zeros(NG) "gradient of Inner voltage range limit";
  
equation

  for ad_i in 1:NG loop
    // i = if (v < -Ve) then Gb*(v + Ve) - Ga*Ve else if (v > Ve) then Gb*(v - Ve) + Ga*Ve else Ga*v;

    g_i[ad_i] = if  (v < -Ve) then 
      g_Gb[ad_i] * (v + Ve) + Gb * (g_v[ad_i] + g_Ve[ad_i]) - (g_Ga[ad_i] * Ve + Ga * g_Ve[ad_i])
                else if (v > Ve) then  
      g_Gb[ad_i] * (v - Ve) + Gb * (g_v[ad_i] - g_Ve[ad_i]) + (g_Ga[ad_i] * Ve + Ga * g_Ve[ad_i])
                else
     (g_Ga[ad_i] * Ve + Ga * g_Ve[ad_i]);
   
   end for;   
     
end NonlinearResistor;
