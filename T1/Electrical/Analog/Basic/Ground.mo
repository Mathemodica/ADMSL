within ADMSL.T1.Electrical.Analog.Basic;
model Ground "AD version of Modelica.Electrical.Analog.Basic.Ground"
  extends ADMSL.Utilities.GradientInfo;

  ADMSL.T1.Electrical.Analog.Interfaces.Pin p(NG=NG) annotation (Placement(transformation(
        origin={0,100},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  
equation

  for ad_i in 1:NG loop
    p.g_v[ad_i] = 0;
  end for;
  
  p.v = 0; 
  annotation (
    Documentation(info="<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>", revisions="<html>
<ul>
<li><em> 1998   </em>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-60,50},{60,50}}, color={0,0,255}),
        Line(points={{-40,30},{40,30}}, color={0,0,255}),
        Line(points={{-20,10},{20,10}}, color={0,0,255}),
        Line(points={{0,90},{0,50}}, color={0,0,255}),
        Text(
          extent={{-150,-10},{150,-50}},
          textString="%name",
          lineColor={0,0,255})}));

end Ground;
