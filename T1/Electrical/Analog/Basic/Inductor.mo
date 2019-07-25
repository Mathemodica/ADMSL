within ADMSL.T1.Electrical.Analog.Basic;
model Inductor "AD version of Modelica.Electrical.Analog.Basic.Inductor"
  // extends ADMSL.T1.Electrical.Analog.Interfaces.OnePort(i(start=0));
  
  extends ADMSL.MSL.Electrical.Analog.Basic.Inductor;
  redeclare replaceable partial model Port = ADMSL.T1.Electrical.Analog.Interfaces.OnePort;     
  extends Port; 
  
  //extends Modelica.Electrical.Analog.Interfaces.OnePort(i(start=0));
  // parameter SI.Inductance L(start=1) "Inductance";
  parameter Real g_L[NG] = zeros(NG) "The gradient of inductance";

equation

  for ad_i in 1:NG loop
    g_v[ad_i] = g_L[ad_i] * der(i) + L * der(g_i[ad_i]) ;
  end for; 
  
 /* L*der(i) = v;
  annotation (
    Documentation(info="<html>
<p>The linear inductor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>v = L * di/dt</em>. The Inductance <em>L</em> is allowed to be positive, or zero.</p>

</html>", revisions="<html>
<ul>
<li><em> 1998   </em>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{60,0},{90,0}}, color={0,0,255}),
        Line(points={{-90,0},{-60,0}}, color={0,0,255}),
        Text(
          extent={{-150,-40},{150,-80}},
          textString="L=%L"),
        Line(
          points={{-60,0},{-59,6},{-52,14},{-38,14},{-31,6},{-30,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-30,0},{-29,6},{-22,14},{-8,14},{-1,6},{0,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{0,0},{1,6},{8,14},{22,14},{29,6},{30,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{30,0},{31,6},{38,14},{52,14},{59,6},{60,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          lineColor={0,0,255})}));
   */ 
end Inductor;
