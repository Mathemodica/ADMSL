within ADMSL.MSL.Electrical.Analog.Interfaces;
partial model TwoPin "Component with two electrical pins"
  Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  replaceable MSL.Electrical.Analog.Interfaces.PositivePin p
    "Positive pin Positive pin (potential p.v > n.v for positive voltage drop v)"
                                                                                              annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}, rotation=0)));

  replaceable MSL.Electrical.Analog.Interfaces.NegativePin n "Negative pin"
                               annotation (Placement(transformation(extent={{
            90,-10},{110,10}}, rotation=0)));

equation
  v = p.v - n.v;
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
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
          textString="n.i")}),
    Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",
        info="<html>
<p>TwoPin is a partial model with two pins and one internal variable for the voltage over the two pins. Internal currents are not defined. It is intended to be used in cases where the model which inherits TwoPin is composed by combining other components graphically, not by equations.</p>
</html>"));
end TwoPin;
