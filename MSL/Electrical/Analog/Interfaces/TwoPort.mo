within ADMSL.MSL.Electrical.Analog.Interfaces;
partial model TwoPort "Component with two electrical ports, including current"
  Modelica.SIunits.Voltage v1 "Voltage drop over the left port";
  Modelica.SIunits.Voltage v2 "Voltage drop over the right port";
  Modelica.SIunits.Current i1
    "Current flowing from pos. to neg. pin of the left port";
  Modelica.SIunits.Current i2
    "Current flowing from pos. to neg. pin of the right port";
  replaceable Modelica.Electrical.Analog.Interfaces.PositivePin p1
    "Positive pin of the left port (potential p1.v > n1.v for positive voltage drop v1)"
                                                                                                      annotation (Placement(
        transformation(extent={{-110,40},{-90,60}}, rotation=0)));
  replaceable Modelica.Electrical.Analog.Interfaces.NegativePin n1
    "Negative pin of the left port"              annotation (Placement(
        transformation(extent={{-90,-60},{-110,-40}}, rotation=0)));
  replaceable Modelica.Electrical.Analog.Interfaces.PositivePin p2
    "Positive pin of the right port (potential p2.v > n2.v for positive voltage drop v2)"
                                                                                                       annotation (Placement(
        transformation(extent={{110,40},{90,60}}, rotation=0)));
  replaceable Modelica.Electrical.Analog.Interfaces.NegativePin n2
    "Negative pin of the right port"              annotation (Placement(
        transformation(extent={{90,-60},{110,-40}}, rotation=0)));
equation
  v1 = p1.v - n1.v;
  v2 = p2.v - n2.v;
  0 = p1.i + n1.i;
  0 = p2.i + n2.i;
  i1 = p1.i;
  i2 = p2.i;
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Polygon(
          points={{-120,53},{-110,50},{-120,47},{-120,53}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{-136,50},{-111,50}}, color={160,160,164}),
        Polygon(
          points={{127,-47},{137,-50},{127,-53},{127,-47}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{111,-50},{136,-50}}, color={160,160,164}),
        Text(
          extent={{112,-44},{128,-29}},
          lineColor={160,160,164},
          textString="i2"),
        Text(
          extent={{118,52},{135,67}},
          lineColor={0,0,0},
          textString="i2"),
        Polygon(
          points={{120,53},{110,50},{120,47},{120,53}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={160,160,164}),
        Line(points={{111,50},{136,50}}, color={0,0,0}),
        Line(points={{-136,-49},{-111,-49}}, color={160,160,164}),
        Polygon(
          points={{-126,-46},{-136,-49},{-126,-52},{-126,-46}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-127,-46},{-110,-31}},
          lineColor={160,160,164},
          textString="i1"),
        Text(
          extent={{-136,53},{-119,68}},
          lineColor={160,160,164},
          textString="i1")}),
    Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",
        info="<html>
<p>TwoPort is a partial model that consists of two ports. Like OnePort each port has two pins. It is assumed that the current flowing into the positive  pin   is identical to the current flowing out of pin n. This currents of each port are  provided explicitly as currents i1 and i2, the voltages respectively as v1 and v2.</p>
</html>"));
end TwoPort;
