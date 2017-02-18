/*
PhiLhoSoft's Processing sketches.
http://processing.org/

by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr & http://PhiLho.deviantART.com
*/
/* File/Project history:
 2.00.000 -- 2012/11/13 (PL) -- Separate Handle and HandleList, standard method names.
*/
/* Copyright notice: For details, see the following file:
http://Phi.Lho.free.fr/softwares/PhiLhoSoft/PhiLhoSoftLicense.txt
This program is distributed under the zlib/libpng license.
Copyright (c) 2008-2012 Philippe Lhoste / PhiLhoSoft
*/

/**
 * A list of handles.
 */
class HandleList
{
  private ArrayList<Handle> m_handles = new ArrayList<Handle>();
  private boolean m_bDragging;
  private boolean m_bGroupDragging; // True if you want to be able to drag several handles at once (if they are on the same position)

  HandleList()
  {
  }

  HandleList(boolean bGroupDragging)
  {
    m_bGroupDragging = bGroupDragging;
  }

  void add(Handle h)
  {
    m_handles.add(h);
  }

  void update()
  {
    // We suppose we are not dragging by default
    boolean bDragging = false;
    // Check each handle
    for (Handle h : m_handles)
    {
      // Check if the user tries to drag it
      h.update(m_bDragging);
      // Ah, this one is indeed dragged!
      if (h.isDragged())
      {
        // We will remember a dragging is being done
        bDragging = true;
        if (!m_bGroupDragging)
        {
          m_bDragging = true; // Notify immediately we are dragging something
        }
        // And we move it to the mouse position
        h.move();
      }
      // In all cases, we redraw the handle
      h.display();
    }
    // If no dragging is found, we reset the state
    m_bDragging = bDragging;
  }
}
