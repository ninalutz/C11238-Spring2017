/**
AnimatedHeart1.pde: Draw an animated heart in Processing.
http://processing.org/

by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr & http://PhiLho.deviantART.com
*/
/* File/Project history:
 1.00.000 -- 2008/04/29 (PL) -- Creation.
*/
/* Copyright notice: For details, see the following file:
http://Phi.Lho.free.fr/softwares/PhiLhoSoft/PhiLhoSoftLicence.txt
This program is distributed under the zlib/libpng license.
Copyright (c) 2008 Philippe Lhoste / PhiLhoSoft
*/

final int CANVAS_HEIGHT = 400;
final int CANVAS_WIDTH = 400;
Heart g_h;
float g_size;
final int MAX_PULSE = 20;
int g_pulse = 0;
final float MIN_FACTOR = 0.5, MAX_FACTOR = 1.2;

void setup()
{
	smooth();
	size(CANVAS_HEIGHT, CANVAS_WIDTH);

	g_size = CANVAS_WIDTH / 3;
	g_h = new Heart(CANVAS_WIDTH / 2, CANVAS_HEIGHT / 3, g_size, #800000, #AA5555);
}

void draw()
{
	background(#00AAFF);
	g_h.Draw();
	g_pulse = ++g_pulse % MAX_PULSE;
	float factor = sin((float) TWO_PI * g_pulse / MAX_PULSE);	// -1 to +1
	// Clamp the factor
	factor = MIN_FACTOR + (MAX_FACTOR - MIN_FACTOR) * (factor + 1.0) / 2;
	g_h.m_size = g_size * factor;
	g_h.Update();
	delay(40);
}
