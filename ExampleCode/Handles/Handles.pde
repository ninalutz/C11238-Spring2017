/**
Handles demo: draw handles than can be dragged with the mouse.
http://processing.org/

by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr & http://PhiLho.deviantART.com
*/
/* File/Project history:
 2.00.000 -- 2012/11/13 (PL) -- Separate Handle and HandleList, standard method names.
 1.01.000 -- 2010/01/29 (PL) -- Update to better code, added HandleList.
 1.00.000 -- 2008/04/29 (PL) -- Creation.
*/
/* Copyright notice: For details, see the following file:
http://Phi.Lho.free.fr/softwares/PhiLhoSoft/PhiLhoSoftLicense.txt
This program is distributed under the zlib/libpng license.
Copyright (c) 2008-2012 Philippe Lhoste / PhiLhoSoft
*/

final int HANDLE_NB = 10;
HandleList handles = new HandleList(false);

void setup()
{
  size(400, 400);
  smooth();

  // Create random handles
  for (int i = 0; i < HANDLE_NB; i++)
  {
    int size = int(random(15, 30));
    handles.add(new Handle(size + random(width - 2 * size), size + random(height - 2 * size),
        size, size / 5,
        color(random(0, 128), 0, 0), color(0, random(200, 255), 0),
        color(0, 0, random(200, 255)), color(random(200, 255), random(90, 140), 0)
    ));
  }
}

void draw()
{
  background(#AADDFF);

  handles.update();
}
