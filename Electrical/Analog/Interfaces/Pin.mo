within ADMSL.Electrical.Analog.Interfaces;
connector Pin "AD version of Modelica.Electrical.Analog.Interfaces.Pin"
  extends Modelica.Electrical.Analog.Interfaces.Pin;
  extends ADMSL.Utilities.GradientInfo;
  Real g_v[NG] "The gradient of the voltage";
  flow Real g_i[NG] "The gradient of the current";
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
end Pin;
