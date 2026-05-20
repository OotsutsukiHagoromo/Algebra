// settings.outformat="pdf";

include "preamble_asy.asy";

import graph;
import labelpath;
import patterns;
import geometry;

size(200);

// xlimits(-0.6, maxx);
// ylimits(-0.6, maxy);

// xequals(L="$y$", x=0, arrow=Arrow(HookHead), axispen);
// yequals(L="$x$", y=0, arrow=Arrow(HookHead), axispen);

// Растянем немного картинку, чтобы всё влезло
unitsize(4cm);


pair A = (0, 0);
pair B = (1, 0);
pair C = (1, 3/5);

path triangle = A--B--C--cycle;

path AB = A--B;
path AC = A--C;
path BC = B--C;

pen drawpen  = defaultpen;
pen labelpen = defaultpen;

draw(triangle, drawpen);

label("$A$", A, SW, labelpen);
label("$B$", B, SE, labelpen);
label("$C$", C, NE, labelpen);

label(Label("$\norm{v}$", Rotate(C-A)), AC, plain.N, labelpen);
label(Label("$\norm{v_\pi}$"), AB, plain.S, labelpen);
label(Label("$\norm{v_\bot}$"), BC, plain.E, labelpen);

markangle(Label("$\alpha$", Relative(0.5)), n = 1, radius=-15, B, C, A, myblue+0.4pt);

markangle(Label("$\theta$", Relative(0.5)), n = 2, radius=-20, C, A, B, myred+0.4pt);

shipout(prefix="triangle", format="pdf");
