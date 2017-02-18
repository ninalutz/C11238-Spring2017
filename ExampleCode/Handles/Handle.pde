/*
PhiLhoSoft's Processing sketches.
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

/**
 * A circle that can be dragged with the mouse.
 */
class Handle
{
  // Lazy (Processing) class: leave direct access to parameters... Avoids having lot of accessors.
  float m_x, m_y; // Position of handle
  int m_size; // Diameter of handle
  int m_lineWidth;
  color m_colorLine;
  color m_colorFill;
  color m_colorHover;
  color m_colorDrag;

  private boolean m_bIsHovered, m_bDragged;
  private float m_clickDX, m_clickDY;

  /**
   * Simple constructor with hopefully sensible defaults.
   */
  Handle(float x, float y)
  {
    this(x, y, 5, 1, #000000, #FFFFFF, #FFFF00, #FF8800);
  }

  /**
   * Full constructor.
   */
  Handle(float x, float y, int size, int lineWidth,
      color colorLine, color colorFill, color colorHover, color colorDrag
  )
  {
    m_x = x; m_y = y;
    m_size = size;
    m_lineWidth = lineWidth;
    m_colorLine = colorLine;
    m_colorFill = colorFill;
    m_colorHover = colorHover;
    m_colorDrag = colorDrag;
  }

  /**
   * Updates the state of the handle depending on the mouse position.
   *
   * @param bAlreadyDragging  if true, a dragging is already in effect
   */
  void update(boolean bAlreadyDragging)
  {
    // Check if mouse is over the handle
    m_bIsHovered = dist(mouseX, mouseY, m_x, m_y) <= m_size / 2;
    // If we are not already dragging and left mouse is pressed over the handle
    if (!bAlreadyDragging && mousePressed && mouseButton == LEFT && m_bIsHovered)
    {
      // We record the state
      m_bDragged = true;
      // And memorize the offset of the mouse position from the center of the handle
      m_clickDX = mouseX - m_x;
      m_clickDY = mouseY - m_y;
    }
    // If mouse isn't pressed
    if (!mousePressed)
    {
      // Any possible dragging is stopped
      m_bDragged = false;
    }
  }

  boolean isDragged()
  {
    return m_bDragged;
  }

   /**
    * If the handle is dragged, the new position is computed with mouse position,
    * taking in account the offset of mouse with center of handle.
    */
  void move()
  {
    if (m_bDragged)
    {
      m_x = mouseX - m_clickDX;
      m_y = mouseY - m_clickDY;
    }
  }

   /**
    * Just draw the handle at current posiiton, with color depending if it is dragged or not.
    */
  void display()
  {
    strokeWeight(m_lineWidth);
    stroke(m_colorLine);
    if (m_bDragged)
    {
      fill(m_colorDrag);
    }
    else if (m_bIsHovered)
    {
      fill(m_colorHover);
    }
    else
    {
      fill(m_colorFill);
    }

    ellipse(m_x, m_y, m_size, m_size);
  }
}
