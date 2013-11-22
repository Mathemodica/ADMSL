within ADMSL.Electrical.Analog.Interfaces;
connector PositivePin
  extends Modelica.Electrical.Analog.Interfaces.PositivePin;
  extends ADMSL.Interfaces.GradientInfo;
  Real g_v[NG] "gradient of the voltage";
  flow Real g_i[NG] "gradient of the current";
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
end PositivePin;

