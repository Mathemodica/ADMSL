within ADMSL.T1.Electrical.Analog.Interfaces;
partial model OnePort
  "AD version of Modelica.Electrical.Analog.Interfaces.OnePort"
  extends ADMSL.Utilities.GradientInfo;
  
  SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  SI.Current i "Current flowing from pin p to pin n";
  
  ADMSL.T1.Electrical.Analog.Interfaces.PositivePin p(NG=NG) 
    "Positive pin (potential p.v > n.v for positive voltage drop v)"                           annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        
  ADMSL.T1.Electrical.Analog.Interfaces.NegativePin n(NG=NG) 
    "Negative pin"
                               annotation (Placement(transformation(extent={{
            110,-10},{90,10}}, rotation=0))); 
  
  Real g_v[NG];
  Real g_i[NG];

equation

  for ad_i in 1:NG loop
    g_v[ad_i] = p.g_v[ad_i] - n.g_v[ad_i];
    0 = p.g_i[ad_i] + n.g_i[ad_i];
    g_i[ad_i] = p.g_i[ad_i];
  end for; 
  
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  annotation (
    Documentation(info="<html>
<p>Superclass of elements which have <b>two</b> electrical pins: the positive pin connector <i>p</i>, and the negative pin connector <i>n</i>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>",
 revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(points={{-110,20},{-85,20}}, color={160,160,164}),
        Polygon(
          points={{-95,23},{-85,20},{-95,17},{-95,23}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{90,20},{115,20}}, color={160,160,164}),
        Line(points={{-125,0},{-115,0}}, color={160,160,164}),
        Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
        Text(
          extent={{-110,25},{-90,45}},
          lineColor={160,160,164},
          textString="i"),
        Polygon(
          points={{105,23},{115,20},{105,17},{105,23}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{115,0},{125,0}}, color={160,160,164}),
        Text(
          extent={{90,45},{110,25}},
          lineColor={160,160,164},
          textString="i")}));
  
end OnePort;
