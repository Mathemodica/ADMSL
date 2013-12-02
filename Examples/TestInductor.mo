within ADMSL.Examples;
model TestInductor
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-14,-20},{6,0}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor
    annotation (Placement(transformation(extent={{-14,40},{6,60}})));
equation
  connect(inductor.n, inductor.p) annotation (Line(
      points={{6,50},{22,50},{22,20},{-42,20},{-42,50},{-14,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ground.p, inductor.p) annotation (Line(
      points={{-4,0},{-6,0},{-6,20},{-42,20},{-42,50},{-14,50}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TestInductor;
