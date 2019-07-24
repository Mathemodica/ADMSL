within ADMSL.T1.Electrical.Analog.Interfaces;
partial model TwoPin
  "AD version of Modelica.Electrical.Analog.Interfaces.TwoPin"
  extends Utilities.GradientInfo;
  
  SI.Voltage v "Voltage drop of the two pins (= p.v - n.v)";
  PositivePin p "Positive electrical pin" annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  NegativePin n "Negative electrical pin" annotation (Placement(transformation(extent={{
            90,-10},{110,10}})));

  Real g_v[NG];

equation

  for ad_i in 1:NG loop
    g_v[ad_i] = p.g_v[ad_i] - n.g_v[ad_i];
  end for; 

  v = p.v - n.v;
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Polygon(
          points={{-120,3},{-110,0},{-120,-3},{-120,3}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{-136,0},{-111,0}}, color={160,160,164}),
        Text(
          extent={{-134,5},{-117,20}},
          lineColor={160,160,164},
          textString="p.i"),
        Line(points={{110,0},{135,0}}, color={160,160,164}),
        Polygon(
          points={{120,3},{110,0},{120,-3},{120,3}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{117,3},{134,18}},
          lineColor={160,160,164},
          textString="n.i")}));

end TwoPin;
