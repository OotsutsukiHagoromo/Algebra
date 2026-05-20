// ============================= Толщина линии ================================
/*
 * Размеры TikZ
 * ultra thin  % 0.1 pt
 * very thin   % 0.2 pt
 * thin        % 0.4 pt (стандартная толщина по умолчанию)
 * semithick   % 0.6 pt
 * thick       % 0.8 pt
 * very thick  % 1.2 pt
 * ultra thick % 1.6 pt
 */

// pen ultrathin   = pen(0.1pt);
// pen verythin    = pen(0.2pt);
// pen thin        = pen(0.4pt);
// pen semithick   = pen(0.6pt);
// pen thick       = pen(0.8pt);
// pen verythick   = pen(1.2pt);
// pen ultrathick  = pen(1.6pt);

defaultpen(1.0pt);
dotfactor = 4;
pen axispen = black + 0.4pt;
pen commentpen = gray + 0.4pt;
pen toaxis = commentpen + dashed;

// ==========================	Преамбула для LaTeX =============================

texpreamble("\usepackage[utf8]{inputenc}");
texpreamble("\usepackage[T2A, T1]{fontenc}");
texpreamble("\usepackage{xcolor}");
texpreamble("\usepackage{amsmath}");
texpreamble("\usepackage[main=russian, english]{babel}");
texpreamble("\usepackage[libertinus, vvarbb, varg]{newtx}");

// ================================	Цвета ==================================

// pen myred  = HTML("9B2226");
// pen myblue = HTML("0A9396");
pen myred  = RGB(155, 34, 38);
pen myblue = RGB(10, 147, 150);

texpreamble("\definecolor{myred}{HTML}{9B2226}");
texpreamble("\definecolor{mublue}{HTML}{0A9396}");

// ================================	Цвета ЦУ ==================================

real rgbmax = 255.0;

pen pena = RGB(136, 119, 251);
pen penb = RGB( 78, 166, 151);
pen penc = RGB(235, 116, 115);
pen pend = RGB(229, 119, 238);
pen pene = RGB(116, 194, 112);

pen tred   = penc;
pen tgreen = penb;
pen tblue  = pena;

// pen tcolorg = HTML(00A651);
pen tcolorg = RGB(0, 166, 81);

tgreen = tcolorg;


texpreamble("\definecolor{pena}{RGB}{136, 119, 251}");
texpreamble("\definecolor{penb}{RGB}{ 78, 166, 151}");
texpreamble("\definecolor{penc}{RGB}{235, 116, 115}");
texpreamble("\definecolor{pend}{RGB}{229, 119, 238}");
texpreamble("\definecolor{pene}{RGB}{116, 194, 112}");
texpreamble("\definecolor{tcolorg}{RGB}{0, 166, 81}");

texpreamble("\colorlet{tred}{penc}");
// texpreamble("\colorlet{tgreen}{penb}");
texpreamble("\colorlet{tblue}{pena}");
texpreamble("\colorlet{tgreen}{tcolorg}");


// ============================	Размеры картинки ==============================

unitsize(1.0cm);
size(9cm, 0);

string vphantomstring = "\vphantom{$y^*$}";

// ========================	Вспомогательные функции ===========================

void drawGrid(real maxx, real maxy)
{
	for (int i = 1; i < maxx; ++i)
		draw((i, 0)--(i, maxy), gray);
	for (int j = 1; j < maxy; ++j)
		draw((0, j)--(maxx, j), gray);
}

path makeLabelPath(pair labelPoint, pair arrowPoint, real r = 2, real anglemax=-85)
{
	pair origin = labelPoint - (r, 0);
	path labelPath = arc(origin, r, -15, anglemax);
	return labelPath;
}

void drawToYAxis(pair p, picture pict=currentpicture)
{
	draw(pict, p--(0, p.y), toaxis);
}

void drawToXAxis(pair p, picture pict=currentpicture)
{
	draw(pict, p--(p.x, 0), toaxis);
}

void drawToAxis(pair p, picture pict=currentpicture)
{
	drawToXAxis(p, pict);
	drawToYAxis(p, pict);
}

// Возвращает барицентр выпуклой оболочки набора точек
pair getCenterOfPoints(pair [] arr)
{
	pair center = (0, 0);

	for (pair p : arr)
		center += p;
	
	return center / arr.length;
}

// Возвращает вектор единичной длины в направлении биссектрисы
pair getBissect(pair p, pair a, pair b)
{
	return unit(unit((a-p)) + unit((b-p)));
}

pair getNorm(pair p, pair a)
{
	pair v = p - a;
	return unit((v.y, -v.x));
}

real quadratic(real x, real a, real x_, real y_)
{
	return a * (x - x_)^2 + y_;
}

pair pX(pair a)
{
	return (a.x, 0);
}

pair pY(pair a)
{
	return (0, a.y);
}

// ==========================	Преамбула для LaTeX =============================

texpreamble("\newcommand*{\ket}[1]{\left|#1\right>}");
texpreamble("\newcommand*{\abs}[1]{\left|#1\right|}");
texpreamble("\newcommand*{\norm}[1]{\left\|#1\right\|}");
texpreamble("\renewcommand*{\Re}{\mathop{\mathrm{Re}}}");
texpreamble("\renewcommand*{\Im}{\mathop{\mathrm{Im}}}");

