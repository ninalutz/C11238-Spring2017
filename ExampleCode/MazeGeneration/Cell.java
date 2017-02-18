// Maze generation

/**
 * A generic simple cell of the maze.
 * <p>
 * A cell can be on the border of the maze (it isn't drawn, one of its wall can be drawn),
 * or in the maze itself.<br>
 * A border cell has 0 (on top and left borders) or 1 wall.<br>
 * A maze cell has two walls: top and left.
 */
public class Cell
{
  /** Coordinates of the cell. Row. 0 = top row. verticalMazeDim+1 = bottom row. */
  private int row;
  /** Coordinates of the cell. Column. 0 = left column. horizontalMazeDim+1 = right row. */
  private int column;
  /** Top wall. */
  private Wall topWall;
  /** Left wall. */
  private Wall leftWall;
  /** The maze the cell belongs to. Allows to access neighbor cells. */
  private Maze maze;
  /** An integer "state", whose value will depend on the algorithm (eg. virgin vs. visited) */
  private int state;
  // The base states
  public static final int STATE_VIRGIN = 0;
  public static final int STATE_BORDER = -1;

  public Cell(Maze m, int r, int c)
  {
    maze = m;
    row = r;
    column = c;
    if (r == 0 || r == maze.getRowNb()+1 || c == 0 || c == maze.getColNb()+1)
    {
      state = STATE_BORDER;
    }
    if (r != 0 && c != 0)
    {
      if (c != maze.getColNb()+1)
      {
        topWall = new Wall(Wall.TOP);
        if (r == 1 || r == maze.getRowNb()+1)
        {
          topWall.setAsHard();
        }
      }
      if (r != maze.getRowNb()+1)
      {
        leftWall = new Wall(Wall.LEFT);
        if (c == 1 || c == maze.getColNb()+1)
        {
          leftWall.setAsHard();
        }
      }
    }
  }

  public boolean isBorderCell()
  {
    return topWall == null || leftWall == null;
  }

  public Cell getLeftCell()
  {
    return maze.getCell(column-1, row);
  }
  public Cell getRightCell()
  {
    return maze.getCell(column+1, row);
  }
  public Cell getTopCell()
  {
    return maze.getCell(column, row-1);
  }
  public Cell getBottomCell()
  {
    return maze.getCell(column, row+1);
  }

  public Wall getTopWall()
  {
    return topWall;
  }
  public Wall getLeftWall()
  {
    return leftWall;
  }
  public Wall getBottomWall()
  {
    return getBottomCell().getTopWall();
  }
  public Wall getRightWall()
  {
    return getRightCell().getLeftWall();
  }

  public int getRow()
  {
    return row;
  }
  public int getColumn()
  {
    return column;
  }

  public int getState()
  {
    return state;
  }
  public void setState(int s)
  {
    state = s;
  }

  public Wall getRandomSoftWall()
  {
    Wall[] upWalls = new Wall[4];
    int count = 0;
    if (!topWall.isUpAndSoft())
    {
      upWalls[count++] = topWall;
    }
    if (!leftWall.isUpAndSoft())
    {
      upWalls[count++] = leftWall;
    }
    Wall bottomWall = getBottomWall();
    if (!bottomWall.isUpAndSoft())
    {
      upWalls[count++] = bottomWall;
    }
    Wall rightWall = getRightWall();
    if (!rightWall.isUpAndSoft())
    {
      upWalls[count++] = rightWall;
    }
    int n = maze.getRandom(0, count-1);
    return upWalls[n]; // Can be null
  }

  /**
   * Get the wall between this cell and the given neighbor cell.
   */
  public Wall getWallWith(Cell neighbor)
  {
    if (row == neighbor.getRow())
    {
      // Cell is on left or on right
      if (column == neighbor.getColumn()+1)
      {
        return leftWall;
      }
      if (column == neighbor.getColumn()-1)
      {
        return neighbor.getLeftWall();
      }
    }
    else if (column == neighbor.getColumn())
    {
      // Cell is on top or on bottom
      if (row == neighbor.getRow()+1)
      {
        return topWall;
      }
      if (row == neighbor.getRow()-1)
      {
        return neighbor.getTopWall();
      }
    }
    assert false : "Cell " + neighbor + " isn't a neighbor of cell " + this;
    return null;
  }

  @Override public String toString()
  {
    return "Cell (" + row + ", " + column + ") [" + topWall + "; " + leftWall + "]";
  }
}
