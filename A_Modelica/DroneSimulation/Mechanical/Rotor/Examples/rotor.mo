within DroneSimulation.Mechanical.Rotor.Examples;
model rotor
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation=false)
    annotation (Placement(transformation(extent={{4,14},{24,34}})));

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a Airframe
    annotation (Placement(transformation(extent={{86,36},{118,68}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeAngularVelocity
    relativeAngularVelocity
    annotation (Placement(transformation(extent={{30,74},{50,94}})));
  Modelica.Mechanics.MultiBody.Forces.Torque torque1
    annotation (Placement(transformation(extent={{8,-88},{28,-68}})));
  Modelica.Blocks.Math.Gain gain(k=-0.004) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={40,10})));
  Blocks.Routing.RealExtract realExtract annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={40,40})));
  Blocks.Routing.RealExtend realExtend2 annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={40,-22})));

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a force
    "Coordinate system fixed to the joint with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{-118,-78},{-86,-46}}),
      iconTransformation(extent={{-118,-78},{-86,-46}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a Blade
    annotation (Placement(transformation(extent={{86,-56},{118,-24}})));
Modelica.Mechanics.MultiBody.Interfaces.Frame_a torque_1
    "Coordinate system a fixed to the component with one cut-force and cut-torque"
  annotation (Placement(transformation(extent={{-118,44},{-86,76}}),
      iconTransformation(extent={{-118,44},{-86,76}})));
Modelica.Mechanics.MultiBody.Interfaces.Frame_b torque_2
    "Coordinate system b fixed to the component with one cut-force and cut-torque"
  annotation (Placement(transformation(extent={{-118,-16},{-86,16}}),
      iconTransformation(extent={{-118,-16},{-86,16}})));
equation
  connect(relativeAngularVelocity.w_rel, realExtract.u)
    annotation (Line(points={{40,73},{40,46}}, color={0,0,127}));
  connect(realExtract.y, gain.u)
    annotation (Line(points={{40,33.4},{40,17.2}}, color={0,0,127}));
  connect(gain.y, realExtend2.u)
    annotation (Line(points={{40,3.4},{40,-14.8}},
                                                color={0,0,127}));
  connect(realExtend2.y, torque1.torque) annotation (Line(points={{40,-28.6},
          {40,-40},{12,-40},{12,-66}},
                              color={0,0,127}));
  connect(relativeAngularVelocity.frame_a, torque1.frame_a) annotation (
      Line(
      points={{30,84},{-14,84},{-14,-78},{8,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_a, torque1.frame_a) annotation (Line(
      points={{4,24},{-14,24},{-14,-78},{8,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_a, force) annotation (Line(
      points={{4,24},{-48,24},{-48,-62},{-102,-62}},
      color={95,95,95},
      thickness=0.5));
  connect(Airframe, torque1.frame_a) annotation (Line(
      points={{102,52},{84,52},{84,92},{-14,92},{-14,-78},{8,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(Blade, torque1.frame_b) annotation (Line(
      points={{102,-40},{62,-40},{62,-78},{28,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_b, torque1.frame_b) annotation (Line(
      points={{24,24},{62,24},{62,-78},{28,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(relativeAngularVelocity.frame_b, torque1.frame_b) annotation (
      Line(
      points={{50,84},{62,84},{62,-78},{28,-78}},
      color={95,95,95},
      thickness=0.5));
connect(torque_2, torque1.frame_b) annotation (Line(
    points={{-102,0},{62,0},{62,-78},{28,-78}},
    color={95,95,95},
    thickness=0.5));
connect(torque_1, torque1.frame_a) annotation (Line(
    points={{-102,60},{-14,60},{-14,-78},{8,-78}},
    color={95,95,95},
    thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
          Text(
          extent={{-72,22},{76,-20}},
          lineColor={28,108,200},
          textString="Rotor")}),      Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end rotor;
