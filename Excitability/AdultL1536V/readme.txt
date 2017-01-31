This model reproduces Figure 6a and 6b and Supplementary Figure 5b of
the article

"State and location dependence of action potential metabolic cost in
cortical pyramidal neurons". Nature Neuroscience (2012)
doi:10.1038/nn.3132

When the folder is compiled using the mknrndll script the simulation
can be started with "mosinit.hoc".

The newly developed model of the axonal K+ currents (Kv1_axonal.mod)
was based on step evoked K+ currents including activation,
deactivation and inactivation protocols as well as steady state
curves. To describe the activation, eight Hodgkin-Huxley gates were
used (n^8). To describe the biphasic inactivation and recovery from
inactivation, two populations of channels with different
Hodgkin-Huxley inactivation gates were used (n^8*h1^+n^8*h2).

To analyze the AP efficiency and the ATP usage on a subcellular level,
the Na+/K+ charge overlap, the excess Na+ influx and the ATP usage
were calculated as RANGE variables (charge.mod).

Executing "ch()" in the terminal shell (see charge.hoc) will print
average ATP usage per cellular compartment as shown below (some of the
information is exported into text files).

-------------------------------------------------------------------------

The Na influx was analyzed from 517.000000 to 535.000000 ms
Required ATP molecules to pump Na ions out:
Total: 1.998503e+08
Soma: 1.416016e+07
Basal dendrite: 4.609883e+07
Apical dendrite: 9.149446e+07
Axon Initial Segment: 2.498228e+07
Axon collaterals: 2.095502e+07
Myelin: 7.227968e+05
Node: 1.436733e+06

-------------------------------------------------------------------------
-------------------------------------------------------------------------

Required ATP molecules to pump Na ions out per um^2:
Total: 2.818287e+03
Soma: 6.810007e+03
Basal dendrite: 2.531221e+03
Apical dendrite: 2.213969e+03
Axon Initial Segment: 5.531797e+04
Axon collaterals: 3.932075e+03
Myelin: 2.081271e+02
Node: 3.517895e+04
-------------------------------------------------------------------------
Total area (um^2): 7.091197e+04
Soma area (um^2): 2.079316e+03
-------------------------------------------------------------------------

For questions please contact s.hallermann@eni-g.de or
m.kole@nin.knaw.nl


June 12th 2012, Stefan Hallermann

20140226 ModelDB Administrator: To prevent collision with NEURON's
"charge" the "charge" mechanism has been changed to "charge_" with
changes in the hoc code.  The charge in names of files was left
unchanged.

