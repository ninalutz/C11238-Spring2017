// Maze generation
import processing.core.PApplet;

/**
 * Displays a cell (do nothing).
 */
public class EmptyCellDrawer implements CellDisplayer
{
  private PApplet pa;
  private GraphicalMaze maze;
  /** Responsible of displaying a wall. */
  private WallDisplayer wallDisplayer;

  public EmptyCellDrawer(PApplet pApplet, GraphicalMaze m)
  {
    pa = pApplet;
    maze = m;
  }

  public void setWallDisplayer(WallDisplayer wd)
  {
    wallDisplayer = wd;
  }

//  @Override
  public void display(Cell cell)
  {
    wallDisplayer.display(cell, cell.getTopWall());
    wallDisplayer.display(cell, cell.getLeftWall());
  }
}
