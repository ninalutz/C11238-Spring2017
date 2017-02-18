// Maze generation
import processing.core.PApplet;

/**
 * Displays a simple wall (a rectangle).
 */
public class ColoredWallDrawer implements WallDisplayer
{
  private PApplet pa;
  private GraphicalMaze maze;

  public ColoredWallDrawer(PApplet pApplet, GraphicalMaze m)
  {
    pa = pApplet;
    maze = m;
  }

//  @Override
  public void display(Cell cell, Wall wall)
  {
    if (wall == null)
      return; // Some cells has no wall
    if (!wall.isUp())
      return; // Don't draw a down wall

    if (wall.isHard())
    {
      pa.fill(wall.isTop() ? pa.color(150, 150, 100, 128) : pa.color(100, 150, 100, 128));
      pa.stroke(64, 128);
    }
    else
    {
      pa.fill(wall.isTop() ? pa.color(200, 200, 128, 64) : pa.color(128, 200, 128, 64));
      pa.stroke(128, 64);
    }
    float hwt = maze.getWallThickness() / 2;
    if (wall.isTop())
    {
      pa.rect(maze.getTopLeftX(cell), maze.getTopLeftY(cell) - hwt,
          maze.getWallWidth(wall), maze.getWallHeight(wall));
    }
    else
    {
      pa.rect(maze.getTopLeftX(cell) - hwt, maze.getTopLeftY(cell),
          maze.getWallWidth(wall), maze.getWallHeight(wall));
    }
  }
}

