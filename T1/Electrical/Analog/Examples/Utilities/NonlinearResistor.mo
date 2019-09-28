within ADMSL.T1.Electrical.Analog.Examples.Utilities;
model NonlinearResistor

  extends ADMSL.T1.Electrical.Analog.Interfaces.OnePort; 

  parameter Real g_Ga[NG] = zeros(NG)
    "gradient of Conductance in inner voltage range";
  parameter Real g_Gb[NG] = zeros(NG)
    "gradient of Conductance in outer voltage range";
  parameter Real g_Ve[NG] = zeros(NG) "gradient of Inner voltage range limit";
  
  parameter Modelica.SIunits.Conductance Ga
    "Conductance in inner voltage range";
  parameter Modelica.SIunits.Conductance Gb
    "Conductance in outer voltage range";
  parameter Modelica.SIunits.Voltage Ve "Inner voltage range limit";
  
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
   
   i = if (v < -Ve) then Gb*(v + Ve) - Ga*Ve else if (v > Ve) then Gb*(v - Ve)
     + Ga*Ve else Ga*v;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Line(points={{-50,-60},{50,60}}, color={0,0,255}),
        Polygon(
          points={{50,60},{38,52},{44,46},{50,60}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Text(
          extent={{-150,97},{150,67}},
          lineColor={0,0,255},
          textString="%name")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Line(points={{-50,-60},{50,60}}, color={0,0,255}),
        Polygon(
          points={{50,60},{38,52},{44,46},{50,60}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Text(
          extent={{-100,100},{100,70}},
          textString="%name",
          lineColor={0,0,255})}),
    Documentation(info="<html>
<p>This is the only nonlinear component for Chua&#39;;s circuit. It is a piecewise linear resistor with both an inner and an outer range, which includes the inner one. The slopes of both ranges are given by parameters. The resistance caracteristic is continuous. For Chua&#39;;s circuit both slopes have to be chosen to be negative.</p>
</html>"));
     
end NonlinearResistor;
