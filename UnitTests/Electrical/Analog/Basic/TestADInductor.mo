within ADMSL.UnitTests.Electrical.Analog.Basic;
model TestADInductor

  inner parameter Integer NG = 2;

  ADMSL.T1.Electrical.Analog.Basic.Ground
                                       ground
    annotation (Placement(transformation(extent={{-14,-30},{6,-10}})));
  ADMSL.T1.Electrical.Analog.Basic.Inductor
                                         inductor
    annotation (Placement(transformation(extent={{-14,26},{6,46}})));
equation
  connect(inductor.n, inductor.p) annotation (Line(
      points={{6,36},{26,36},{26,26},{44,26},{44,4},{-50,4},{-50,36},{-14,36}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ground.p, inductor.p) annotation (Line(
      points={{-4,-10},{-6,-10},{-6,4},{-50,4},{-50,36},{-14,36}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TestADInductor;
