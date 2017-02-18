// Maze generation
import java.util.Random;
import java.util.Iterator;
import java.util.NoSuchElementException;

/** The rectangular maze. */
public class Maze implements Iterable<Cell>
{
  /** The number of visible columns. */
  private int colNb;
  /** The number of visible rows. */
  private int rowNb;
  /** The cells. */
  Cell[] cells;
  /** Random number generator. */
  Random randy = new Random(System.nanoTime());

  public Maze(int cn, int rn)
  {
    colNb = cn;
    rowNb = rn;
    InitMaze();
  }

  public void InitMaze()
  {
    // Create the cells, make room for the borders
    cells = new Cell[(rowNb + 2) * (colNb + 2)];
    for (int r = 0; r <= rowNb+1; r++)
    {
      for (int c = 0; c <= colNb+1; c++)
      {
        Cell cell = new Cell(this, r, c);
        cells[r * (colNb + 2) + c] = cell;
      }
    }
  }

  public int getRowNb() { return rowNb; }
  public int getColNb() { return colNb; }

  /**
   * Returns the cell at the given row and column.
   *
   * @param col  the column number, starting at 1
   * @param row  the row number, starting at 1
   * @return the cell at the given row and column.
   */
  public Cell getCell(int col, int row)
  {
    return cells[row * (colNb + 2) + col];
  }
  public Cell getRandomCell()
  {
    int row = getRandom(1, rowNb);
    int col = getRandom(1, colNb);
    return getCell(col, row);
  }

  public void carveEntries()
  {
    Cell tl = getCell(1, 1);
    tl.getTopWall().bringDown();
    Cell br = getCell(colNb, rowNb);
    br.getBottomWall().bringDown();
  }

  /**
   * Returns a random integer number between 'low' and 'high', included.
   */
  public int getRandom(int low, int high)
  {
    if (low >= high)
      return low;
    return low + randy.nextInt(high + 1 - low);
  }

// Processing seems to use a Java 1.5 compiler, not accepting override annotation for interface methods
//  @Override
  public Iterator<Cell> iterator()
  {
    return new CellIterator();
  }

  @Override
  public String toString()
  {
    return "Maze (" + rowNb + ", " + colNb + ")";
  }


  /**
   * An iterator on the cells of the maze.
   */
  private class CellIterator implements Iterator<Cell>
  {
    /** Current row. */
    int cursorRow;
    /** Current column. */
    int cursorCol;
    /** True if we have reached the end of the list of cells. */
    boolean bAtEnd;

    public CellIterator()
    {
    }

//    @Override
    public boolean hasNext()
    {
      return !bAtEnd;
    }

//    @Override
    public Cell next() throws NoSuchElementException
    {
      try
      {
        Cell next = cells[cursorRow * (colNb + 2) + cursorCol++];
        if (cursorCol > colNb + 1)
        {
          cursorCol = 0;
          cursorRow++;
          if (cursorRow > rowNb + 1)
          {
            bAtEnd = true;
          }
        }
        return next;
      }
      catch (ArrayIndexOutOfBoundsException e)
      {
        throw new NoSuchElementException();
      }
    }

//    @Override
    public void remove()
    {
      throw new UnsupportedOperationException();
    }
  }
}
