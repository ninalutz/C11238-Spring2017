// Maze generation

/** A graphical representation of a maze. */
public class GraphicalMaze
{
  /** The maze model. */
  private Maze maze;
  /** Base cell size, in pixels. */
  private int cellSize = 10;
  /** Wall thickness, in pixels. */
  private int wallThickness = 1;
  /** Responsible of displaying a cell. */
  private CellDisplayer cellDisplayer;

  public GraphicalMaze(int cn, int rn)
  {
    maze = new Maze(cn, rn);
  }
  public Maze getMaze()
  {
    return maze;
  }

  public void setCellSize(int cs)
  {
    cellSize = cs;
  }
  public int getCellSize()
  {
    return cellSize;
  }

  public void setWallThickness(int wt)
  {
    wallThickness = wt;
  }
  public int getWallThickness()
  {
    return wallThickness;
  }

  public void setCellDisplayer(CellDisplayer cd)
  {
    cellDisplayer = cd;
  }
  public void setWallDisplayer(WallDisplayer wd)
  {
    cellDisplayer.setWallDisplayer(wd);
  }

  public int getTopLeftX(Cell cell)
  {
    return cell.getColumn() * cellSize;
  }
  public int getTopLeftY(Cell cell)
  {
    return cell.getRow() * cellSize;
  }
  public int getWallWidth(Wall wall)
  {
    if (wall.getKind() == Wall.TOP)
    {
      return cellSize;
    }
    else
    {
      return wallThickness;
    }
  }
  public int getWallHeight(Wall wall)
  {
    if (wall.getKind() == Wall.TOP)
    {
      return wallThickness;
    }
    else
    {
      return cellSize;
    }
  }

  public void display()
  {
    for (Cell cell : maze)
    {
//      System.out.println(cell);
      cellDisplayer.display(cell);
    }
  }
}

