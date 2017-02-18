// Maze generation
import java.util.*;

/** The Recursive backtracker algorithm. */
public class AlgoRecursiveBacktracker implements CarveAlgorithm
{
  private Deque<Cell> stack = new ArrayDeque<Cell>();
  private Maze maze;
  private Cell current;

  // States of the cells
  private static final int VISITED = 1;

  public AlgoRecursiveBacktracker(Maze m)
  {
    maze = m;
    current = maze.getRandomCell();
  }

//  @Override
  public void carveMaze()
  {
    if (current == null)
      return; // No more to draw
      
    current.setState(VISITED);
    Cell neigh = getRandomVirginNeighbor(current);
    if (neigh != null)
    {
      stack.addLast(current);
      Wall w = current.getWallWith(neigh);
      w.bringDown();
      current = neigh;
    }
    else
    {
      current = stack.pollLast();
    }
  }
  
//  @Override
  public boolean isFinished()
  {
    return current == null;
  }

  private Cell getRandomVirginNeighbor(Cell cell)
  {
//~     return maze.getCell(cell.getColumn() + 1, cell.getRow());
    Cell[] unvisitedCell = new Cell[4];
    int count = 0;
    Cell c = cell.getTopCell();
    if (c.getState() == Cell.STATE_VIRGIN)
    {
      unvisitedCell[count++] = c;
    }
    c = cell.getRightCell();
    if (c.getState() == Cell.STATE_VIRGIN)
    {
      unvisitedCell[count++] = c;
    }
    c = cell.getBottomCell();
    if (c.getState() == Cell.STATE_VIRGIN)
    {
      unvisitedCell[count++] = c;
    }
    c = cell.getLeftCell();
    if (c.getState() == Cell.STATE_VIRGIN)
    {
      unvisitedCell[count++] = c;
    }
    int n = maze.getRandom(0, count-1);
    return unvisitedCell[n]; // Can be null
  }
}
/* http://en.wikipedia.org/wiki/Maze_generation_algorithm
   1. Mark the current cell as 'Visited'
   2. If the current cell has any neighbours which have not been visited
         1. Choose randomly one of the unvisited neighbours
         2. add the current cell to the stack
         3. remove the wall between the current cell and the chosen cell
         4. Make the chosen cell the current cell
         5. Recursively call this function
   3. else
         1. remove the last current cell from the stack
         2. Backtrack to the previous execution of this function
*/
