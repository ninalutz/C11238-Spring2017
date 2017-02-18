// Maze generation
import processing.core.PApplet;

/**
 * Displays a simple wall (a rectangle).
 */
public class SimpleWallDrawer implements WallDisplayer
{
  private PApplet pa;
  private GraphicalMaze maze;

  public SimpleWallDrawer(PApplet pApplet, GraphicalMaze m)
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
      pa.fill(10, 0, 50);
    }
    else
    {
      pa.fill(50, 20, 180);
    }
    pa.noStroke();
    float wt = maze.getWallThickness();
    if (wall.isTop())
    {
      pa.rect(maze.getTopLeftX(cell), maze.getTopLeftY(cell),
          maze.getWallWidth(wall) + wt, maze.getWallHeight(wall));
    }
    else
    {
      pa.rect(maze.getTopLeftX(cell), maze.getTopLeftY(cell),
          maze.getWallWidth(wall), maze.getWallHeight(wall));
    }
  }
}

