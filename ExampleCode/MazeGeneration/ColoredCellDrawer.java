// Maze generation
import processing.core.PApplet;

/**
 * Displays a cell (do nothing).
 */
public class ColoredCellDrawer implements CellDisplayer
{
  private PApplet pa;
  private GraphicalMaze maze;
  /** Responsible of displaying a wall. */
  private WallDisplayer wallDisplayer;

  public ColoredCellDrawer(PApplet pApplet, GraphicalMaze m)
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
    pa.fill(cell.isBorderCell() ? pa.color(255, 100, 100, 64) : pa.color(100, 200, 255, 64));
    pa.noStroke();
    pa.rect(maze.getTopLeftX(cell), maze.getTopLeftY(cell),
        maze.getCellSize(), maze.getCellSize());

    wallDisplayer.display(cell, cell.getTopWall());
    wallDisplayer.display(cell, cell.getLeftWall());
  }
}
