within ADMSL.Utilities;

model Validate "Assert correctness of a whole solution trajectory"
  parameter Real MaxAccErr = 1e-3 "Maximum Accumulation Error";
  parameter String name = "" "Name of Test";
  input Modelica.Blocks.Interfaces.RealInput T1 "First trajectory" annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 66}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput T2 "Second trajectory" annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Area "The area of the difference between the input trajectories" annotation(
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  AssertContinuousTrajectory check(MaxAccErr = MaxAccErr, name = name);
equation
  T1 = check.T1;
  T2 = check.T2;
  Area = check.Area;
  annotation(
    Documentation(info = "<html><head></head><body><div>A testing facitilty for ensuring the correctness of a continuous variabl.</div><div><br></div><div>Modification of the same component implemented in XogenyTest with additional icons from MSL for visual modeling since XogenyTest does not employ MSL.&nbsp;</div><div><br></div><br></body></html>"),
    Icon(graphics = {Rectangle(origin = {-14, -1}, lineColor = {0, 0, 127}, pattern = LinePattern.DashDotDot, extent = {{-86, 101}, {114, -99}})}));
end Validate;
