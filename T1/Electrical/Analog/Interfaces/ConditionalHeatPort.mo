within ADMSL.T1.Electrical.Analog.Interfaces;

partial model ConditionalHeatPort 
  "AD version of Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort with useHeatPort=false"
 
  extends ADMSL.Utilities.GradientInfo; 
                  
  parameter Boolean useHeatPort = false "=true, if heatPort is enabled"
  annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter SI.Temperature T=293.15
    "Fixed device temperature if useHeatPort = false" annotation(Dialog(enable=not useHeatPort));
    
  ADMSL.T1.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(
                  final T=T_heatPort, final Q_flow=-LossPower,
                  final g_T = g_T_heatPort, final g_Q_flow = g_LossPower,NG=NG) if useHeatPort
    "Conditional heat port"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
        iconTransformation(extent={{-10,-110},{10,-90}})));
  SI.Power LossPower "Loss power leaving component via heatPort";
  SI.Temperature T_heatPort "Temperature of heatPort";

  parameter Real g_T[NG] = zeros(NG) "The gradient of the fixed temperature";

  Real  g_LossPower[NG];
  Real  g_T_heatPort[NG];

equation

  if not useHeatPort then
     T_heatPort = T; 
     for ad_i in 1 : NG loop 
      g_T_heatPort[ad_i] = g_T[ad_i];
     end for; 
  end if;
  
  
  annotation (Documentation(revisions="<html>
<ul>
<li><em>February 17, 2009</em>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>", info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <strong>useHeatPort</strong> is set to <strong>false</strong> (default), no heat port is available, and the thermal
   loss power flows internally to the ground. In this case, the parameter <strong>T</strong> specifies
   the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <strong>useHeatPort</strong> is set to <strong>true</strong>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<strong>lossPower = ...</strong>). As device temperature
<strong>T_heatPort</strong> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));

end ConditionalHeatPort;
